using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantEmpresa
    {
		public List<ConsultaEmpresasResult> ConsultarEmpresas()
		{
			try
			{
				DatosDataContext db = new DatosDataContext();
				List<ConsultaEmpresasResult> datos = db.ConsultaEmpresas().ToList();
				return datos;
			}
			catch (Exception ex)
			{

				throw;
			}
		}

        public ConsultaEmpresaResult ConsultarEmpresa(int IdEmpresa)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                ConsultaEmpresaResult dato = db.ConsultaEmpresa(IdEmpresa).FirstOrDefault();
                return dato;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool CreaEmpresa(string Descripcion, int IdTipoIdentificacion, string Identificacion, string Telefono, string Contacto, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.CreaEmpresa(Descripcion, IdTipoIdentificacion, Identificacion, Telefono, Contacto, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool ActualizaEmpresa(int IdEmpresa, string Descripcion, int IdTipoIdentificacion, string Identificacion, string Telefono, string Contacto, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.ActualizaEmpresa(IdEmpresa, Descripcion, IdTipoIdentificacion, Identificacion, Telefono, Contacto, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool EliminaEmpresa(int IdEmpresa)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.EliminaEmpresa(IdEmpresa);
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
