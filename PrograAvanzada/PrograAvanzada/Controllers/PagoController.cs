using BLL;
using PrograAvanzada.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PrograAvanzada.Controllers
{
    public class PagoController : Controller
    {
        mantPago mantPago = new mantPago();
        mantUsuario mantUsuario = new mantUsuario();
        mantEmpresa mantEmpresa = new mantEmpresa();

        // GET: Pago
        public ActionResult Index(string id)
        {
            try
            {
                int idUsuario = Convert.ToInt32(id);
                
                //Obtengo usuario para validar que exista y obtener el saldo de nuevo
                var dato = mantUsuario.ConsultaUsuario(idUsuario);
                if (dato == null)
                {
                    mantBitacora.RegistrarBitacora("Pago", "Realizar Pago", "Id Usuario Invalido", 1, DateTime.Now, idUsuario);
                    ViewBag.IdUsuarioInvalido = true;
                }
                else
                { //Existe usuario

                    //Valido una tarifa quemada para prueba
                    if (dato.Saldo < 400 || (dato.Saldo - 400) < 0)
                    {
                        ViewBag.SaldoInsuficiente = true;
                    }
                    else
                    {

                        //Registro el pago
                        if (mantPago.RegistrarPago(1, 1, idUsuario, 400, DateTime.Now, 9.748917M, -83.753428M, "PG"))//Mando algunos datos quemados para prueba
                        {
                            mantBitacora.RegistrarBitacora("Pago", "Realizar Pago", "Pago realizado con exito", 0, DateTime.Now, idUsuario);
                            ViewBag.PagoRealizado = true;
                        }
                        else
                        {
                            mantBitacora.RegistrarBitacora("Pago", "Realizar Pago", "Error al realizar pago", 1, DateTime.Now, idUsuario);
                            ViewBag.PagoRealizado = false;
                        }

                    }

                }

                return View();
            }
            catch (Exception e)
            {
                mantBitacora.RegistrarBitacora("Pago", "Realizar Pago", e.Message, 1, DateTime.Now, -1);
                return new HttpNotFoundResult(e.Message);
            }

        }

        [AuthorizeRole(Role.Supervisor)]
        public ActionResult ConsultaPagosEmpresa()
        {
            ViewBag.Empresas = mantEmpresa.ConsultarEmpresas().Where(x => x.Estado == true).ToList();
            return View();
        }

        [AuthorizeRole(Role.Supervisor)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ConsultaPagosEmpresa(int idEmpresa)
        {
            return RedirectToAction("VerPagosEmpresa", new { idEmpresa });
        }

        [AuthorizeRole(Role.Supervisor)]
        public ActionResult VerPagosEmpresa(int idEmpresa)
        {
            try
            {
                var datos = mantPago.ConsultarPagosEmpresa(idEmpresa);

                List<Pago> Pagos = new List<Pago>();

                foreach (var actual in datos)
                {
                    Pago pago = new Pago();

                    pago.NombreEmpresa = actual.NombreEmpresa;
                    pago.NombreUnidad = actual.NombreUnidad;
                    pago.IdentificacionUsuario = actual.Identificacion;
                    pago.Monto = actual.Monto;
                    pago.Fecha = actual.Fecha;
                    pago.Latitud = actual.Latitud;
                    pago.Longitud = actual.Longitud;
                    pago.Estado = actual.Estado;

                    Pagos.Add(pago);
                }
                return View(Pagos);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar pagos");
            }
        }

        [AuthorizeRole(Role.Cliente)]
        public ActionResult VerPagosUsuario()
        {
            try
            {
                var datos = mantPago.ConsultarPagosUsuario(Convert.ToInt32(HttpContext.User.Identity.Name));

                List<Pago> Pagos = new List<Pago>();

                foreach (var actual in datos)
                {
                    Pago pago = new Pago();

                    pago.NombreEmpresa = actual.NombreEmpresa;
                    pago.NombreUnidad = actual.NombreUnidad;
                    pago.Monto = actual.Monto;
                    pago.Fecha = actual.Fecha;
                    pago.Latitud = actual.Latitud;
                    pago.Longitud = actual.Longitud;
                    pago.Estado = actual.Estado;
                    
                    Pagos.Add(pago);
                }
                return View(Pagos);
            }
            catch (Exception ex)
            {
                return new HttpNotFoundResult("Error al consultar pagos");
            }
        }


    }
}