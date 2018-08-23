using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using JurassicBark.DATA.EF;
using Microsoft.AspNet.Identity;
using JurassicBark.UI.MVC.Models.Extensions;
using JurassicBark.UI.MVC.Models;
using System.Web.Security;

namespace JurassicBark.UI.MVC.Controllers
{
    public class ReservationsController : Controller
    {
        private jurassicbarkEntities db = new jurassicbarkEntities();
        public UnitOfWork uow = new UnitOfWork();

        // GET: Reservations
        [Authorize]
        public ActionResult Index()
        {

            string currentUser = User.Identity.GetUserId();
            //Added this code to limit the number of previous reservations shown. Sets a date 2 days in the past as 
            //the starting point for the reservations list.
            DateTime dt = DateTime.Now.AddDays(-2);
            var reservations = db.Reservations.Include(r => r.Pet).Include(r => r.ResortLocation).OrderBy(r => r.ReservationDate).Where(r => r.ReservationDate >= dt);

            if (User.IsInRole("Customer") && !User.IsInRole("Admin"))
            {
                reservations = reservations.Where(r => r.Pet.OwnerID == currentUser).OrderBy(r => r.ReservationDate);
            }
            ViewBag.Warning = TempData["Warning"];
            ViewBag.Confirmation = TempData["Confirmation"];
            ViewBag.Toggle = TempData["Toggle"];
            return View(reservations.ToList());
        }

        // GET: Reservations
        [Authorize]
        public ActionResult Today()
        {

            List<Reservation> reservations = uow.ReservationRepository.Get().Where(r => r.ReservationDate.ToShortDateString() == DateTime.Now.ToShortDateString()).ToList();

            string currentUser = User.Identity.GetUserId();

            if (User.IsInRole("Customer") && !User.IsInRole("Admin"))
            {
                reservations = reservations.Where(r => r.Pet.OwnerID == currentUser).OrderBy(r => r.Pet.Name).ToList();
            }

            return View(reservations);
        }
        // GET: Reservations/Details/5
        [Authorize]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // GET: Reservations/Create/4
        //The INT id passed to this controller corresponds to the ResortLocationID and allows
        //the form to be prepopulated with the selected Resort. This is very useful for
        //integrating static links (like through the map or via QRF files).
        [Authorize]
        public ActionResult Create(int? id)
        {
            //Employees can't make reservations. This routes employees back to the Index should they attempt
            //to access the controller through direct URL request.
            #region Handle Employees trying to make reservations via HTTP
            if (User.IsInRole("Employee"))
            {
                return View("Index");

            } 
            #endregion

            #region Checks if Customer has a Pet. If not, routes the user to the Create() Pets View.

            //Identify the current user for filtering of records based on AspNetUserID
            string currentUser = User.Identity.GetUserId();
            
            //Generate a complete list of all pets for the drop-down. This will be filtered later by user role
            List<Pet> myPets = uow.PetRepository.Get().Where(p => p.OwnerID == currentUser).ToList();
            
            //Check if the customer has any pets by getting the count of records in their myPets list.
            //If less than one, route the customer to the Create() controller.
            if (myPets.Count < 1)
            {
                return RedirectToAction("Create", "Pets");
            }
            #endregion

            #region Display only the specific Customer's Reservations
            //Since a customer should only see their pets, we limit the list of pets based on
            //the current user's AspNetUserID if they are in a customer role
            if (User.IsInRole("Customer"))
            {
                ViewBag.PetID = new SelectList(myPets, "PetID", "Name");
            }
            #endregion

            #region Create List of All Reservations for Admin to view
            //The Admin should see ALL pets as an option. So we "revert" back to the default
            //list of pets from the repository
            if (User.IsInRole("Admin"))
            {
                ViewBag.PetID = new SelectList(uow.PetRepository.Get(), "PetID", "Name");
            } 
            #endregion

            /*Using the nullable int id, create a SelectList with the passed value of id as the sole item. This allows 
            for incoming links from other controllers to specify which Resort will be selected. This is especially 
            useful from the Locations/Index, where the count of Today's Reservations is shown next to the Limit for
            Reservations. It also let's the user determine the location from the map and know they are selecting the 
            same location.*/
            if (id != null)
            {
                ViewBag.ResortLocationID = new SelectList(uow.ResortLocationRepository.Get()
                    .Where(r => r.ResortLocationID == id)
                    .ToList(), "ResortLocationID", "ResortName", id);
            }
            else
            {
                ViewBag.ResortLocationID = new SelectList(db.ResortLocations, "ResortLocationID", "ResortName");
            }
            
            return View();
        }


        // POST: Reservations/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create([Bind(Include = "ReservationID,ResortLocationID,PetID,ReservationDate")] Reservation reservation)
        {
            #region Checks if Customer has a Pet. If not, routes the user to the Create() Pets View.

            //Identify the current user for filtering of records based on AspNetUserID
            string currentUser = User.Identity.GetUserId();

            //Generate a complete list of all pets for the drop-down. This will be filtered later by user role
            List<Pet> myPets = uow.PetRepository.Get().Where(p => p.OwnerID == currentUser).ToList();

            //Check if the customer has any pets by getting the count of records in their myPets list.
            //If less than one, route the customer to the Create() controller.
            if (myPets.Count < 1)
            {
                return RedirectToAction("Create", "Pets");
            }
            #endregion

            if (User.IsInRole("Employee"))
            {
                return View("Index");
            }
            //*****************************************************//
            /*Setup the confirmation email variables here, while the reservation object still has values, if
            the variables are set AFTER the db.Save() ... the reservation values are reset and everything
            becomes a null string.
            /***********************************************************/
            //The Resort and Pet object will be used to generate the reservation and the confirmation email;
            ResortLocation resort = uow.ResortLocationRepository.Find(reservation.ResortLocationID);
            Pet userPet = uow.PetRepository.Find(reservation.PetID);
            //Get currentUser Email;
            //Create new user, which gives access to AspNetUser via Navigational properties
            UserDetail user = db.UserDetails.Include(u => u.AspNetUser)
                .Where(u => u.AspNetUserId == currentUser).First();
            string currentEmail = user.AspNetUser.Email;
            //Get Pet Owner Name using custom functions in Identity.Extensions
            string petOwner = $"{User.Identity.GetFirstName().Trim()} {User.Identity.GetLastName().Trim()}";
            //Create additional variables for the Email Content:
            string resortName = resort.ResortName;
            string address = resort.Address;
            string city = resort.City;
            string state = resort.State;
            string zip = resort.ZipCode.ToString();
            string pet = userPet.Name;
            string date = reservation.ReservationDate.ToShortDateString();
            string petImage = "<img src='~/Content/images/pets/t_" + userPet.PetPhoto + "' />";
            string mapImage = "<img src='~/Content/images/Maps/" + resort.ResortLocationID + ".png' />";
            
            if (ModelState.IsValid)
            {
                //Count number of reservations for each resort
                int countReservations = db.Reservations.Where(r => r.ReservationDate == reservation.ReservationDate && r.ResortLocationID == reservation.ResortLocationID).Count();
                if (User.IsInRole("Admin"))
                {
                    db.Reservations.Add(reservation);
                    db.SaveChanges();
                    TempData["Confirmation"] = "Your reservation is confirmed!";
                    TempData["Toggle"] = true;
                    return RedirectToAction("Index");
                }
                if (User.IsInRole("Customer") && countReservations < resort.ReservationLimit)
                {
                    resort = db.ResortLocations.Where(r => r.ResortLocationID == reservation.ResortLocationID).FirstOrDefault();
                
                    db.Reservations.Add(reservation);
                    db.SaveChanges();

                    #region Email Confirmation of Reservation
                    //Create the message content (with HTML) from [reservation] object. Use navigation
                    //properties to bring in ResortLocation information and Pet's name
                    string messageContent = $"<p>Dear {petOwner},<br /><br />You have a reservation at {resortName} located at {address}, {city}, {state} {zip} on {date}.</p><div><div style='width:100px height:100px;'>{petImage}</div><div style='width:100px; height:100px;'>{mapImage}</div></div><p>Please notify Jurassic Bark if you require any special items for {pet}, or edit your current 'Special Note' on your pet's profile. We look forward to seeing you soon!</p><p>Sincerely,<br /> <br /> Jurassic Bark</p><br /><br /><br /><strong>'Jurassic Bark: Where everyone is a good boy or a clever girl.'</strong>";

                    ContactViewModel contact = new ContactViewModel();
                    //Default DateSent is Now
                    contact.DateSent = DateTime.Now;
                    //Set Subject for confirmation message
                    contact.Subject = $"Jurassic Bark Reservation for {pet}";
                    //Create new MailMessage. Arguments are [FROM ADDRESS], [TO ADDRESS], [SUBJECT],
                    //[CONTENT]
                    MailMessage m = new MailMessage("no-reply@codingbychad.com", currentEmail, contact.Subject, messageContent);
                    //Message content uses HTML, set this to TRUE
                    m.IsBodyHtml = true;
                    //Set the REPLY-TO address:
                    m.ReplyToList.Add("no-reply@codingbychad.com");
                    //Create the post office to sent the message:
                    SmtpClient client = new SmtpClient("mail.codingbychad.com");
                    //Enter the credentials for the mail server:
                    client.Credentials = new NetworkCredential("no-reply@codingbychad.com", "M@774ew.");
                    //Sent the message:
                    using (client)
                    {
                        try
                        {
                            client.Send(m);
                        }
                        catch (Exception)
                        {
                            //Custom error with "branding."
                            ViewBag.EmailError = "There was an error sending your confirmation email. Please use the 'My Reservations' link to verify your reservation was received.";
                            throw;
                        }
                    }

                    #endregion
                    //Sending a confirmation message to the INDEX Action in Reservations Controller.
                    //If the message is NULL, the confirmation dialog will be hidden.
                    TempData["Toggle"] = true;
                    TempData["Confirmation"] = "Your reservation is confirmed!";
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Warning = "The Jurassic Bark location you have chosen is fully booked for the date indicated. Please try another date. Or notify our offices to request an over-flow space.";
                    ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name", reservation.PetID);
                    ViewBag.ResortLocationID = new SelectList(db.ResortLocations, "ResortLocationID", "ResortName", reservation.ResortLocationID);
                    ViewBag.Toggle = true; 
                    return View(reservation);
                }
            }
            

            ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name", reservation.PetID);
            ViewBag.ResortLocationID = new SelectList(db.ResortLocations, "ResortLocationID", "ResortName", reservation.ResortLocationID);
            ViewBag.Error = "Your reservation could not be accepted. Please check your reservation request and try again.";
            ViewBag.Toggle = false;
            return View(reservation);
            
        }

        // GET: Reservations/Edit/5
        [Authorize(Roles = "Admin, Customer")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name", reservation.PetID);
            ViewBag.ResortLocationID = new SelectList(db.ResortLocations, "ResortLocationID", "ResortName", reservation.ResortLocationID);
            return View(reservation);
        }

        // POST: Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Edit([Bind(Include = "ReservationID,ResortLocationID,PetID,ReservationDate")] Reservation reservation)
        {
            //Count number of reservations for each resort
            int countReservations = db.Reservations.Where(r => r.ReservationDate == reservation.ReservationDate && r.ResortLocationID == reservation.ResortLocationID).Count();

            if (ModelState.IsValid)
            {
                //This Resort and Pet object will be used by both to generate the reservation and confirmation email;
                ResortLocation resort = uow.ResortLocationRepository.Find(reservation.ResortLocationID);
                Pet userPet = uow.PetRepository.Find(reservation.PetID);
                //Get currentUser Identity;
                string currentUser = User.Identity.GetUserId();
                //Get currentUser Email;
                string currentEmail = User.Identity.GetUserName();
                //Get Pet Owner Name using custom functions in Identity.Extensions
                string petOwner = $"{User.Identity.GetFirstName().Trim()} {User.Identity.GetLastName().Trim()}.";
                //Create additional variables for the Email Content:
                string resortName = resort.ResortName.Trim();
                string address = resort.Address.Trim();
                string city = resort.City.Trim();
                string state = resort.State;
                string zip = resort.ZipCode.ToString();
                string pet = userPet.Name.Trim();
                string date = reservation.ReservationDate.ToShortDateString();
                string petImage = "<img src='~/Content/images/pets/t_" + userPet.PetPhoto.Trim() + "/>";
                string mapImage = "<img src='~/Content/images/Maps/" + resort.ResortLocationID + ".png' />";


                if (User.IsInRole("Admin") || (User.IsInRole("Customer") && countReservations < resort.ReservationLimit))
                {
                    db.Entry(reservation).State = EntityState.Modified;
                    db.SaveChanges();

                    if (User.IsInRole("Customer"))
                    {
                        #region Email Confirmation of Reservation
                        //Create the message content (with HTML) from [reservation] object. Use navigation
                        //properties to bring in ResortLocation information and Pet's name
                        string messageContent = $"<p>Dear {petOwner},<br /><br />You have a reservation at {resortName} located at {address}, {city}, {state} {zip} on {date}.</p><div><div style='width:100px height:100px;'>{petImage}</div><div style='width:100px; height:100px;'>{mapImage}</div></div><p>Please notify Jurassic Bark if you require any special items for {pet}, or edit your current 'Special Note' on your pet's profile. We look forward to seeing you soon!</p><p>Sincerely,<br /> <br /> Jurassic Bark</p><br /><br /><br /><strong>'Jurassic Bark: Where everyone is a good boy or a clever girl.'</strong>";

                        ContactViewModel contact = new ContactViewModel();
                        //Default DateSent is Now
                        contact.DateSent = DateTime.Now;
                        //Set Subject for confirmation message
                        contact.Subject = $"Jurassic Bark Reservation for {pet}";
                        //Create new MailMessage. Arguments are [FROM ADDRESS], [TO ADDRESS], [SUBJECT],
                        //[CONTENT]
                        MailMessage m = new MailMessage("no-reply@codingbychad.com", currentEmail, contact.Subject, messageContent);
                        //Message content uses HTML, set this to TRUE
                        m.IsBodyHtml = true;
                        //Set the REPLY-TO address:
                        m.ReplyToList.Add("no-reply@codingbychad.com");
                        //Create the post office to sent the message:
                        SmtpClient client = new SmtpClient("mail.codingbychad.com");
                        //Enter the credentials for the mail server:
                        client.Credentials = new NetworkCredential("no-reply@codingbychad.com", "M@774ew.");
                        //Sent the message:
                        using (client)
                        {
                            try
                            {
                                client.Send(m);
                            }
                            catch (Exception)
                            {
                                //Custom error with "branding."
                                ViewBag.EmailError = "There was an error sending your confirmation email. Please use the 'My Reservations' link to verify your reservation was received.";
                                throw;
                            }
                            ViewBag.Confirmation = "Your reservation is confirmed!";

                        }

                        #endregion
                    }

                    TempData["Confirmation"] = "Your reservation is confirmed!";
                    TempData["Toggle"] = true;
                    return RedirectToAction("Index");
                }
                if (countReservations >= resort.ReservationLimit)
                {
                    ViewBag.Warning = "The Jurassic Bark location you have chosen is fully booked for the date indicated. Please try another date. Or notify our offices to request an over-flow space.";
                    ViewBag.Toggle = true;
                    return View(reservation);
                }
                
                    TempData["Warning"] = "You cannot edit this Jurassic Bark reservation at this time. Please contact our team if you need assistance.";
                    TempData["Toggle"] = true;
                
                return RedirectToAction("Index", uow.ReservationRepository.Get());
            }
            ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name", reservation.PetID);
            ViewBag.ResortLocationID = new SelectList(db.ResortLocations, "ResortLocationID", "ResortName", reservation.ResortLocationID);
            return View(reservation);
        }

        // GET: Reservations/Delete/5
        [Authorize]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // POST: Reservations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult DeleteConfirmed(int id)
        {
            if (User.IsInRole("Admin") || User.IsInRole("Customer"))
            {
                Reservation reservation = db.Reservations.Find(id);
                db.Reservations.Remove(reservation);
                db.SaveChanges();
            }
            TempData["Confirmation"] = "Your reservation has been cancelled.";
            TempData["Toggle"] = true;
            return RedirectToAction("Index",uow.ReservationRepository.Get());
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
