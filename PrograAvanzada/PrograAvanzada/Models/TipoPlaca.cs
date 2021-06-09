using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class TipoPlaca
    {
        [DisplayName("Id Tipo Placa")]
        public int IdTipoPlaca { get; set; }

        [Required]
        [DisplayName("Descripción")]
        [StringLength(50)]
        public string Descripcion { get; set; }

        public bool Estado { get; set; }

    }
}