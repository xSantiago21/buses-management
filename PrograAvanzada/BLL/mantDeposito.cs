using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantDeposito
    {
        public List<ConsultaDepositosResult> ConsultarDepositos(int IdUsuario)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaDepositosResult> datos = db.ConsultaDepositos(IdUsuario).ToList();
                return datos;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool CreaDeposito(int IdUsuario, decimal Monto, DateTime Fecha, string Telefono, string Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.CreaDeposito(IdUsuario, Monto, Fecha, Telefono, Estado);
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
