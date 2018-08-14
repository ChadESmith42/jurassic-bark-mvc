using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JurassicBark.DATA.EF.Repository
{
    public class ReservationRepository : GenericRepository<Reservation>
    {
        public ReservationRepository(DbContext db) : base(db) { }
    }
}
