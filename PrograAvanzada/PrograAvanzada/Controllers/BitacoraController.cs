using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using PrograAvanzada.Models;

namespace PrograAvanzada.Controllers
{
    [AuthorizeRole(Role.Admin)]
    public class BitacoraController : Controller
    {

        // GET: Bitacora
        public ActionResult Index()
        {
            try
            {
                var datos = mantBitacora.consultaBitacora();

                List<Bitacora> ListaBitacora = new List<Bitacora>();

                foreach (var actual in datos)
                {
                    Bitacora bitacora = new Bitacora();

                    bitacora.Controlador = actual.Controlador;
                    bitacora.Accion = actual.Accion;
                    bitacora.Error = actual.Error;
                    bitacora.Tipo = actual.Tipo;
                    bitacora.Fecha = actual.Fecha;
                    bitacora.IdUsuario = actual.IdUsuario;

                    ListaBitacora.Add(bitacora);
                }
                return View(ListaBitacora);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar la bitácora");
            }
        }
    }
}