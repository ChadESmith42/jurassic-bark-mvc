using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JurassicBark.DATA.EF;

namespace JurassicBark.UI.MVC.Controllers
{
    public class ResortLocationsController : Controller
    {
        private jurassicbarkEntities db = new jurassicbarkEntities();
        public UnitOfWork uow = new UnitOfWork();

        // GET: ResortLocations
        public ActionResult Index()
        {
            return View(db.ResortLocations.ToList());
        }

        // GET: ResortLocations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ResortLocation resortLocation = db.ResortLocations.Find(id);
            if (resortLocation == null)
            {
                return HttpNotFound();
            }
            int count = resortLocation.Reservations.Count;

            ViewBag.Available = resortLocation.ReservationLimit - count;
            return View(resortLocation);
        }

        // GET: ResortLocations/Create
        [Authorize(Roles ="Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: ResortLocations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "ResortLocationID,ResortName,Address,City,State,ZipCode,ReservationLimit")] ResortLocation resortLocation)
        {
            if (ModelState.IsValid)
            {
                db.ResortLocations.Add(resortLocation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(resortLocation);
        }

        // GET: ResortLocations/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ResortLocation resortLocation = db.ResortLocations.Find(id);
            if (resortLocation == null)
            {
                return HttpNotFound();
            }
            return View(resortLocation);
        }

        // POST: ResortLocations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "ResortLocationID,ResortName,Address,City,State,ZipCode,ReservationLimit")] ResortLocation resortLocation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(resortLocation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(resortLocation);
        }

        // GET: ResortLocations/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ResortLocation resortLocation = db.ResortLocations.Find(id);
            if (resortLocation == null)
            {
                return HttpNotFound();
            }
            return View(resortLocation);
        }

        // POST: ResortLocations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            ResortLocation resortLocation = db.ResortLocations.Find(id);
            db.ResortLocations.Remove(resortLocation);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult AvailableReservations(int id)
        {
            ResortLocation resort = db.ResortLocations.Find(id);
            int count = resort.Reservations.Count;

            ViewBag.Available = resort.ReservationLimit - count;

            return View();
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
