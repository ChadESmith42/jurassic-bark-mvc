using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace JurassicBark.DATA.EF.Repository
{
    //Basically copied class information from below; Added "I" to name and changed "class" to "interface"
    public interface IGenericRepository<TEntity> : IDisposable where TEntity : class
    {
        //List of "signatures" for each method in the GenericRepository class. Do not include access modifiers ("public","private"). These are the "rules" for the Interface.
        List<TEntity> Get(string includeProperties = "");
        TEntity Find(object id);
        void Add(TEntity entity);
        void Update(TEntity entity);
        void Remove(TEntity entity);
        int CountRecords();
    }

    //Creates method of returning a list of data for a yet-to-be-determined data type
    //Implement interface by adding ": IGenericRepository<TEntity> to class definition;
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
    {
        //Creates a db connection to the database
        //DbContext will be passed in from the UnitOfWork
        //private cStoreEntities db = new cStoreEntities();

        internal DbContext db;
        public GenericRepository(DbContext context)
        {
            this.db = context;
        }


        //Returns a list of the specific data typ
        public List<TEntity> Get(string includeProperties = "")
        {
            IQueryable<TEntity> query = db.Set<TEntity>();

            foreach (var prop in includeProperties.Split
                (new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(prop);
            }
            return query.ToList();

        }


        //Returns either an INT or a GUI. Object is the parent of all data-types.
        public TEntity Find(object id)
        {
            return db.Set<TEntity>().Find(id);
        }

        //Adds a new entity of unknown type
        public void Add(TEntity entity)
        {
            db.Set<TEntity>().Add(entity);
            db.SaveChanges();
        }

        //Updates an entity of unknown type
        public void Update(TEntity entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        //Delete an entity of unknown type
        public void Remove(TEntity entity)
        {
            db.Set<TEntity>().Remove(entity);
            db.SaveChanges();
        }

        public void Remove(object id)
        {
            //Uses Find() above to identify the full entity to remove based on id
            var entity = Find(id);
            //Uses Remove() above to remove the entire entity and save changes to db
            Remove(entity);
        }

        public int CountRecords()
        {
            return Get().Count;
        }

        public IEnumerable<TEntity> Include(params Expression<Func<TEntity, object>>[] includes)
        {
            IDbSet<TEntity> dbSet = db.Set<TEntity>();

            IEnumerable<TEntity> query = null;
            foreach (var include in includes)
            {
                query = dbSet.Include(include);
            }

            return query ?? dbSet;
        }


        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }

            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }//end class GenericRepository
}//end namespace


