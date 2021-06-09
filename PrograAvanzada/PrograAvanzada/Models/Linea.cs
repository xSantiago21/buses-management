using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Linea
    {
        [DisplayName("Id Línea")]
        public int IdLinea { get; set; }

        [Required]
        [DisplayName("Empresa")]
        public int IdEmpresa { get; set; }

        [Required]
        [DisplayName("Descripción")]
        [StringLength(50)]
        public string Descripcion { get; set; }

        [Required]
        [DisplayName("Código CTP")]
        [StringLength(50)]
        public string CodigoCTP { get; set; }

        [Required]
        [DisplayName("Tarifa")]
        public int IdTarifa { get; set; }

        public decimal Monto { get; set; }

        [Required]
        [DisplayName("Provincia")]
        public char Provincia { get; set; }

        [Required]
        [DisplayName("Cantón")]
        [StringLength(2)]
        public string Canton { get; set; }

        [Required]
        [DisplayName("Distrito")]
        [StringLength(2)]
        public string Distrito { get; set; }

        public bool Estado { get; set; }

        [DisplayName("Empresa")]
        public string NombreEmpresa { get; set; }

        [DisplayName("Tarifa")]
        public string NombreTarifa { get; set; }

        [DisplayName("Provincia")]
        public string NombreProvincia { get; set; }

        [DisplayName("Cantón")]
        public string NombreCanton { get; set; }

        [DisplayName("Distrito")]
        public string NombreDistrito { get; set; }


    }
}