using BLL;
using PrograAvanzada.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PrograAvanzada.Controllers
{
    [AuthorizeRole(Role.Admin)]
    public class TipoPlacaController : Controller
    {

        mantTipoPlaca mantTipoPlaca = new mantTipoPlaca();

        // GET: TipoPlaca
        public ActionResult Index()
        {
            try
            {
                var datos = mantTipoPlaca.ConsultarTiposPlaca();

                List<TipoPlaca> ListaTiposPlaca = new List<TipoPlaca>();

                foreach (var actual in datos)
                {
                    TipoPlaca tipoPlaca = new TipoPlaca();

                    tipoPlaca.IdTipoPlaca = actual.IdTipoPlaca;
                    tipoPlaca.Descripcion = actual.Descripcion;
                    tipoPlaca.Estado = actual.Estado;

                    ListaTiposPlaca.Add(tipoPlaca);
                }
                return View(ListaTiposPlaca);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar tipos de placa");
            }
        }

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
        [ValidateAntiForgeryToken]
        public ActionResult Crear(TipoPlaca tipoPlaca)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantTipoPlaca.CreaTipoPlaca(tipoPlaca.Descripcion, tipoPlaca.Estado))
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        mantBitacora.RegistrarBitacora("TipoPlaca", "Crear tipo placa", "Error al crear placa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        ViewBag.Creado = false;
                        return View(tipoPlaca);
                    }
                }
                else
                {
                    return View(tipoPlaca);
                }

            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("TipoPlaca", "Crear tipo placa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al agregar el tipo de placa");
            }
        }

        public ActionResult Editar(int idTipoPlaca)
        {
            try
            {
                var dato = mantTipoPlaca.ConsultarTipoPlaca(idTipoPlaca);

                TipoPlaca tipoPlaca = new TipoPlaca();

                tipoPlaca.IdTipoPlaca = dato.IdTipoPlaca;
                tipoPlaca.Descripcion = dato.Descripcion;
                tipoPlaca.Estado = dato.Estado;

                return View(tipoPlaca);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar tipo de placa");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(TipoPlaca tipoPlaca)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (mantTipoPlaca.ActualizaTipoPlaca(tipoPlaca.IdTipoPlaca, tipoPlaca.Descripcion, tipoPlaca.Estado))
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        mantBitacora.RegistrarBitacora("TipoPlaca", "Editar tipo placa", "Error al editar placa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                        ViewBag.Actualizado = false;
                        return View();
                    }
                }
                else
                {
                    return View(tipoPlaca);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("TipoPlaca", "Editar tipo placa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al editar el tipo de placa");
            }
        }

        public ActionResult Eliminar(int idTipoPlaca)
        {
            try
            {
                var dato = mantTipoPlaca.ConsultarTipoPlaca(idTipoPlaca);

                TipoPlaca tipoPlaca = new TipoPlaca();

                tipoPlaca.IdTipoPlaca = dato.IdTipoPlaca;
                tipoPlaca.Descripcion = dato.Descripcion;
                tipoPlaca.Estado = dato.Estado;

                return View(tipoPlaca);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar el tipo de placa");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Eliminar(TipoPlaca tipoPlaca)
        {
            try
            {
                if (mantTipoPlaca.EliminaTipoPlaca(tipoPlaca.IdTipoPlaca))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    mantBitacora.RegistrarBitacora("TipoPlaca", "Eliminar tipo placa", "Error al eliminar placa", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                    ViewBag.error = true;
                    return View(tipoPlaca);
                }
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("TipoPlaca", "Eliminar tipo placa", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al eliminar el tipo de placa");
            }
        }

    }
}