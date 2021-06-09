using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantUnidad
    {

        public List<ConsultaUnidadesResult> ConsultarUnidades(int IdLinea)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaUnidadesResult> datos = db.ConsultaUnidades(IdLinea).ToList();
                return datos;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public ConsultaUnidadResult ConsultarUnidad(int IdUnidad)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                ConsultaUnidadResult dato = db.ConsultaUnidad(IdUnidad).FirstOrDefault();
                return dato;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool CreaUnidad(string Descripcion, int IdTipoPlaca, string Placa, int IdLinea, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.CreaUnidad(Descripcion, IdTipoPlaca, Placa, IdLinea, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool ActualizaUnidad(int IdUnidad, string Descripcion, int IdTipoPlaca, string Placa, int IdLinea, bool Estado)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.ActualizaUnidad(IdUnidad, Descripcion, IdTipoPlaca, Placa, IdLinea, Estado);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool EliminaUnidad(int IdUnidad)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.EliminaUnidad(IdUnidad);
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
