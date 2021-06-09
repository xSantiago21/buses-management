using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using DAL;
using PrograAvanzada.Models;

namespace PrograAvanzada.Controllers
{
    [AuthorizeRole(Role.Gerente, Role.Supervisor)]
    public class UnidadController : Controller
    {
        mantUnidad mantUnidad = new mantUnidad();
        mantTipoPlaca mantTipoPlaca = new mantTipoPlaca();
        mantEmpresa mantEmpresa = new mantEmpresa();
        mantLinea mantLinea = new mantLinea();

        // GET: Unidad
        public ActionResult Index(int idLinea)
        {
            try
            {
                var datos = mantUnidad.ConsultarUnidades(idLinea);

                List<Unidad> ListaUnidades = new List<Unidad>();

                foreach (var actual in datos)
                {
                    Unidad unidad = new Unidad();

                    unidad.IdUnidad = actual.IdUnidad;
                    unidad.Descripcion = actual.Descripcion;
                    unidad.IdTipoPlaca = actual.IdTipoPlaca;
                    unidad.Placa = actual.Placa;
                    unidad.Estado = actual.Estado;
                    unidad.NombreTipoPlaca = actual.NombreTipoPlaca;
                    unidad.IdLinea = actual.IdLinea;
                    unidad.IdEmpresa = actual.IdEmpresa;

                    ListaUnidades.Add(unidad);
                }
                return View(ListaUnidades);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar las unidades");
            }
        }

        public ActionResult Consulta()
        {
            ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Consulta(int idLinea)
        {
            return RedirectToAction("Index", new { idLinea });
        }

        [HttpPost]
        public JsonResult CargaLineas(int empresa)
        {
            List<ConsultaLineasResult> lineas = mantLinea.ConsultarLineas(empresa).Where(x => x.Estado == true).ToList();
            return Json(lineas, JsonRequestBehavior.AllowGet);
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Crear()
        {
            try
            {
                ViewBag.TiposPlaca = mantTipoPlaca.ConsultarTiposPlaca().Where(x => x.Estado == true).ToList();
                ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
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
        public ActionResult Crear(Unidad unidad)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantUnidad.CreaUnidad(unidad.Descripcion, unidad.IdTipoPlaca, unidad.Placa, unidad.IdLinea, unidad.Estado))
                    {
                        return RedirectToAction("Consulta");
                    }
                    else
                    {
                        mantBitacora.RegistrarBitacora("Unidad", "Crear unidad", "Error al crear unidad", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        ViewBag.TiposPlaca = mantTipoPlaca.ConsultarTiposPlaca().Where(x => x.Estado == true).ToList();
                        ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                        ViewBag.Creado = false;
                        return View(unidad);
                    }
                }
                else
                {
                    ViewBag.TiposPlaca = mantTipoPlaca.ConsultarTiposPlaca().Where(x => x.Estado == true).ToList();
                    ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                    return View(unidad);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Unidad", "Crear unidad", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al agregar la unidad");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Editar(int idUnidad)
        {
            try
            {
                var dato = mantUnidad.ConsultarUnidad(idUnidad);

                Unidad unidad = new Unidad();

                unidad.IdUnidad = dato.IdUnidad;
                unidad.Descripcion = dato.Descripcion;
                unidad.IdTipoPlaca = dato.IdTipoPlaca;
                unidad.Placa = dato.Placa;
                unidad.Estado = dato.Estado;
                unidad.NombreTipoPlaca = dato.NombreTipoPlaca;
                unidad.IdLinea = dato.IdLinea;
                unidad.IdEmpresa = dato.IdEmpresa;

                ViewBag.TiposPlaca = mantTipoPlaca.ConsultarTiposPlaca().Where(x => x.Estado == true).ToList();
                ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                ViewBag.Lineas = mantLinea.ConsultarLineas(unidad.IdEmpresa).Where(x => x.Estado == true).ToList();

                return View(unidad);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la unidad");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Unidad unidad)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantUnidad.ActualizaUnidad(unidad.IdUnidad, unidad.Descripcion, unidad.IdTipoPlaca, unidad.Placa, unidad.IdLinea, unidad.Estado))
                    {
                        return RedirectToAction("Consulta");
                    }
                    else
                    {
                        mantBitacora.RegistrarBitacora("Unidad", "Editar unidad", "Error al editar unidad", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        ViewBag.TiposPlaca = mantTipoPlaca.ConsultarTiposPlaca().Where(x => x.Estado == true).ToList();
                        ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                        ViewBag.Lineas = mantLinea.ConsultarLineas(unidad.IdEmpresa).Where(x => x.Estado == true).ToList();
                        ViewBag.Actualizado = false;
                        return View();
                    }
                }
                else
                {
                    ViewBag.TiposPlaca = mantTipoPlaca.ConsultarTiposPlaca().Where(x => x.Estado == true).ToList();
                    ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                    ViewBag.Lineas = mantLinea.ConsultarLineas(unidad.IdEmpresa).Where(x => x.Estado == true).ToList();
                    return View(unidad);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Unidad", "Editar unidad", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al editar la unidad");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Eliminar(int idUnidad)
        {
            try
            {
                var dato = mantUnidad.ConsultarUnidad(idUnidad);

                Unidad unidad = new Unidad();

                unidad.IdUnidad = dato.IdUnidad;
                unidad.Descripcion = dato.Descripcion;
                unidad.IdTipoPlaca = dato.IdTipoPlaca;
                unidad.Placa = dato.Placa;
                unidad.Estado = dato.Estado;
                unidad.NombreTipoPlaca = dato.NombreTipoPlaca;

                return View(unidad);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la unidad");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Eliminar(Unidad unidad)
        {
            try
            {
                if (mantUnidad.EliminaUnidad(unidad.IdUnidad))
                {
                    return RedirectToAction("Consulta");
                }
                else
                {
                    mantBitacora.RegistrarBitacora("Unidad", "Eliminar unidad", "Error al eliminar unidad", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                    ViewBag.error = true;
                    return View(unidad);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Unidad", "Eliminar unidad", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al eliminar la unidad");
            }
        }
    }
}