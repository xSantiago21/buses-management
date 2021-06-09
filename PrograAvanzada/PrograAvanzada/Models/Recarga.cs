using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Recarga
    {
        [Required]
        [DisplayName("Código")]
        public int Codigo { get; set; }
    }
}