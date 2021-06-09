using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantTipoIdentificacion
    {

        public List<ConsultaTiposIdentificacionResult> ConsultaTiposIdentificacion()
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaTiposIdentificacionResult> datos = db.ConsultaTiposIdentificacion().ToList();
                return datos;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}
