using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using PrograAvanzada.Models;

namespace PrograAvanzada.Controllers
{
    [AuthorizeRole(Role.Gerente, Role.Supervisor)]
    public class EmpresaController : Controller
    {

        mantEmpresa mantEmpresa = new mantEmpresa();
        mantTipoIdentificacion mantTIdentificacion = new mantTipoIdentificacion();

        // GET: Empresa
        public ActionResult Index()
        {
            try
            {
                var datos = mantEmpresa.ConsultarEmpresas();

                List<Empresa> ListaEmpresas = new List<Empresa>();

                foreach (var actual in datos)
                {
                    Empresa empresa = new Empresa();

                    empresa.IdEmpresa = actual.IdEmpresa;
                    empresa.Descripcion = actual.Descripcion;
                    empresa.IdTipoIdentificacion = actual.IdTipoIdentificacion;
                    empresa.Identificacion = actual.Identificacion;
                    empresa.Telefono = actual.Telefono;
                    empresa.Contacto = actual.Contacto;
                    empresa.Estado = actual.Estado;
                    empresa.DescTipoIdentificacion = actual.DescTipoIdentificacion;

                    ListaEmpresas.Add(empresa);
                }
                return View(ListaEmpresas);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar las empresas");
            }

        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Crear()
        {
            try
            {
                ViewBag.TiposIdentificacion = mantTIdentificacion.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                return View();
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar parámetros");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Crear(Empresa empresa)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantEmpresa.CreaEmpresa(empresa.Descripcion, empresa.IdTipoIdentificacion, empresa.Identificacion, empresa.Telefono, empresa.Contacto, empresa.Estado))
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.TiposIdentificacion = mantTIdentificacion.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                        ViewBag.Creado = false;
                        mantBitacora.RegistrarBitacora("Empresa", "Crear Empresa", "Error al crear empresa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        return View(empresa);
                    }
                }
                else
                {
                    ViewBag.TiposIdentificacion = mantTIdentificacion.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                    return View(empresa);
                }

            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Empresa", "Crear Empresa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al agregar la empresa");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Editar(int idEmpresa)
        {
            try
            {
                var dato = mantEmpresa.ConsultarEmpresa(idEmpresa);

                Empresa empresa = new Empresa();

                empresa.IdEmpresa = dato.IdEmpresa;
                empresa.Descripcion = dato.Descripcion;
                empresa.IdTipoIdentificacion = dato.IdTipoIdentificacion;
                empresa.Identificacion = dato.Identificacion;
                empresa.Telefono = dato.Telefono;
                empresa.Contacto = dato.Contacto;
                empresa.Estado = dato.Estado;

                ViewBag.TiposIdentificacion = mantTIdentificacion.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();

                return View(empresa);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la empresa");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Empresa empresa)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantEmpresa.ActualizaEmpresa(empresa.IdEmpresa, empresa.Descripcion, empresa.IdTipoIdentificacion, empresa.Identificacion, empresa.Telefono, empresa.Contacto, empresa.Estado))
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.TiposIdentificacion = mantTIdentificacion.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                        ViewBag.Actualizado = false;
                        mantBitacora.RegistrarBitacora("Empresa", "Editar Empresa", "Error al editar empresa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        return View();
                    }
                }
                else
                {
                    ViewBag.TiposIdentificacion = mantTIdentificacion.ConsultaTiposIdentificacion().Where(x => x.Estado == true).ToList();
                    return View(empresa);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Empresa", "Editar Empresa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al editar la empresa");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Eliminar(int idEmpresa)
        {
            try
            {
                var dato = mantEmpresa.ConsultarEmpresa(idEmpresa);

                Empresa empresa = new Empresa();

                empresa.IdEmpresa = dato.IdEmpresa;
                empresa.Descripcion = dato.Descripcion;
                empresa.IdTipoIdentificacion = dato.IdTipoIdentificacion;
                empresa.Identificacion = dato.Identificacion;
                empresa.Telefono = dato.Telefono;
                empresa.Contacto = dato.Contacto;
                empresa.Estado = dato.Estado;
                empresa.DescTipoIdentificacion = dato.DescTipoIdentificacion;

                return View(empresa);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la empresa");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Eliminar(Empresa empresa)
        {
            try
            {
                if (mantEmpresa.EliminaEmpresa(empresa.IdEmpresa))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    mantBitacora.RegistrarBitacora("Empresa", "Eliminar Empresa", "Error al eliminar empresa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                    ViewBag.error = true;
                    return View(empresa);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Empresa", "Eliminar Empresa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al eliminar la empresa");
            }
        }

    }
}