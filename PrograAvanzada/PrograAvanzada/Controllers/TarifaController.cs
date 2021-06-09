using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PrograAvanzada.Models;

namespace PrograAvanzada.Controllers
{
    [AuthorizeRole(Role.Gerente, Role.Supervisor)]
    public class TarifaController : Controller
    {
        mantTarifa mantTarifa = new mantTarifa();

        // GET: Tarifa
        public ActionResult Index()
        {
            try
            {
                var datos = mantTarifa.ConsultarTarifas();

                List<Tarifa> ListaTarifas = new List<Tarifa>();

                foreach (var actual in datos)
                {
                    Tarifa tarifa = new Tarifa();

                    tarifa.IdTarifa = actual.IdTarifa;
                    tarifa.Descripcion = actual.Descripcion;
                    tarifa.Monto = actual.Monto;
                    tarifa.Estado = actual.Estado;

                    ListaTarifas.Add(tarifa);
                }
                return View(ListaTarifas);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar las tarifas");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Crear()
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

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Crear(Tarifa tarifa)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantTarifa.CreaTarifa(tarifa.Descripcion, tarifa.Monto, tarifa.Estado))
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        mantBitacora.RegistrarBitacora("Tarifa", "Crear tarifa", "Error al crear tarifa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        ViewBag.Creado = false;
                        return View(tarifa);
                    }
                }
                else
                {
                    return View(tarifa);
                }

            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Tarifa", "Crear tarifa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al agregar la tarifa");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Editar(int idTarifa)
        {
            try
            {
                var dato = mantTarifa.ConsultarTarifa(idTarifa);

                Tarifa tarifa = new Tarifa();

                tarifa.IdTarifa = dato.IdTarifa;
                tarifa.Descripcion = dato.Descripcion;
                tarifa.Monto = dato.Monto;
                tarifa.Estado = dato.Estado;

                return View(tarifa);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la tarifa");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Tarifa tarifa)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantTarifa.ActualizaTarifa(tarifa.IdTarifa, tarifa.Descripcion, tarifa.Monto, tarifa.Estado))
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        mantBitacora.RegistrarBitacora("Tarifa", "Editar tarifa", "Error a leditar tarifa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        ViewBag.Actualizado = false;
                        return View();
                    }
                }
                else
                {
                    return View(tarifa);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Tarifa", "Editar tarifa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al editar la tarifa");
            }
        }

        [AuthorizeRole(Role.Gerente)]
        public ActionResult Eliminar(int idTarifa)
        {
            try
            {
                var dato = mantTarifa.ConsultarTarifa(idTarifa);

                Tarifa tarifa = new Tarifa();

                tarifa.IdTarifa = dato.IdTarifa;
                tarifa.Descripcion = dato.Descripcion;
                tarifa.Monto = dato.Monto;
                tarifa.Estado = dato.Estado;

                return View(tarifa);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la tarifa");
            }
        }

        [HttpPost]
        [AuthorizeRole(Role.Gerente)]
        [ValidateAntiForgeryToken]
        public ActionResult Eliminar(Tarifa tarifa)
        {
            try
            {
                if (mantTarifa.EliminaTarifa(tarifa.IdTarifa))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    mantBitacora.RegistrarBitacora("Tarifa", "Eliminar tarifa", "Error al eliminar tarifa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                    ViewBag.error = true;
                    return View(tarifa);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Tarifa", "Elimiar tarifa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al eliminar la tarifa");
            }
        }

    }
}