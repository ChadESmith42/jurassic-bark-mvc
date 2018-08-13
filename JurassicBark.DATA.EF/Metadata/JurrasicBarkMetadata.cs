using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JurassicBark.DATA.EF//.Metadata
{
    [MetadataType(typeof(PetMetadata))]
    public partial class Pet { }

    public class PetMetadata
    {
        [Required]
        [StringLength(20,ErrorMessage ="*Maximum 20 characters.")]
        public string Name { get; set; }
        [Display(Name="Photo")]
        public string PetPhoto { get; set; }
        [StringLength(500,ErrorMessage ="* Maximum 500 characters. Please email your location's manager if you need to add more details.")]
        [Display(Name="Special Notes")]
        public string SpecialNotes { get; set; }
        [Display(Name ="Active?")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(ResortLocationMetadata))]
    public partial class ResortLocation { }

    public class ResortLocationMetadata
    {
        [Required]
        [Display(Name ="Resort Name")]
        [StringLength(50,ErrorMessage ="*Maximum 50 characters.")]
        public string ResortName { get; set; }
        [Required]
        [StringLength(100, ErrorMessage ="*Maximum 100 characters.")]
        public string Address { get; set; }
        [Required]
        [StringLength(50, ErrorMessage ="*Maximum 50 characters.")]
        public string City { get; set; }
        [Required]
        [StringLength(2,ErrorMessage ="*Please use a 2-character state abbreviation.")]
        public string State { get; set; }
        [Required]
        [Display(Name ="Zip Code")]
        public int ZipCode { get; set; }
        [Required]
        [Display(Name ="Reservation Limit")]
        public byte ReservationLimit { get; set; }
    }

    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail { }

    public class UserDetailMetadata
    {
        [Required]
        [Display(Name = "First Name")]
        [StringLength(50,ErrorMessage ="*Maximum 50 characters")]
        public string FName { get; set; }
        [Required]
        [Display(Name = "Last Name")]
        [StringLength(50, ErrorMessage = "*Maximum 50 characters")]
        public string LName { get; set; }
        [Required]
        [Display(Name = "Phone Number")]
        [StringLength(10, ErrorMessage = "*Maximum 10 characters. Numbers only.")]
        public string Phone { get; set; }
        public string Image { get; set; }
    }
}
