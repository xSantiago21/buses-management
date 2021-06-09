using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Deposito
    {
        public decimal Monto { get; set; }

        public DateTime Fecha { get; set; }

        [DisplayName("Teléfono")]
        public string Telefono { get; set; }

        public string Estado { get; set; }
    }
}