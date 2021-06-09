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
    public class LineaController : Controller
    {
        mantLinea mantLinea = new mantLinea();
        mantEmpresa mantEmpresa = new mantEmpresa();
        mantConsulta mantConsulta = new mantConsulta();
        mantTarifa mantTarifa = new mantTarifa();

        // GET: Linea
        public ActionResult Index(int id)
        {
            try
            {
                var datos = mantLinea.ConsultarLineas(id);

                List<Linea> ListaLineas = new List<Linea>();

                foreach (var actual in datos)
                {
                    Linea linea = new Linea();

                    linea.IdEmpresa = actual.IdEmpresa;
                    linea.IdLinea = actual.IdLinea;
                    linea.Descripcion = actual.Descripcion;
                    linea.CodigoCTP = actual.CodigoCTP;
                    linea.Provincia = (char)actual.Provincia;
                    linea.Canton = actual.Canton;
                    linea.Distrito = actual.Distrito;
                    linea.Estado = actual.Estado;
                    linea.NombreEmpresa = actual.NombreEmpresa;
                    linea.NombreProvincia = actual.NombreProvincia;
                    linea.NombreCanton = actual.NombreCanton;
                    linea.NombreDistrito = actual.NombreDistrito;
                    linea.NombreTarifa = actual.NombreTarifa;
                    linea.Monto = actual.Monto;
                    linea.IdTarifa = actual.IdTarifa;

                    ListaLineas.Add(linea);
                }
                return View(ListaLineas);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar las lineas");
            }
        }


        public ActionResult Consulta()
        {
            ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Consulta(int id)
        {
            return RedirectToAction("Index", new { id });
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Crear()
        {
            try
            {
                ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                ViewBag.Provincias = mantConsulta.ListaProvincias();
                ViewBag.Tarifas = mantTarifa.ConsultarTarifas().Where(x => x.Estado == true).ToList();
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
        public ActionResult Crear(Linea linea)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantLinea.CreaLinea(linea.IdEmpresa, linea.Descripcion, linea.CodigoCTP, linea.IdTarifa, linea.Provincia, linea.Canton, linea.Distrito, linea.Estado))
                    {
                        return RedirectToAction("Consulta");
                    }
                    else
                    {
                        ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                        ViewBag.Tarifas = mantTarifa.ConsultarTarifas().Where(x => x.Estado == true).ToList();
                        ViewBag.Provincias = mantConsulta.ListaProvincias();
                        ViewBag.Cantones = mantConsulta.ListaCantones(linea.Provincia);
                        ViewBag.Distritos = mantConsulta.ListaDistritos(linea.Provincia, linea.Canton);
                        ViewBag.Creado = false;
                        mantBitacora.RegistrarBitacora("Linea", "Crear linea", "Error al crear linea", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        return View(linea);
                    }
                }
                else
                {
                    ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                    ViewBag.Tarifas = mantTarifa.ConsultarTarifas().Where(x => x.Estado == true).ToList();
                    ViewBag.Provincias = mantConsulta.ListaProvincias();
                    ViewBag.Cantones = mantConsulta.ListaCantones(linea.Provincia);
                    ViewBag.Distritos = mantConsulta.ListaDistritos(linea.Provincia, linea.Canton);
                    return View(linea);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Linea", "Crear linea", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al agregar la linea");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Editar(int idLinea)
        {
            try
            {
                var dato = mantLinea.ConsultarLinea(idLinea);

                Linea linea = new Linea();

                linea.IdEmpresa = dato.IdEmpresa;
                linea.IdLinea = dato.IdLinea;
                linea.Descripcion = dato.Descripcion;
                linea.CodigoCTP = dato.CodigoCTP;
                linea.IdTarifa = dato.IdTarifa;
                linea.Provincia = (char)dato.Provincia;
                linea.Canton = dato.Canton;
                linea.Distrito = dato.Distrito;
                linea.Estado = dato.Estado;

                ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                ViewBag.Tarifas = mantTarifa.ConsultarTarifas().Where(x => x.Estado == true).ToList();
                ViewBag.Provincias = mantConsulta.ListaProvincias();
                ViewBag.Cantones = mantConsulta.ListaCantones(linea.Provincia);
                ViewBag.Distritos = mantConsulta.ListaDistritos(linea.Provincia, linea.Canton);

                return View(linea);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la linea");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Linea linea)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantLinea.ActualizaLinea(linea.IdEmpresa, linea.IdLinea, linea.Descripcion, linea.CodigoCTP, linea.IdTarifa, linea.Provincia, linea.Canton, linea.Distrito, linea.Estado))
                    {
                        return RedirectToAction("Consulta");
                    }
                    else
                    {
                        ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                        ViewBag.Tarifas = mantTarifa.ConsultarTarifas().Where(x => x.Estado == true).ToList();
                        ViewBag.Provincias = mantConsulta.ListaProvincias();
                        ViewBag.Cantones = mantConsulta.ListaCantones(linea.Provincia);
                        ViewBag.Distritos = mantConsulta.ListaDistritos(linea.Provincia, linea.Canton);
                        ViewBag.Actualizado = false;
                        mantBitacora.RegistrarBitacora("Linea", "Editar linea", "Error al editar linea", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        return View();
                    }
                }
                else
                {
                    ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
                    ViewBag.Tarifas = mantTarifa.ConsultarTarifas().Where(x => x.Estado == true).ToList();
                    ViewBag.Provincias = mantConsulta.ListaProvincias();
                    ViewBag.Cantones = mantConsulta.ListaCantones(linea.Provincia);
                    ViewBag.Distritos = mantConsulta.ListaDistritos(linea.Provincia, linea.Canton);

                    return View(linea);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Linea", "Editar linea", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al editar la linea");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Eliminar(int idLinea)
        {
            try
            {
                var dato = mantLinea.ConsultarLinea(idLinea);

                Linea linea = new Linea();

                linea.IdEmpresa = dato.IdEmpresa;
                linea.IdLinea = dato.IdLinea;
                linea.Descripcion = dato.Descripcion;
                linea.CodigoCTP = dato.CodigoCTP;
                linea.Provincia = (char)dato.Provincia;
                linea.Canton = dato.Canton;
                linea.Distrito = dato.Distrito;
                linea.Estado = dato.Estado;
                linea.NombreEmpresa = dato.NombreEmpresa;
                linea.NombreProvincia = dato.NombreProvincia;
                linea.NombreCanton = dato.NombreCanton;
                linea.NombreDistrito = dato.NombreDistrito;

                return View(linea);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la linea");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Eliminar(Linea linea)
        {
            try
            {
                if (mantLinea.EliminaLinea(linea.IdLinea))
                {
                    return RedirectToAction("Consulta");
                }
                else
                {
                    ViewBag.error = true;
                    mantBitacora.RegistrarBitacora("Linea", "Eliminar linea", "Error al eliminar linea", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                    return View(linea);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Linea", "Eliminar linea", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al eliminar la linea");
            }
        }


        [HttpPost]
        public JsonResult CargaCantones(char provincia)
        {
            List<CantonesResult> cantones = mantConsulta.ListaCantones(provincia);
            return Json(cantones, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult CargaDistritos(char provincia, string canton)
        {
            List<DistritosResult> distritos = mantConsulta.ListaDistritos(provincia, canton);
            return Json(distritos, JsonRequestBehavior.AllowGet);
        }
    }
}