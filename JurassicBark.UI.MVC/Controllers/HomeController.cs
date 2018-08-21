using JurassicBark.UI.MVC.Models;
using System;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace IdentitySample.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        //[HttpGet]
        //[Authorize]
        //public ActionResult About()
        //{
        //    ViewBag.Message = "We care for your good boys and clever girls.";

        //    return View();
        //}

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Let us take care of your good boy or clever girl.";

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel contact)
        {
            if (ModelState.IsValid)
            {
                //How to send email:
                //Construct a string value that will represent the mail message

                //SET DEFAULT VALUES
                contact.DateSent = DateTime.Now;
                contact.Subject = "From Jurassic Bark: " + contact.Subject;

                string messageContent = $"Name: {contact.FirstName} {contact.LastName} <br/> " +
                    $"Email: {contact.Email}<br/> Subject: {contact.Subject}<br/>" +
                    $"<h4>Message<h4>Pet: {contact.PetName} {contact.Message}<br/> Date Sent: {contact.DateSent}";

                //Create a MailMessage Object (System.Net.Mail)
                //This is the envelope for our letter (messageContent)
                //FROM address is first, TO address is next, SUBJECT, and MESSAGE
                MailMessage m = new MailMessage("no-reply@codingbychad.com",
                    "chad@codingbychad.com", contact.Subject, messageContent);

                //allow for HTML in the body
                m.IsBodyHtml = true;
                // replyto set to reply to the original emailer, not your website.
                m.ReplyToList.Add(contact.Email);
                //Priority
                //m.Priority = MailPriority.High; //optional setting

                //SMTP Client
                SmtpClient client = new SmtpClient("mail.codingbychad.com");

                client.Credentials = new NetworkCredential("no-reply@codingbychad.com", "M@774ew.");

                using (client)
                {
                    try
                    {
                        client.Send(m);
                    }//end try
                    catch (Exception)
                    {
                        ViewBag.ErrorMessage = "There was an error sending your message. Please try again.";

                        return View(contact);
                    }//end catch

                }//end Client

                return View("ContactConfirmation", contact);

            }//end IF contact form validation is TRUE;

            //if Validation fails, returns user to the contact form and repopulate the form with the data that they entered originally
            return View(contact);
        }
    }
}
