using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using BLL;
using DAL;
using PrograAvanzada.Models;
using PrograAvanzada.Tools;

namespace PrograAvanzada.Controllers
{
    [AllowAnonymous]
    public class InicioController : Controller
    {

        mantTipoIdentificacion mantTipoId = new mantTipoIdentificacion();
        mantUsuario mantUsuario = new mantUsuario();
        mantRol mantRol = new mantRol();
        mantEmpresa mantEmpresa = new mantEmpresa();

        public ActionResult Index()
        {
            if (Request.IsAuthenticated)
            {
                //Si el usuario está autenticado precargo los datos de sesión
                // y al final redirijo a la vista home del usuario

                int IdUsuario = Convert.ToInt32(HttpContext.User.Identity.Name);

                var dato = mantUsuario.ConsultaUsuario(IdUsuario);

                if (!dato.Estado)
                {
                    ViewBag.Desactivado = true;
                    return View();
                }
                else
                {
                    Session["Nombre"] = dato.Nombre;
                    Session["Nombre2"] = dato.Nombre2;
                    Session["Apellido1"] = dato.Apellido1;
                    Session["Apellido2"] = dato.Apellido2;
                    Session["Identificacion"] = dato.Identificacion;
                    Session["Telefono"] = dato.Telefono;
                    Session["Correo"] = dato.Correo;

                    if (User.IsInRole("Cliente"))
                    {
                        Session["Saldo"] = dato.Saldo;
                    }

                    if (Request.Browser.IsMobileDevice && User.IsInRole("Cliente"))
                    {
                        return RedirectToAction("Index", "GeneraQR");
                    }
                    else
                    {
                        return RedirectToAction("Index", "Usuario");
                    }
                }

            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(InicioSesion inicioSesion)
        {
            var SecretKey = ConfigurationManager.AppSettings["SecretKey"];

            try
            {
                if (ModelState.IsValid)
                {
                    var EncryptedPass = Seguridad.EncryptString(SecretKey, inicioSesion.Clave);

                    //Obtengo el usuario
                    var dato = mantUsuario.ValidaInicioSesion(inicioSesion.Correo, EncryptedPass);
                    if (dato == null)
                    {
                        ViewBag.DatosIncorrectos = true;
                        return View(inicioSesion);
                    }
                    else if (!dato.Estado)
                    {
                        ViewBag.Desactivado = true;
                        return View(inicioSesion);
                    }
                    else
                    {

                        //Obtengo los roles
                        var ListaRoles = mantRol.ConsultarRolesUsuario(dato.IdUsuario);
                        var roles = String.Join(",", ListaRoles.Select(x => x.Rol));

                        //Autetico el usuario y guardo algunos de sus datos y sus roles en la sesión
                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, dato.IdUsuario.ToString(), DateTime.Now, DateTime.Now.AddMinutes(60), inicioSesion.Recordarme, roles, FormsAuthentication.FormsCookiePath);
                        string hash = FormsAuthentication.Encrypt(ticket);
                        HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

                        if (ticket.IsPersistent)
                        {
                            cookie.Expires = ticket.Expiration;
                        }
                        Response.Cookies.Add(cookie);

                        Session["Nombre"] = dato.Nombre;
                        Session["Nombre2"] = dato.Nombre2;
                        Session["Apellido1"] = dato.Apellido1;
                        Session["Apellido2"] = dato.Apellido2;
                        Session["Identificacion"] = dato.Identificacion;
                        Session["Telefono"] = dato.Telefono;
                        Session["Correo"] = dato.Correo;

                        if (roles.Contains("Cliente"))
                        {
                            Session["Saldo"] = dato.Saldo;
                        }

                        if (Request.Browser.IsMobileDevice && roles.Contains("Cliente"))
                        {
                            return RedirectToAction("Index", "GeneraQR");
                        }
                        else
                        {
                            return RedirectToAction("Index", "Usuario");
                        }
                    }
                }
                else
                {
                    return View(inicioSesion);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Inicio", "Iniciar Sesion", e.Message, 1, DateTime.Now, -1);
                return new HttpNotFoundResult(e.Message);
            }
        }

        public ActionResult Registro()
        {
            try
            {
                ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                return View();
            }
            catch (Exception e)
            {
                return new HttpNotFoundResult(e.Message);
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Registro(Usuario usuario)
        {
            var SecretKey = ConfigurationManager.AppSettings["SecretKey"];

            try
            {
                if (ModelState.IsValid)
                {
                    bool registrar = true;

                    if (Request.IsAuthenticated)//Si soy admin revisar que se marca al menos 1 rol
                    {
                        if (User.IsInRole("Admin"))
                        {
                            if (!usuario.EsAdmin && !usuario.EsGerente && !usuario.EsSupervisor && !usuario.EsCliente)
                            {
                                registrar = false;
                                ViewBag.hayRoles = false;
                            }
                        }
                    }
                    else
                    {
                        usuario.EsCliente = true;
                    }

                    if (!registrar)
                    {
                        ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                        return View(usuario);
                    }
                    else //Comenzar registro
                    {
                        var datoC = mantUsuario.ConsultaCorreoUsuario(usuario.Correo);

                        if (datoC != null)//Existe Correo
                        {
                            ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                            ViewBag.ExisteCorreo = true;
                            return View(usuario);
                        }
                        else
                        {
                            var datoI = mantUsuario.ConsultaIdentificacionUsuario(usuario.Identificacion);

                            if (datoI != null) //Existe cédula
                            {
                                ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList(); ;
                                ViewBag.ExisteCedula = true;
                                return View(usuario);
                            }
                            else //Puedo registrarme
                            {
                                var EncryptedPass = Seguridad.EncryptString(SecretKey, usuario.Clave);

                                ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList(); ;

                                if (mantUsuario.CreaUsuario(usuario.Nombre, usuario.Nombre2, usuario.Apellido1, usuario.Apellido2, usuario.IdTipoIdentificacion, usuario.Identificacion, usuario.Telefono, usuario.Correo, EncryptedPass, usuario.EsAdmin, usuario.EsGerente, usuario.EsSupervisor, usuario.EsCliente))
                                {
                                    ViewBag.Registrado = true;
                                    return View();
                                }
                                else
                                {
                                    mantBitacora.RegistrarBitacora("Inicio", "Registro", "Error al registrar usuario", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                                    ViewBag.Registrado = false;
                                    return View(usuario);
                                }
                            }
                        }
                    }//Fin registro
                }
                else
                {
                    ViewBag.TiposId = mantTipoId.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                    return View(usuario);
                }

            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Inicio", "Registrarse", e.Message, 1, DateTime.Now, -1);
                return new HttpNotFoundResult(e.Message);
            }

        }

        [Authorize]
        public ActionResult CerrarSesion()
        {
            Session.RemoveAll(); //Eliminar todos los valores de la sesión
                                 //Session.Abandon(); // Se pueden seguir usando los datos y la sesión termina al final
            FormsAuthentication.SignOut();
            Response.Cache.SetCacheability(HttpCacheability.Private);
            Response.Cache.SetNoServerCaching();
            Request.Cookies.Clear();
            Session.Abandon();
            return RedirectToAction("Index", "Inicio");
        }

    }
}