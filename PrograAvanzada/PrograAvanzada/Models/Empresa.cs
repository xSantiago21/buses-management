using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Empresa
    {
        [DisplayName("Id Empresa")]
        public int IdEmpresa { get; set; }

        [Required]
        [DisplayName("Descripción")]
        [StringLength(50)]
        public string Descripcion { get; set; }

        [Required]
        [DisplayName("Tipo Identificación")]
        public int IdTipoIdentificacion { get; set; }

        [Required]
        [DisplayName("Identificación")]
        [StringLength(30)]
        public string Identificacion { get; set; }

        [Required]
        [DisplayName("Teléfono")]
        [StringLength(20)]
        [RegularExpression(@"^(\(\+?\d{2,3}\)[\*|\s|\-|\.]?(([\d][\*|\s|\-|\.]?){6})(([\d][\s|\-|\.]?){2})?|(\+?[\d][\s|\-|\.]?){8}(([\d][\s|\-|\.]?){2}(([\d][\s|\-|\.]?){2})?)?)$$", 
            ErrorMessage = "Número de teléfono inválido.")]
        public string Telefono { get; set; }

        [Required]
        [StringLength(50)]
        public string Contacto { get; set; }

        public bool Estado { get; set; }

        [DisplayName("Tipo identificación")]
        public string DescTipoIdentificacion { get; set; }


    }
}