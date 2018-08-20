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

namespace JurassicBark.UI.MVC.Controllers
{
    public class EmployeeNotesController : Controller
    {

        private jurassicbarkEntities db = new jurassicbarkEntities();
        public UnitOfWork uow = new UnitOfWork();


        public int CountNotes(int Id)
        {
            var petID = Id;
            int count = uow.EmployeeNotesRepository.Get().Where(n => n.PetID == petID).Count();

            return count;
        }
        // GET: EmployeeNotes
        //[Authorize(Roles="Employee")]
        //public ActionResult Index()
        //{
        //    var employeeNotes = db.EmployeeNotes.Include(e => e.AspNetUser).Include(e => e.Pet);
        //    return View(employeeNotes.ToList());
        //}

        // GET: EmployeeNotes/Pet/5
        [Authorize(Roles = "Employee")]
        public ActionResult Pet(int id)
        {
            //Return all notes for a specific pet, by PetID
            var notes = db.EmployeeNotes.Where(e => e.Pet.PetID == id);
            //var employeeNotes = db.EmployeeNotes.Include(e => e.AspNetUser).Include(e => e.Pet.PetID == id);

            return View(notes.ToList());
        }

        //GET: EmployeeNotes/EmployeeID/
        [Authorize(Roles ="Employee")]
        public ActionResult EmployeeID()
        {
            //Returns currentUser's notes for all Pets. UserID is a GUID, so should be secure.
            string currentUserID = User.Identity.GetUserId();
            var notes = db.EmployeeNotes.Where(e => e.EmployeeID == currentUserID);

            return View(notes.ToList());
        }



        //// GET: EmployeeNotes/Details/5
        //[Authorize(Roles = "Employee")]
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    EmployeeNote employeeNote = db.EmployeeNotes.Find(id);
        //    if (employeeNote == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(employeeNote);
        //}

        // GET: EmployeeNotes/Create
        [Authorize(Roles = "Employee")]
        public ActionResult Create()
        {
            string currentUserID = User.Identity.GetUserId();
            ViewBag.EmployeeID = currentUserID;
            //ViewBag.EmployeeID = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name");
            return View();
        }

        // POST: EmployeeNotes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Employee")]
        public ActionResult Create([Bind(Include = "EmpNoteID,PetID,EmployeeID,Note,NoteDate")] EmployeeNote employeeNote)
        {
            string currentUserID = User.Identity.GetUserId();
            employeeNote.EmployeeID = currentUserID;

            if (ModelState.IsValid)
            {
                db.EmployeeNotes.Add(employeeNote);
                db.SaveChanges();
                return RedirectToAction("EmployeeID");
            }
            
            //ViewBag.EmployeeID = new SelectList(db.AspNetUsers, "Id", "Email", employeeNote.EmployeeID);
            ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name", employeeNote.PetID);
            return View(employeeNote);
        }

        // GET: EmployeeNotes/Edit/5
        [Authorize(Roles = "Employee")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeNote employeeNote = db.EmployeeNotes.Find(id);
            if (employeeNote == null)
            {
                return HttpNotFound();
            }
            string currentUserID = User.Identity.GetUserId();
            ViewBag.EmployeeID = currentUserID;
            //ViewBag.EmployeeID = new SelectList(db.AspNetUsers, "Id", "Email", employeeNote.EmployeeID);
            ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name", employeeNote.PetID);
            return View(employeeNote);
        }

        // POST: EmployeeNotes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Employee")]
        public ActionResult Edit([Bind(Include = "EmpNoteID,PetID,EmployeeID,Note,NoteDate")] EmployeeNote employeeNote)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employeeNote).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            string currentUserID = User.Identity.GetUserId();
            ViewBag.EmployeeID = currentUserID;
            //ViewBag.EmployeeID = new SelectList(db.AspNetUsers, "Id", "Email", employeeNote.EmployeeID);
            ViewBag.PetID = new SelectList(db.Pets, "PetID", "Name", employeeNote.PetID);
            return View(employeeNote);
        }

        //// GET: EmployeeNotes/Delete/5
        //[Authorize(Roles = "Employee")]
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    EmployeeNote employeeNote = db.EmployeeNotes.Find(id);
        //    if (employeeNote == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(employeeNote);
        //}

        //// POST: EmployeeNotes/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Employee")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    EmployeeNote employeeNote = db.EmployeeNotes.Find(id);
        //    db.EmployeeNotes.Remove(employeeNote);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

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
