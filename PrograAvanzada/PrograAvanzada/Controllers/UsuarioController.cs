using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using DAL;
using PrograAvanzada.Models;
using PrograAvanzada.Tools;

namespace PrograAvanzada.Controllers
{
    [Authorize]
    public class UsuarioController : Controller
    {
        mantUsuario mantUsuario = new mantUsuario();
        mantTipoIdentificacion mantTipoId = new mantTipoIdentificacion();
        mantRol mantRol = new mantRol();
        mantEmpresa mantEmpresa = new mantEmpresa();

        // GET: Usuario
        public ActionResult Index()
        {
            try
            {
                return View();
            }
            catch (Exception e)
            {
                return new HttpNotFoundResult(e.Message);
            }
        }

        [AuthorizeRole(Role.Admin)]
        public ActionResult VerUsuarios()
        {
            try
            {
                var datos = mantUsuario.ConsultaUsuarios();

                List<Usuario> ListaUsuarios = new List<Usuario>();

                foreach (var actual in datos)
                {
                    Usuario usuario = new Usuario();

                    usuario.IdUsuario = actual.IdUsuario;
                    usuario.Nombre = actual.Nombre;
                    usuario.Nombre2 = actual.Nombre2;
                    usuario.Apellido1 = actual.Apellido1;
                    usuario.Apellido2 = actual.Apellido2;
                    usuario.IdTipoIdentificacion = actual.IdTipoIdentificacion;
                    usuario.NombreTipoId = actual.NombreTipoId;
                    usuario.Identificacion = actual.Identificacion;
                    usuario.Saldo = actual.Saldo;
                    usuario.Telefono = actual.Telefono;
                    usuario.Correo = actual.Correo;
                    usuario.Estado = actual.Estado;

                    bool esAdmin = false;
                    bool esGerente = false;
                    bool esSupervisor = false;
                    bool esCliente = false;

                    var roles = mantRol.ConsultarRolesUsuario(actual.IdUsuario);
                    foreach (var rol in roles)
                    {
                        if (rol.Rol.Equals("Admin"))
                        {
                            esAdmin = true;
                        }
                        if (rol.Rol.Equals("Gerente"))
                        {
                            esGerente = true;
                        }
                        if (rol.Rol.Equals("Supervisor"))
                        {
                            esSupervisor = true;
                        }
                        if (rol.Rol.Equals("Cliente"))
                        {
                            esCliente = true;
                        }
                    }

                    usuario.EsAdmin = esAdmin;
                    usuario.EsGerente = esGerente;
                    usuario.EsSupervisor = esSupervisor;
                    usuario.EsCliente = esCliente;

                    ListaUsuarios.Add(usuario);
                }
                return View(ListaUsuarios);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar usuarios");
            }

        }

        [AuthorizeRole(Role.Admin)]
        public ActionResult Editar(int idUsuario)
        {
            try
            {
                var dato = mantUsuario.ConsultaUsuario(idUsuario);

                Usuario usuario = new Usuario();

                usuario.IdUsuario = dato.IdUsuario;
                usuario.Nombre = dato.Nombre;
                usuario.Nombre2 = dato.Nombre2;
                usuario.Apellido1 = dato.Apellido1;
                usuario.Apellido2 = dato.Apellido2;
                usuario.IdTipoIdentificacion = dato.IdTipoIdentificacion;
                usuario.NombreTipoId = dato.NombreTipoId;
                usuario.Identificacion = dato.Identificacion;
                usuario.Saldo = dato.Saldo;
                usuario.Telefono = dato.Telefono;
                usuario.Correo = dato.Correo;
                usuario.Clave = dato.Clave;
                usuario.Estado = dato.Estado;

                bool esAdmin = false;
                bool esGerente = false;
                bool esSupervisor = false;
                bool esCliente = false;

                var roles = mantRol.ConsultarRolesUsuario(idUsuario);
                foreach (var rol in roles)
                {
                    if (rol.Rol.Equals("Admin"))
                    {
                        esAdmin = true;
                    }
                    if (rol.Rol.Equals("Gerente"))
                    {
                        esGerente = true;
                    }
                    if (rol.Rol.Equals("Supervisor"))
                    {
                        esSupervisor = true;
                    }
                    if (rol.Rol.Equals("Cliente"))
                    {
                        esCliente = true;
                    }
                }

                usuario.EsAdmin = esAdmin;
                usuario.EsGerente = esGerente;
                usuario.EsSupervisor = esSupervisor;
                usuario.EsCliente = esCliente;

                ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();

                return View(usuario);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar usuario");
            }
        }

        [AuthorizeRole(Role.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Usuario usuario)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool editar = true;

                    if (!usuario.EsAdmin && !usuario.EsGerente && !usuario.EsSupervisor && !usuario.EsCliente)
                    {
                        editar = false;
                        ViewBag.hayRoles = false;
                    }

                    if (!editar)
                    {
                        ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                        return View(usuario);
                    }
                    else
                    {

                        ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();

                        if (mantUsuario.ActualizaUsuario(usuario.IdUsuario, usuario.Nombre, usuario.Nombre2, usuario.Apellido1, usuario.Apellido2, usuario.IdTipoIdentificacion, usuario.Identificacion, usuario.Telefono, usuario.Correo, usuario.Estado, usuario.EsAdmin, usuario.EsGerente, usuario.EsSupervisor, usuario.EsCliente))
                        {
                            mantBitacora.RegistrarBitacora("Usuario", "Editar usuario", "Se ha editado un usuario", 0, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                            ViewBag.Actualizado = true;
                            return View(usuario);
                        }
                        else
                        {
                            mantBitacora.RegistrarBitacora("Usuario", "Editar usuario", "Error al editar usuario", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                            ViewBag.Actualizado = false;
                            return View();
                        }
                    }
                }
                else
                {
                    ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                    return View(usuario);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Usuario", "Editar usuario", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al editar usuario");
            }
        }

        public ActionResult EditarPerfil()
        {
            var SecretKey = ConfigurationManager.AppSettings["SecretKey"];
            try
            {
                int IdUsuario = Convert.ToInt32(HttpContext.User.Identity.Name);
                var dato = mantUsuario.ConsultaUsuario(IdUsuario);

                Usuario usuario = new Usuario();
                usuario.IdUsuario = dato.IdUsuario;
                usuario.Nombre = dato.Nombre;
                usuario.Nombre2 = dato.Nombre2;
                usuario.Apellido1 = dato.Apellido1;
                usuario.Apellido2 = dato.Apellido2;
                usuario.IdTipoIdentificacion = dato.IdTipoIdentificacion;
                usuario.Identificacion = dato.Identificacion;
                usuario.Telefono = dato.Telefono;
                usuario.Correo = dato.Correo;
                usuario.Clave = Seguridad.DecryptString(SecretKey, dato.Clave);

                ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion();

                return View(usuario);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar usuario");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditarPerfil(Usuario usuario)
        {
            var SecretKey = ConfigurationManager.AppSettings["SecretKey"];
            try
            {
                if (ModelState.IsValid)
                {
                    string correoActual = Session["Correo"].ToString();

                    bool correoPermitido = (usuario.Correo.Equals(correoActual)) ? true : false; //Para saber si el usuario está editando su correo

                    var datoC = mantUsuario.ConsultaCorreoUsuario(usuario.Correo);

                    if (datoC == null || correoPermitido)
                    {
                        string identificacionActual = Session["Identificacion"].ToString();

                        bool identificacionPermitida = (usuario.Identificacion.Equals(identificacionActual)) ? true : false; //Para saber si el usuario está editando su identificación

                        var datoI = mantUsuario.ConsultaIdentificacionUsuario(usuario.Identificacion);

                        if (datoI == null || identificacionPermitida) //Puedo registrarme
                        {
                            var EncryptedPass = Seguridad.EncryptString(SecretKey, usuario.Clave);

                            if (mantUsuario.ActualizaPerfilUsuario(usuario.IdUsuario, usuario.Nombre, usuario.Nombre2, usuario.Apellido1, usuario.Apellido2, usuario.IdTipoIdentificacion, usuario.Identificacion, usuario.Telefono, usuario.Correo, EncryptedPass))
                            {
                                return RedirectToAction("Index", "Inicio");
                            }
                            else
                            {
                                mantBitacora.RegistrarBitacora("Usuario", "Editar perfil", "Error al editar perfil", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                                ViewBag.Actualizado = false;
                                ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                                return View();
                            }
                        }
                        else //Existe cédula 
                        {
                            ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                            ViewBag.ExisteCedula = true;
                            return View(usuario);
                        }
                    }
                    else//Existe Correo
                    {
                        ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                        ViewBag.ExisteCorreo = true;
                        return View(usuario);
                    }
                }
                else
                {
                    ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                    return View(usuario);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Usuario", "Editar perfil", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al editar usuario");
            }
        }

        [AuthorizeRole(Role.Admin)]
        public ActionResult Eliminar(int idUsuario)
        {
            try
            {
                var dato = mantUsuario.ConsultaUsuario(idUsuario);

                Usuario usuario = new Usuario();

                usuario.IdUsuario = dato.IdUsuario;
                usuario.Nombre = dato.Nombre;
                usuario.Nombre2 = dato.Nombre2;
                usuario.Apellido1 = dato.Apellido1;
                usuario.Apellido2 = dato.Apellido2;
                usuario.IdTipoIdentificacion = dato.IdTipoIdentificacion;
                usuario.Identificacion = dato.Identificacion;
                usuario.Telefono = dato.Telefono;
                usuario.Correo = dato.Correo;
                usuario.Estado = dato.Estado;

                return View(usuario);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar usuario");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Admin)]
        [ValidateAntiForgeryToken]
        public ActionResult Eliminar(Usuario usuario)
        {
            try
            {
                if (mantUsuario.EliminaUsuario(usuario.IdUsuario))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    mantBitacora.RegistrarBitacora("Usuario", "Eliminar usuario", "Error al eliminar usuario", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                    ViewBag.error = true;
                    return View(usuario);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Usuario", "Eliminar usuario", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al eliminar usuario");
            }
        }

    }
}