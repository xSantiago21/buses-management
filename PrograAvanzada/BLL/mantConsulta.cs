using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantConsulta
    {

        public List<ProvinciasResult> ListaProvincias()
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ProvinciasResult> datos = db.Provincias().ToList();
                return datos;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public List<CantonesResult> ListaCantones(char Provincia)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<CantonesResult> datos = db.Cantones(Provincia).ToList();
                return datos;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public List<DistritosResult> ListaDistritos(char Provincia, string Canton)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<DistritosResult> datos = db.Distritos(Provincia, Canton).ToList();
                return datos;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

    }
}
