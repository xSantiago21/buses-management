using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantTipoPlaca
    {
        public List<ConsultaTiposPlacaResult> ConsultarTiposPlaca()
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaTiposPlacaResult> datos = db.ConsultaTiposPlaca().ToList();
                return datos;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public ConsultaTipoPlacaResult ConsultarTipoPlaca(int IdTipoPlaca)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                ConsultaTipoPlacaResult dato = db.ConsultaTipoPlaca(IdTipoPlaca).FirstOrDefault();
                return dato;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool CreaTipoPlaca(string Descripcion, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.CreaTipoPlaca(Descripcion, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool ActualizaTipoPlaca(int IdTipoPlaca, string Descripcion, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.ActualizaTipoPlaca(IdTipoPlaca, Descripcion, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool EliminaTipoPlaca(int IdTipoPlaca)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.EliminaTipoPlaca(IdTipoPlaca);
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
