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
            
            var userDetails = context.UserDetailsRepository.Include(u => u.AspNetUser);

            //Compare currentUser to AspNetUserId.
            bool IsUserExist = false;
            string currentUser = User.Identity.GetUserId();
            string userCheck = context.UserDetailsRepository.Get().Where(u => u.AspNetUserId == currentUser).ToString();
            if (currentUser == userCheck)
            {
                IsUserExist = true;
            }
            if (User.IsInRole("Admin"))
            {
                return View(userDetails.ToList());
            }
            if (IsUserExist)
            {
                return RedirectToAction("Index", "Home");
            }
            if ((User.IsInRole("Customer") || User.IsInRole("Employee")) && !IsUserExist)
            {
                userDetails = userDetails.Where(u => u.AspNetUserId == currentUser);
                ViewBag.User = userName;
                IsUserExist = false;
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
            //Compare currentUser to AspNetUserId. If found in UserDetails, hide "Create Details" button on Index;
            bool IsUserExist = false;
            string currentUser = User.Identity.GetUserId();
            string userCheck = context.UserDetailsRepository.Get().Where(u => u.AspNetUserId == currentUser).ToString();
            if (currentUser == userCheck)
            {
                IsUserExist = true;
            }

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
                ViewBag.UserName = userName;
                return View(userDetail);
            }
            if (!IsUserExist)
            {
                ViewBag.UserName = userName;
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
            string userName = $"{User.Identity.GetFirstName()} {User.Identity.GetLastName()}";
            //Compare currentUser to AspNetUserId. If found in UserDetails, hide "Create Details" button on Index;
            bool IsUserExist = false;
            string currentUser = User.Identity.GetUserId();
            string userCheck = context.UserDetailsRepository.Get().Where(u => u.AspNetUserId == currentUser).ToString();
            if (currentUser == userCheck)
            {
                IsUserExist = true;
            }

            //UserDetail user = context.UserDetailsRepository.Get().Where(u => u.AspNetUserId == User.Identity.GetUserId()).First();
            if (User.IsInRole("Admin"))
            {
                ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email");
                return View();
            }
            if ((User.IsInRole("Customer") || User.IsInRole("Employee")) && !IsUserExist)
            {
                ViewBag.AspNetUserId = new SelectList(db.AspNetUsers.Where(u => u.Id == currentUser), "Id", "Email");
                ViewBag.User = userName;
                ViewBag.IsUserExist = IsUserExist;
                IsUserExist = true;
                return View();
            }
            else
            {
                return View("Index");
            }
            

        }

        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create([Bind(Include = "Id,AspNetUserId,Address,City,State,ZipCode,Birthday,Phone")] UserDetail userDetail)
        {

            if (User.IsInRole("Admin"))
            {
                ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.AspNetUserId);
            }
            if (User.Identity.IsAuthenticated)
            {
                userDetail.AspNetUserId = User.Identity.GetUserId();
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
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Edit([Bind(Include = "Id,AspNetUserId,Address,City,State,ZipCode,Birthday,Phone")] UserDetail userDetail)
        {
            
            //Admins can edit all users' details.
            if (User.IsInRole("Admin"))
            {
                ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email", userDetail.AspNetUserId);
            }
            //Customers can only edit their own details. They should not see the other User's details.
            if (User.Identity.IsAuthenticated)
            {
                userDetail.AspNetUserId = User.Identity.GetUserId();
            }
            if (ModelState.IsValid)
            {
                db.Entry(userDetail).State = EntityState.Modified;
                db.SaveChanges();
                return View("Index", context.UserDetailsRepository.Get());
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
            string currentUser = User.Identity.GetUserId();
           
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail.AspNetUserId == currentUser)
            {
                if (userDetail == null)
                {
                    return HttpNotFound();
                }

                return View(userDetail);
            }
            if (User.IsInRole("Admin"))
            {
                if (userDetail == null)
                {
                    return HttpNotFound();
                }

                return View(userDetail);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            
        }

        // POST: UserDetails/Delete/5
        [Authorize]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            
            UserDetail userDetail = db.UserDetails.Find(id);
            db.UserDetails.Remove(userDetail);
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
