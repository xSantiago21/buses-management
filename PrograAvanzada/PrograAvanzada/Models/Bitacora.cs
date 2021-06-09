using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Bitacora
    {
        public string Controlador { get; set; }

        [DisplayName("Acción")]
        public string Accion { get; set; }

        public string Error { get; set; }

        public int Tipo { get; set; }

        public DateTime Fecha { get; set; }

        [DisplayName("Id Usuario")]
        public int IdUsuario { get; set; }
    }
}