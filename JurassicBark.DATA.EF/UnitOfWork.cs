using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JurassicBark.DATA.EF.Repository;

namespace JurassicBark.DATA.EF
{
    public class UnitOfWork
    {
        public jurassicbarkEntities context = new jurassicbarkEntities();

        private PetRepository _petRepository;
        public PetRepository PetRepository
        {
            get
            {
                if (this._petRepository == null)
                {
                    this._petRepository = new PetRepository(context);
                }
                return _petRepository;
            }
        }

        private ReservationRepository _reservationRepository;
        public ReservationRepository ReservationRepository
        {
            get
            {
                if (this._reservationRepository == null)
                {
                    this._reservationRepository = new ReservationRepository(context);
                }
                return _reservationRepository;
            }
        }

        private ResortLocationRepository _resortLocationRepository;
        public ResortLocationRepository ResortLocationRepository
        {
            get
            {
                if (this._resortLocationRepository == null)
                {
                    this._resortLocationRepository = new ResortLocationRepository(context);
                }
                return _resortLocationRepository;
            }
        }

        private UserDetailRepository _userDetailRepository;
        public UserDetailRepository UserDetailRepository
        {
            get
            {
                if (this._userDetailRepository == null)
                {
                    this._userDetailRepository = new UserDetailRepository(context);
                }
                return _userDetailRepository;
            }
        }

        private EmployeeNotesRepository _employeeNotesRepository;
        public EmployeeNotesRepository EmployeeNotesRepository
        {
            get
            {
                if (this._employeeNotesRepository == null)
                {
                    this._employeeNotesRepository = new EmployeeNotesRepository(context);
                }
                return _employeeNotesRepository;
            }
        }

        public void Save()
        {
            context.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }

            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }
}
