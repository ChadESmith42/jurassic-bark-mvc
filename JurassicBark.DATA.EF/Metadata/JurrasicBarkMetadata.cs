﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JurassicBark.DATA.EF;

namespace JurassicBark.DATA.EF//.Metadata
{
    [MetadataType(typeof(ReservationMetadata))]
    public partial class Reservation { }

    public class ReservationMetadata
    {

        public int ReservationID { get; set; }
        [Display(Name = "Jurassic Bark Location")]
        public int ResortLocationID { get; set; }
        [Display(Name = "Pet Name")]
        public int PetID { get; set; }
        [Display(Name = "Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public System.DateTime ReservationDate { get; set; }
    }



    [MetadataType(typeof(PetMetadata))]
    public partial class Pet { }

    public class PetMetadata
    {
        [Required]
        [StringLength(20, ErrorMessage = "*Maximum 20 characters.")]
        public string Name { get; set; }
        [Display(Name = "Photo")]
        public string PetPhoto { get; set; }
        [StringLength(500, ErrorMessage = "* Maximum 500 characters. Please email your location's manager if you need to add more details.")]
        [Display(Name = "Special Notes")]
        public string SpecialNotes { get; set; }
        [Display(Name = "Active?")]
        public bool IsActive { get; set; }
        [Display(Name = "Customer Since")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public System.DateTime DateAdded { get; set; }
    }

    [MetadataType(typeof(ResortLocationMetadata))]
    public partial class ResortLocation
    {
        UnitOfWork uow = new UnitOfWork();
        public int countRes
        {
            get
            {
                var resLocID = this.ResortLocationID;
                int count = uow.ReservationRepository.Get().Where(r => r.ReservationDate == DateTime.Today && r.ResortLocationID == resLocID).Count();

                return count;
            }
        }
    }

    public class ResortLocationMetadata
    {
        public int ResortLocationID { get; set; }
        [Required]
        [Display(Name = "Resort Name")]
        [StringLength(50, ErrorMessage = "*Maximum 50 characters.")]
        public string ResortName { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "*Maximum 100 characters.")]
        public string Address { get; set; }
        [Required]
        [StringLength(50, ErrorMessage = "*Maximum 50 characters.")]
        public string City { get; set; }
        [Required]
        [StringLength(2, ErrorMessage = "*Please use a 2-character state abbreviation.")]
        public string State { get; set; }
        [Required]
        [Display(Name = "Zip Code")]
        public int ZipCode { get; set; }
        [Required]
        [Display(Name = "Reservation Limit")]
        public byte ReservationLimit { get; set; }

    }

    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail { }

    public class UserDetailMetadata
    {
        [Required]
        [Display(Name = "Address")]
        [StringLength(120, ErrorMessage = "* Maximum 120 characters.")]
        public string Address { get; set; }
        [Required]
        [StringLength(20, ErrorMessage = "*Maximum 20 characters.")]
        public string City { get; set; }
        [Required]
        [StringLength(2, ErrorMessage = "* Use 2-character state abbreviation.")]
        public string State { get; set; }
        [Required]
        [Display(Name = "Zip Code")]
        [RegularExpression(@"^\d{5}$|^\d{5}-\d{4}$", ErrorMessage = "* Use a 5 digit or a 5+4 digit zip code.")]
        public string ZipCode { get; set; }
        [Required]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public System.DateTime Birthday { get; set; }
        [Required]
        [RegularExpression(@"^((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}$", ErrorMessage = "*Please enter a phone number as XXX-XXX-XXXX")]
        public string Phone { get; set; }
    }

    [MetadataType(typeof(EmployeeNoteMetadata))]
    public partial class EmployeeNote { }

    public class EmployeeNoteMetadata
    {
        [Required]
        [Display(Name = "Pet Identifier")]
        public int PetID { get; set; }
        [Required]
        [StringLength(500, ErrorMessage = "*Maximum 500 characters.")]
        public string Note { get; set; }
        [Display(Name = "Date Entered")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public System.DateTime NoteDate { get; set; }

    }



}
