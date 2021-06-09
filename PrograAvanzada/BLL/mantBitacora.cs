using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static class mantBitacora
    {

        public static List<ConsultaBitacoraResult> consultaBitacora()
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaBitacoraResult> datos = db.ConsultaBitacora().ToList();
                return datos;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public static bool RegistrarBitacora(string Controlador, string Accion, string Error, int Tipo, DateTime Fecha, int IdUsuario)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.RegistrarBitacora(Controlador, Accion, Error, Tipo, Fecha, IdUsuario);
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
