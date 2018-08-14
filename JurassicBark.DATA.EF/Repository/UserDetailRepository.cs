using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace JurassicBark.DATA.EF.Repository
{
    public class UserDetailRepository : GenericRepository<UserDetail>
    {
        public UserDetailRepository(DbContext db) : base(db) { }
    }
}
