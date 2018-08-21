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

            var reservations = db.Reservations.Include(r => r.Pet).Include(r => r.ResortLocation).OrderBy(r => r.ReservationDate);

            if (User.IsInRole("Customer") && !User.IsInRole("Admin"))
            {
                reservations = reservations.Where(r => r.Pet.OwnerID == currentUser).OrderBy(r => r.ReservationDate);
            }

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
            //Identify the current user for filtering of records based on AspNetUserID
            string currentUser = User.Identity.GetUserId();

            //Generate a complete list of all pets for the drop-down. This will be filtered later by user role
            List<Pet> myPets = uow.PetRepository.Get().Where(p => p.OwnerID == currentUser).ToList();

            //Since a customer should only see their pets, we limit the list of pets based on
            //the current user's AspNetUserID if they are in a customer role
            if (User.IsInRole("Customer"))
            {
                ViewBag.PetID = new SelectList(myPets, "PetID", "Name");
            }

            //The Admin should see ALL pets as an option. So we "revert" back to the default
            //list of pets from the repository
            if (User.IsInRole("Admin"))
            {
                ViewBag.PetID = new SelectList(uow.PetRepository.Get(), "PetID", "Name");
            }
            //Using the nullable int id, create a SelectList with the passed value of id as the sole item. This allows for incoming links from other controllers to specify which Resort will be selected. This is especially useful from the Locations/Index, where the count of Today's Reservations is shown next to the Limit for Reservations. It also let's the user determine the location from the map and know they are selecting the same location.
            if (id != null)
            {
                ViewBag.ResortLocationID = new SelectList(uow.ResortLocationRepository.Get().Where(r => r.ResortLocationID == id).ToList(), "ResortLocationID", "ResortName", id);
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
            //Assign User to UserID
            string currentUser = User.Identity.GetUserId();
            ResortLocation resort = new ResortLocation();
            if (ModelState.IsValid)
            {
                //Count number of reservations for each resort
                int countReservations = db.Reservations.Where(r => r.ReservationDate == reservation.ReservationDate && r.ResortLocationID == reservation.ResortLocationID).Count();
                if (User.IsInRole("Admin"))
                {
                    db.Reservations.Add(reservation);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                if (User.IsInRole("Customer"))
                {
                    resort = db.ResortLocations.Where(r => r.ResortLocationID == reservation.ResortLocationID).FirstOrDefault();
                }
                if (countReservations < resort.ReservationLimit)
                {
                    db.Reservations.Add(reservation);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Warning = "The Jurassic Bark location you have chosen is fully booked for the date indicated. Please try another date. Or notify our offices to request an over-flow space.";
                }

            }

            ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name", reservation.PetID);
            ViewBag.ResortLocationID = new SelectList(db.ResortLocations, "ResortLocationID", "ResortName", reservation.ResortLocationID);



            #region Email Confirmation of Reservation
            //Get user email address from Pet.AspNetUser navigation links
            string userEmail = reservation.Pet.AspNetUser.Email;
            //Get Pet Owner Name using custom functions in Identity.Extensions
            string petOwner = $"{User.Identity.GetFirstName()} {User.Identity.GetLastName()}";
            //Create additional variables for the Email Content:
            string resortName = reservation.ResortLocation.ResortName;
            string address = reservation.ResortLocation.Address;
            string city = reservation.ResortLocation.City;
            string state = reservation.ResortLocation.State;
            string zip = reservation.ResortLocation.ZipCode.ToString();
            string pet = reservation.Pet.Name;
            string date = reservation.ReservationDate.ToShortDateString();

            //Create the message content (with HTML) from [reservation] object. Use navigation
            //properties to bring in ResortLocation information and Pet's name
            string messageContent = $"<p>Dear {petOwner},<br /><br />You have a reservation at {resortName} located at {address}, {city}, {state} {zip} on {date}.</p>" +
                $"<p>Please notify Jurassic Bark if you require any special items for {pet}, or edit your current 'Special Note' on your pet's profile. We look forward to seeing you soon!</p> <p>Sincerely,<br /> <br /> Jurassic Bark</p><br /><br /><br /><strong>Jurassic Bark: Where everyone is a good boy or a clever girl.</strong>";

            ContactViewModel contact = new ContactViewModel();
            //Default DateSent is Now
            contact.DateSent = DateTime.Now;
            //Set Subject for confirmation message
            contact.Subject = $"Jurassic Bark Reservation for {pet}";
            //Create new MailMessage. Arguments are [FROM ADDRESS], [TO ADDRESS], [SUBJECT],
            //[CONTENT]
            MailMessage m = new MailMessage("no-reply@codingbychad.com", "chad.e.smith75@gmail.com", contact.Subject, messageContent);
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
                ViewBag.Confirmation = messageContent;
                return View(reservation);
            }

            #endregion
            //Sending a confirmation message to the INDEX Action in Reservations Controller.
            //If the message is NULL, the confirmation dialog will be hidden.
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
            if (ModelState.IsValid)
            {
                if (User.IsInRole("Admin") || User.IsInRole("Customer"))
                {
                    db.Entry(reservation).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

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
            
            return RedirectToAction("Index");
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
