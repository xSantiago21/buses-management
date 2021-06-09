using PrograAvanzada.Models;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PrograAvanzada.Controllers
{
    [AuthorizeRole(Role.Cliente)]
    public class GeneraQRController : Controller
    {
        // GET: GeneraQR
        public ActionResult Index()
        {
            string URLPago = ConfigurationManager.AppSettings["URLPago"];

            string IdUsuario = HttpContext.User.Identity.Name;//Obtengo Id de usuario
            string nombre = Session["Nombre"].ToString() + " " + Session["Apellido1"].ToString();

            ViewBag.nombreUsuario = nombre; //Envío el nombre
            ViewBag.urlPago = URLPago + IdUsuario; //Envío url para pruebas

            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(URLPago + IdUsuario, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);

            using (Bitmap bitMap = qrCode.GetGraphic(20))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    ViewBag.imageBytes = ms.ToArray();
                }
            }
            return View();
        }
    }
}