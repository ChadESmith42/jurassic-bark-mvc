using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JurassicBark.DATA.EF.Repository
{
    public class UserDetailsRepository : GenericRepository<UserDetail>
    {
        public UserDetailsRepository(DbContext db) : base(db) { }
    }
}
