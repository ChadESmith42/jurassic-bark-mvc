using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Net;
using Microsoft.AspNet.Identity;
using JurassicBark.DATA.EF;
using System.Threading.Tasks;

namespace JurassicBark.UI.MVC.Models.Extensions
{
    public class EmailHandler
    {
        public UnitOfWork uow = new UnitOfWork();

        /// <summary>
        /// Generates an email using two passes parameters. Reusable throught the project.
        /// </summary>
        /// <param name="messageSubject">This is the subject of the email.</param>
        /// <param name="toAddress">This is the recipient's email address. Address can be retrieved using AspNet.Idenity.GetEmail().</param>
        /// <param name="messageConent">This is the message body of the email, the content. Can include HTML elements.</param>
        /// <returns>Returns an email complete email message and routes the message to the email server.</returns>
        public static void SendEmail(string fromAddress, string toAddress, string messageSubject, string messageContent)
        {
            //Declare variable for body of the email message. 
            //This variable is passed by the Controller calling this method.
            if (fromAddress == null)
            {
                fromAddress = "no-reply@codingbychad.com";
            }
            //Create new MailMessage. Arguments are [FROM ADDRESS], [TO ADDRESS], [SUBJECT],
            //[CONTENT]
            MailMessage m = new MailMessage(fromAddress,toAddress, messageSubject, messageContent);
            MailMessage mCopy = new MailMessage(fromAddress, "chad@codingbychad.com", "Confirmation Failed For This Item", messageContent);
            //Message content uses HTML, set this to TRUE
            m.IsBodyHtml = true;
            mCopy.IsBodyHtml = true;
            //Set the REPLY-TO address:
            m.ReplyToList.Add("no-reply@codingbychad.com");
            mCopy.ReplyToList.Add("no-reply@codingbychad.com");
            //Create the post office to send the message:
            SmtpClient client = new SmtpClient("mail.codingbychad.com");
            if (toAddress.ToLower().Contains("gmail.com"))
            {
                client.Port = 587;
            }
            else
            {
                client.Port = 465;
                client.EnableSsl = false;
            }
            //Enter the credentials for the mail server:
            client.Credentials = new NetworkCredential("no-reply@codingbychad.com", "M@774ew.");
            try
            {
                //Sent the message:
                client.Send(m);
                
            }
            catch (Exception)
            {
                client.Send(mCopy);
            }
        }//end Send
    }
}