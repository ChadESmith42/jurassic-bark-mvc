using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace JurassicBark.DATA.EF.Repository
{
    
    public class PetRepository : GenericRepository<Pet>
    {
        public PetRepository(DbContext db) : base(db) { }
    }
}
