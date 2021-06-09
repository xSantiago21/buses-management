using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Pago
    {
        [DisplayName("Empresa")]
        public string NombreEmpresa { get; set; }

        [DisplayName("Unidad")]
        public string NombreUnidad { get; set; }

        [DisplayName("Usuario")]
        public string IdentificacionUsuario { get; set; }

        public decimal Monto { get; set; }

        public DateTime Fecha { get; set; }

        public decimal? Latitud { get; set; }
        public decimal? Longitud { get; set; }

        public string Estado { get; set; }
    }
}