using PrograAvanzada.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;

namespace PrograAvanzada.Controllers
{

    [AuthorizeRole(Role.Cliente)]
    public class DepositoController : Controller
    {
        mantDeposito mantDeposito = new mantDeposito();

        // GET: Deposito
        public ActionResult Index()
        {
            try
            {
                var datos = mantDeposito.ConsultarDepositos(Convert.ToInt32(HttpContext.User.Identity.Name));

                List<Deposito> Depositos = new List<Deposito>();

                foreach (var actual in datos)
                {
                    Deposito deposito = new Deposito();

                    deposito.Monto = actual.Monto;
                    deposito.Fecha = actual.Fecha;
                    deposito.Telefono = actual.Telefono;
                    deposito.Estado = actual.Estado;

                    Depositos.Add(deposito);
                }
                return View(Depositos);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar depósitos");
            }
        }


        public ActionResult Crear()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Crear(Recarga recarga)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    int IdUsuario = Convert.ToInt32(HttpContext.User.Identity.Name);

                    decimal monto = 0;

                    if (recarga.Codigo == 100100)
                    {
                        monto = 1000;
                    } else if (recarga.Codigo == 200200) {
                        monto = 2000;
                    }

                    if (recarga.Codigo == 100100 || recarga.Codigo == 200200)
                    {
                        if (mantDeposito.CreaDeposito(IdUsuario, monto, DateTime.Now, Session["Telefono"].ToString(), "PG"))
                        {
                            ViewBag.Recargado = true;
                            ViewBag.Monto = monto;

                            decimal montoActual = (decimal)Session["Saldo"];
                            decimal montoNuevo = montoActual + monto;
                            Session["Saldo"] = montoNuevo;

                            return View(recarga);
                        }
                        else
                        {
                            mantBitacora.RegistrarBitacora("Deposito", "Crear Deposito", "Error al recargar", 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                            ViewBag.Recargado = false;
                            return View(recarga);
                        }
                    }
                    else
                    {
                        ViewBag.ExisteCodigo = false;
                        return View(recarga);
                    }

                }
                else
                {
                    return View(recarga);
                }

            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Deposito", "Crear Deposito", e.Message, 1, DateTime.Now, Convert.ToInt32(HttpContext.User.Identity.Name));
                return new HttpNotFoundResult("Error al recargar");
            }
        }

    }
}