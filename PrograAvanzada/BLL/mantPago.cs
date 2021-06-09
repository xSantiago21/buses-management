using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class mantPago
    {

        public List<ConsultaPagosEmpresaResult> ConsultarPagosEmpresa(int IdEmpresa)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaPagosEmpresaResult> datos = db.ConsultaPagosEmpresa(IdEmpresa).ToList();
                return datos;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<ConsultaPagosUsuarioResult> ConsultarPagosUsuario(int IdUsuario)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaPagosUsuarioResult> datos = db.ConsultaPagosUsuario(IdUsuario).ToList();
                return datos;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool RegistrarPago(int IdEmpresa, int IdUnidad, int IdUsuario, decimal Monto, DateTime Fecha, decimal Latitud, decimal Longitud, string Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.CreaPago(IdEmpresa, IdUnidad, IdUsuario, Monto, Fecha, Latitud, Longitud, Estado);
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
