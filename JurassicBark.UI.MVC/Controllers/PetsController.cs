﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JurassicBark.DATA.EF;
using Microsoft.AspNet.Identity;
using System.IO;
using JurassicBark.DATA.EF.Repository;
using System.Drawing;
using JurassicBark.Utilities;

namespace JurassicBark.UI.MVC.Controllers
{
    public class PetsController : Controller
    {
        UnitOfWork uow = new UnitOfWork();
        jurassicbarkEntities db = new jurassicbarkEntities();
        // GET: Pets
        public ActionResult Index()
        {
            List<Pet> petList = new List<Pet>();
            string currentUserID = User.Identity.GetUserId();
            if (User.IsInRole("Admin") || User.IsInRole("Employee"))
            {
                petList = uow.PetRepository.Get();
            }
            else
            {
                petList = uow.PetRepository.Get().Where(i => i.AspNetUser.Id == currentUserID).ToList();
            }
            return View(petList.ToList());
        }

        // GET: Pets/Details/5
        [Authorize]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pet pet = uow.PetRepository.Find(id);
            if (pet == null)
            {
                return HttpNotFound();
            }
            if (User.IsInRole("Admin") || User.IsInRole("Employee"))
            {
                return View(pet);
            }
            if (User.Identity.GetUserId() == pet.OwnerID)
            {
                return View(pet);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        // GET: Pets/Create
        [Authorize]
        public ActionResult Create()
        {
            ViewBag.OwnerID = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }
        
        // POST: Pets/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create([Bind(Include = "PetID,Name,OwnerID,PetPhoto,SpecialNotes,IsActive,DateAdded")] Pet pet, HttpPostedFileBase PetPhoto)
        {
            if (!User.IsInRole("Admin") && User.IsInRole("Customer"))
            {
                pet.OwnerID = User.Identity.GetUserId();
            }

            if (User.IsInRole("Admin"))
            {
                ViewBag.OwnerID = new SelectList(db.AspNetUsers, "Id", "Email", pet.OwnerID);
            }
            if (ModelState.IsValid)
            {
                //Empty string to use if image needs to be renamed.
                string imageName = "";

                if (PetPhoto != null)
                {
                    //Create variable to capture the file extension
                    string imgExt = Path.GetExtension(PetPhoto.FileName).ToLower();
                    //Create string array of allowed file extensions
                    string[] allowedExtensions = { ".png", ".jpg", ".jpeg", ".gif" };
                    //Check image is allowed
                    if (allowedExtensions.Contains(imgExt))
                    {
                        //Save file name with identifier
                        imageName = DateTime.Now.ToString("yyyyMMddHHmmssfff") + "_" +
                            Path.GetFileName(PetPhoto.FileName);

                        //Set the path on the server to store the image:
                        string savePath = Server.MapPath("~/Content/images/pets/");

                        Image petImage = Image.FromStream(PetPhoto.InputStream);
                        FileUtilities.ResizeImage(savePath, imageName, petImage, 500, 100);
                    }
                    
                }
                pet.PetPhoto = imageName;

                uow.PetRepository.Add(pet);
                uow.Save();
                return RedirectToAction("Index");
            }
            return View(pet);
        }

        //GET: Pets/Edit/5
        [Authorize]
        public ActionResult Edit(int? id)
        {
            
            string currentUserID = User.Identity.GetUserId();

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pet pet = uow.PetRepository.Find(id);
            if (pet == null)
            {
                return HttpNotFound();
            }
            if (User.IsInRole("Admin"))
            {
                ViewBag.OwnerID = new SelectList(db.AspNetUsers, "Id", "Email", pet.OwnerID);
                return View(pet);
            }
            if (pet.OwnerID == currentUserID)
            {
                return View(pet);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        // POST: Pets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Edit([Bind(Include = "PetID,Name,OwnerID,PetPhoto,SpecialNotes,IsActive,DateAdded")] Pet pet)
        {
            if (!User.IsInRole("Admin"))
            {
                pet.OwnerID = User.Identity.GetUserId();
            }


            if (User.IsInRole("Admin"))
            {
                ViewBag.OwnerID = new SelectList(db.AspNetUsers, "Id", "Email", pet.OwnerID);
            }

            if (ModelState.IsValid)
            {
                db.Entry(pet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(pet);
        }

        // GET: Pets/Delete/5
        [Authorize]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pet pet = uow.PetRepository.Find(id);
            if (pet == null)
            {
                return HttpNotFound();
            }
            if ((pet.OwnerID == User.Identity.GetUserId() && !User.IsInRole("Admin")))
            {
                return View(pet);
            }
            return RedirectToAction("Index");
        }

        // POST: Pets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult DeleteConfirmed(int id)
        {
            //Create string for current user value
            string currentUser = User.Identity.GetUserId();
            Pet pet = uow.PetRepository.Find(id);
            //Check if user is Admin and remove record:
            if (User.IsInRole("Admin"))
            {
                uow.PetRepository.Remove(pet);
                uow.Save();
            }
            if (pet.OwnerID == currentUser)
            {
                uow.PetRepository.Remove(pet);
                uow.Save();
            }
            else
            {
                return RedirectToAction("Index");
            }

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                uow.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
