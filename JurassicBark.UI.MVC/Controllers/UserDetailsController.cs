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
    public class UserDetailsController : Controller
    {
        private jurassicbarkEntities db = new jurassicbarkEntities();
        public UnitOfWork uow = new UnitOfWork();
        //Identify User and return Name for display on the NavBar
        //TODO - Find() user where AspNetUserID = UserDetails.AspNetUserID;
        public ActionResult GetUserName()
        {
            string currentUser = User.Identity.GetUserId();

            UserDetail user = new UserDetail();
            uow.UserDetailRepository.Find(user.AspNetUsersID == currentUser);

            ViewBag.Name = user.FName;
            return View(user.FName);
        }



        //// GET: UserDetails
        //public ActionResult Index()
        //{
        //    var userDetails = db.UserDetails.Include(u => u.AspNetUser);
        //    return View(userDetails.ToList());
        //}

        //// GET: UserDetails/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    UserDetail userDetail = db.UserDetails.Find(id);
        //    if (userDetail == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(userDetail);
        //}

        //// GET: UserDetails/Create
        //public ActionResult Create()
        //{
        //    ViewBag.AspNetUsersID = new SelectList(db.AspNetUsers, "Id", "Email");
        //    return View();
        //}

        //// POST: UserDetails/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "UserID,FName,LName,Phone,Image,AspNetUsersID")] UserDetail userDetail)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.UserDetails.Add(userDetail);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.AspNetUsersID = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.AspNetUsersID);
        //    return View(userDetail);
        //}

        //// GET: UserDetails/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    UserDetail userDetail = db.UserDetails.Find(id);
        //    if (userDetail == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.AspNetUsersID = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.AspNetUsersID);
        //    return View(userDetail);
        //}

        //// POST: UserDetails/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "UserID,FName,LName,Phone,Image,AspNetUsersID")] UserDetail userDetail)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(userDetail).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.AspNetUsersID = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.AspNetUsersID);
        //    return View(userDetail);
        //}

        //// GET: UserDetails/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    UserDetail userDetail = db.UserDetails.Find(id);
        //    if (userDetail == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(userDetail);
        //}

        //// POST: UserDetails/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    UserDetail userDetail = db.UserDetails.Find(id);
        //    db.UserDetails.Remove(userDetail);
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
