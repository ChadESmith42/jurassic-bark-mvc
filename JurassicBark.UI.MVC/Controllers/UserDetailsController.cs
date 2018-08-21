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
using Microsoft.AspNet.Identity.EntityFramework;
using JurassicBark.DATA.EF.Repository;
using JurassicBark.UI.MVC.Models.Extensions;

namespace JurassicBark.UI.MVC.Controllers
{
    public class UserDetailsController : Controller
    {
        private jurassicbarkEntities db = new jurassicbarkEntities();
        public UnitOfWork context = new UnitOfWork();

        // GET: UserDetails
        [Authorize]
        public ActionResult Index()
        {
            string userName = $"{User.Identity.GetFirstName()} {User.Identity.GetLastName()}";
            string currentUser = User.Identity.GetUserId();
            var userDetails = context.UserDetailsRepository.Include(u => u.AspNetUser);
            if (User.IsInRole("Admin"))
            {
                return View(userDetails.ToList());
            }
            if (User.IsInRole("Customer") || User.IsInRole("Employee"))
            {
                userDetails = userDetails.Where(u => u.AspNetUserId == currentUser);
                ViewBag.User = userName;
                return View(userDetails);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: UserDetails/Details/5
        [Authorize]
        public ActionResult Details(int? id)
        {
            string userName = $"{User.Identity.GetFirstName()} {User.Identity.GetLastName()}";
            string currentUser = User.Identity.GetUserId();

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return RedirectToAction("Create");
            }
            if (User.IsInRole("Admin"))
            {
                return View(userDetail);
            }
            if (currentUser == userDetail.AspNetUserId)
            {
                return View(userDetail);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }

        }

        // GET: UserDetails/Create
        [Authorize]
        public ActionResult Create()
        {
            ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();

        }

        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create([Bind(Include = "Id,AspNetUserId,Address,City,State,ZipCode,Birthday,Phone")] UserDetail userDetail)
        {

            if (User.IsInRole("Customer"))
            {
                userDetail.AspNetUserId = User.Identity.GetUserId();
            }
            if (User.IsInRole("Admin"))
            {
                ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.AspNetUserId);
            }
            if (ModelState.IsValid)
            {
                db.UserDetails.Add(userDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(userDetail);
        }

        // GET: UserDetails/Edit/5
        [Authorize]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            if (User.IsInRole("Admin"))
            {
                ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.AspNetUserId);
                return View(userDetail);
            }
            if (userDetail.AspNetUserId == User.Identity.GetUserId())
            {
                ViewBag.AspNetUserId = User.Identity.GetUserId();
                return View(userDetail);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Edit([Bind(Include = "Id,AspNetUserId,Address,City,State,ZipCode,Birthday,Phone")] UserDetail userDetail)
        {
            //Customers can only edit their own details. They should not see the other User's details.
            if (User.IsInRole("Customer") || User.IsInRole("Employee"))
            {
                userDetail.AspNetUserId = User.Identity.GetUserId();
            }
            //Admins can edit all users' details.
            if (User.IsInRole("Admin"))
            {
                ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.AspNetUserId);
            }
            if (ModelState.IsValid)
            {
                db.Entry(userDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: UserDetails/Delete/5
        [Authorize]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            if (User.IsInRole("Customer"))
            {
                return RedirectToAction("Index", "Home");
            }
            return View(userDetail);
        }

        // POST: UserDetails/Delete/5
        [Authorize(Roles ="Admin, Customer")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (User.IsInRole("Admin"))
            {
                UserDetail userDetail = db.UserDetails.Find(id);
                db.UserDetails.Remove(userDetail);
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
