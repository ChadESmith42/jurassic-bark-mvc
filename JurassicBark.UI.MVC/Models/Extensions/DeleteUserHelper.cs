using JurassicBark.DATA.EF;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

using System.IO;
using System;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Web;
using Microsoft.AspNet.Identity;
using System.Drawing;
using JurassicBark.Utilities;

namespace JurassicBark.UI.MVC.Models.Extensions
{
    public class DeleteUserHelper
    {

        //This helper class will delete ALL of the User's Reservations
        public static void DeleteReservations(string id)
        {
            UnitOfWork uow = new UnitOfWork();
            
            //Create a list of all Reservation objects based on the User's AspNetUserId
            List<Reservation> reservations = uow.ReservationRepository.Get().Where(r => r.Pet.OwnerID == id).ToList();

            //Cycle through the list and delete all reservation objects for User
            //with AspNetUserId == id
            foreach (Reservation item in reservations)
            {
                uow.ReservationRepository.Remove(item);
            }
            //Save the changes to the Repository
            uow.Save();
            //Clean up the Repository connection
            uow.Dispose();

        }//end DeleteReservations()

        //This helper class will delete ALL of a User's Pets
        public static void DeletePets(string id)
        {
            UnitOfWork uow = new UnitOfWork();

            //Create a list of all Pet objects based on the User's AspNetUserId
            List<Pet> pets = uow.PetRepository.Get().Where(p => p.OwnerID == id).ToList();

            //Cycle through the list and delete all reservation objects for User
            //with AspNetUserId == id
            foreach (Pet item in pets)
            {
                uow.PetRepository.Remove(item);
            }

            string path = System.Web.HttpContext.Current.Server.MapPath("~/Content/images/pets/");

            //Set a number of times to try to delete the file (in case the server thinks the
            //file is in use.
            int RetriesOnError = 3;

            //Create a delay for the delete retry
            int DelayOnRetry = 1000;

            foreach (Pet item in pets)
            {
                //Concatenate the pat and image name to a string
                string photoPath = path + item.PetPhoto;
                string thumbPhotoPath = path + "t_" + item.PetPhoto;

                //Process to delete the existing image from the server
                //The for loop is necessary for the process to try 3 times to delete the photo
                //Catch will delay for 1 second before trying again.
                for (int i = 0; i < RetriesOnError; ++i)
                {
                    try
                    {
                        //Create a file variable to hold the photo location
                        var file = new FileInfo(photoPath);
                        //Delete the file ...
                        file.Delete();
                    }
                    catch (IOException)
                    {
                        System.Threading.Thread.Sleep(DelayOnRetry);
                    }
                    catch (UnauthorizedAccessException)
                    {
                        System.Threading.Thread.Sleep(DelayOnRetry);
                    }
                }//end FOR to remove PetPhoto
                //Delete thumbnail file also:
                for (int i = 0; i < RetriesOnError; ++i)
                {
                    try
                    {
                        //Create a file variable to hold the photo location
                        var file = new FileInfo(thumbPhotoPath);
                        //Delete the file ...
                        file.Delete();
                    }
                    catch (IOException)
                    {
                        System.Threading.Thread.Sleep(DelayOnRetry);
                    }
                    catch (UnauthorizedAccessException)
                    {
                        System.Threading.Thread.Sleep(DelayOnRetry);
                    }
                }//end FOR to remove thumbnails of PetPhoto
            }//end FOREACH iteration through PetPhoto removal


            //Save the changes to the Repository
            uow.Save();
            //Clean up the Repository connection
            uow.Dispose();

        }//end DeletePets()

    }
}