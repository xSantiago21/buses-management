using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Unidad
    {
        [DisplayName("Id Unidad")]
        public int IdUnidad { get; set; }

        [Required]
        [DisplayName("Empresa")]
        public int IdEmpresa { get; set; }

        [Required]
        [DisplayName("Línea")]
        public int IdLinea { get; set; }

        [Required]
        [DisplayName("Descripción")]
        [StringLength(50)]
        public string Descripcion { get; set; }

        [Required]
        [DisplayName("Tipo Placa")]
        public int IdTipoPlaca { get; set; }

        [Required]
        [StringLength(50)]
        public string Placa { get; set; }

        public bool Estado { get; set; }

        [DisplayName("Tipo Placa")]
        public string NombreTipoPlaca { get; set; }

    }
}