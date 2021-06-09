using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantTarifa
    {
        public List<ConsultaTarifasResult> ConsultarTarifas()
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaTarifasResult> datos = db.ConsultaTarifas().ToList();
                return datos;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public ConsultaTarifaResult ConsultarTarifa(int IdTarifa)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                ConsultaTarifaResult dato = db.ConsultaTarifa(IdTarifa).FirstOrDefault();
                return dato;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool CreaTarifa(string Descripcion, decimal Monto, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.CreaTarifa(Descripcion, Monto, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool ActualizaTarifa(int IdTarifa, string Descripcion, decimal Monto, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.ActualizaTarifa(IdTarifa, Descripcion, Monto, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool EliminaTarifa(int IdTarifa)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.EliminaTarifa(IdTarifa);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }
    }
}
