using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JurassicBark.DATA.EF;
using Microsoft.AspNet.Identity;
using JurassicBark.DATA.EF.Repository;

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

            var reservations = db.Reservations.Include(r => r.Pet).Include(r => r.ResortLocation);

            if (User.IsInRole("Customer"))
            {
                reservations = reservations.Where(r => r.Pet.OwnerID == currentUser);
            }
            
            return View(reservations.ToList());
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

        // GET: Reservations/Create
        [Authorize]
        public ActionResult Create()
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
            
            ViewBag.ResortLocationID = new SelectList(db.ResortLocations, "ResortLocationID", "ResortName");

            return View();
        }

        //TODO: Create new public ActionResult for pre-populated reservation request based on Locations Page "Book Now!" button.
        //// GET: Reservations/Create
        //[Authorize]
        //public ActionResult Create()
        //{
        //    //Identify the current user for filtering of records based on AspNetUserID
        //    string currentUser = User.Identity.GetUserId();

        //    //Generate a complete list of all pets for the drop-down. This will be filtered later by user role
        //    List<Pet> myPets = uow.PetRepository.Get().Where(p => p.OwnerID == currentUser).ToList();

        //    //Since a customer should only see their pets, we limit the list of pets based on
        //    //the current user's AspNetUserID if they are in a customer role
        //    if (User.IsInRole("Customer"))
        //    {
        //        ViewBag.PetID = new SelectList(myPets, "PetID", "Name");
        //    }

        //    //The Admin should see ALL pets as an option. So we "revert" back to the default
        //    //list of pets from the repository
        //    if (User.IsInRole("Admin"))
        //    {
        //        ViewBag.PetID = new SelectList(uow.PetRepository.Get(), "PetID", "Name");
        //    }

        //    ViewBag.ResortLocationID = new SelectList(db.ResortLocations, "ResortLocationID", "ResortName");

        //    return View();
        //}









        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
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
            return View(reservation);
        }

        // GET: Reservations/Edit/5
        [Authorize]
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
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
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
            Reservation reservation = db.Reservations.Find(id);
            db.Reservations.Remove(reservation);
            db.SaveChanges();
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
