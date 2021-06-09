using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantRol
    {
        public List<ConsultaRolesUsuarioResult> ConsultarRolesUsuario(int IdUsuario)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaRolesUsuarioResult> datos = db.ConsultaRolesUsuario(IdUsuario).ToList();
                return datos;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
