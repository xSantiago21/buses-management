using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class mantLinea
    {

        public List<ConsultaLineasResult> ConsultarLineas(int IdEmpresa)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaLineasResult> datos = db.ConsultaLineas(IdEmpresa).ToList();
                return datos;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public ConsultaLineaResult ConsultarLinea(int IdLinea)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                ConsultaLineaResult dato = db.ConsultaLinea(IdLinea).FirstOrDefault();
                return dato;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public bool EliminaLinea(int IdLinea)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.EliminaLinea(IdLinea);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool ActualizaLinea(int IdEmpresa, int IdLinea, string Descripcion, string CodigoCTP, int IdTarifa, char Provincia, string Canton, string Distrito, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.ActualizaLinea(IdEmpresa, IdLinea, Descripcion, CodigoCTP, IdTarifa, Provincia, Canton, Distrito, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }
        public bool CreaLinea(int IdEmpresa, string Descripcion, string CodigoCTP, int IdTarifa, char Provincia, string Canton, string Distrito, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.CreaLinea(IdEmpresa, Descripcion, CodigoCTP, IdTarifa, Provincia, Canton, Distrito, Estado);
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
