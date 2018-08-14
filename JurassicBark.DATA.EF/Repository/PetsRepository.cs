using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace JurassicBark.DATA.EF.Repository
{
    public interface IPetsRepository
    {
        List<Pet> GetMyPets();
    }

    
    public class PetsRepository : GenericRepository<Pet>, IPetsRepository
    {
        public PetsRepository(DbContext db) : base(db) { }

        //TODO Fix GetMyPets() where OwnerID = User.Identity.Name
        //public List<Pet> GetMyPets()
        //{
        //    return base.Get().Where(a => a.OwnerID = ).ToList();
        //}
    }
}
