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
        public static string GetUserName(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity)identity).FindFirst("FName");

            return (claim != null) ? claim.Value : string.Empty;
        }
    }
}