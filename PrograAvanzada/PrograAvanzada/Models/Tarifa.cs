using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Tarifa
    {
        [DisplayName("Id Tarifa")]
        public int IdTarifa { get; set; }

        [Required]
        [DisplayName("Descripción")]
        [StringLength(50)]
        public string Descripcion { get; set; }

        [Required]
        public decimal Monto { get; set; }
        public bool Estado { get; set; }
    }
}