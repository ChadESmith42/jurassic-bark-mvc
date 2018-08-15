using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JurassicBark.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Display(Name = "First Name")]
        [Required(ErrorMessage = "* Required")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "* Required")]
        public string LastName { get; set; }

        [ScaffoldColumn(false)]
        public DateTime DateSent { get; set; }

        [MaxLength(250, ErrorMessage = "* is too long. Max lenght is 250 characters.")]
        [Required(ErrorMessage = "* Required")]
        public string Subject { get; set; }


        [UIHint("MultilineText")]
        [MaxLength(5000, ErrorMessage = "* is too long. Max length is 5,000 characters. Maybe a phone call instead?")]
        [Required(ErrorMessage = "* Required")]
        public string Message { get; set; }

        [RegularExpression(@"^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$", ErrorMessage = "Please enter a valid email address.")]
        [Required(ErrorMessage = "* Required")]
        public string Email { get; set; }

    }
}