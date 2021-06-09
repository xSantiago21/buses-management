using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class mantUsuario
    {

        public List<ConsultaUsuariosResult> ConsultaUsuarios()
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                List<ConsultaUsuariosResult> datos = db.ConsultaUsuarios().ToList();
                return datos;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ConsultaUsuarioResult ConsultaUsuario(int IdUsuario)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                var dato = db.ConsultaUsuario(IdUsuario).FirstOrDefault();
                return dato;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public ValidaInicioSesionResult ValidaInicioSesion(string Correo, string Clave)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                var dato = db.ValidaInicioSesion(Correo, Clave).FirstOrDefault();
                return dato;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ConsultaCorreoUsuarioResult ConsultaCorreoUsuario(string correo)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                var dato = db.ConsultaCorreoUsuario(correo).FirstOrDefault();
                return dato;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ConsultaIdentificacionUsuarioResult ConsultaIdentificacionUsuario(string identificacion)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                var dato = db.ConsultaIdentificacionUsuario(identificacion).FirstOrDefault();
                return dato;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool CreaUsuario(string Nombre, string Nombre2, string Apellido1, string Apellido2, int IdTipoIdentificacion, string Identificacion, string Telefono, string Correo, string Clave, bool EsAdmin, bool EsGerente, bool EsSupervisor, bool EsCliente)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.CreaUsuario(Nombre, Nombre2, Apellido1, Apellido2, IdTipoIdentificacion, Identificacion, Telefono, Correo, Clave, EsAdmin, EsGerente, EsSupervisor, EsCliente);
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public bool ActualizaUsuario(int IdUsuario, string Nombre, string Nombre2, string Apellido1, string Apellido2, int IdTipoIdentificacion, string Identificacion, string Telefono, string Correo,bool Estado , bool EsAdmin, bool EsGerente, bool EsSupervisor, bool EsCliente)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.ActualizaUsuario(IdUsuario, Nombre, Nombre2, Apellido1, Apellido2, IdTipoIdentificacion, Identificacion, Telefono, Correo, Estado, EsAdmin, EsGerente, EsSupervisor, EsCliente);
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public bool ActualizaPerfilUsuario(int IdUsuario, string Nombre, string Nombre2, string Apellido1, string Apellido2, int IdTipoIdentificacion, string Identificacion, string Telefono, string Correo, string Clave)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.ActualizaPerfilUsuario(IdUsuario, Nombre, Nombre2, Apellido1, Apellido2, IdTipoIdentificacion, Identificacion, Telefono, Correo, Clave);
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public bool EliminaUsuario(int IdUsuario)
        {
            try
            {
                DatosDataContext db = new DatosDataContext();
                db.EliminaUsuario(IdUsuario);
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
