using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Claims;
using System.Security.Principal;

namespace JurassicBark.UI.MVC.Models.Extensions
{
    public static class IdentityExtensions
    {
        public static string GetFirstName(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity)identity).FindFirst("FName");

            return (claim != null) ? claim.Value : string.Empty;
        }

        public static string GetLastName(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity)identity).FindFirst("LName");

            return (claim != null) ? claim.Value : string.Empty;
        }
    }
}