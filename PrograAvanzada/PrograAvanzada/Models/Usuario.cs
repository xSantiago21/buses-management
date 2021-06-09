using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PrograAvanzada.Models
{
    public class Usuario
    {
        [DisplayName("Id Usuario")]
        public int IdUsuario { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [DisplayName("Segundo Nombre")]
        [StringLength(50)]
        public string Nombre2 { get; set; }

        [Required]
        [DisplayName("Apellido 1")]
        [StringLength(50)]
        public string Apellido1 { get; set; }

        [Required]
        [DisplayName("Apellido 2")]
        [StringLength(50)]
        public string Apellido2 { get; set; }

        [Required]
        public int IdTipoIdentificacion { get; set; }

        [Required]
        [DisplayName("Identificación")]
        [StringLength(30)]
        public string Identificacion { get; set; }

        public decimal Saldo { get; set; }

        [Required]
        [DisplayName("Teléfono")]
        [StringLength(20)]
        [RegularExpression(@"^(\(\+?\d{2,3}\)[\*|\s|\-|\.]?(([\d][\*|\s|\-|\.]?){6})(([\d][\s|\-|\.]?){2})?|(\+?[\d][\s|\-|\.]?){8}(([\d][\s|\-|\.]?){2}(([\d][\s|\-|\.]?){2})?)?)$$",
            ErrorMessage = "Número de teléfono inválido.")]
        public string Telefono { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$", ErrorMessage = "Correo inválido.")]
        [StringLength(50)]
        public string Correo { get; set; }

        [Required]
        [StringLength(50)]
        public string Clave { get; set; }
        public bool Estado { get; set; }

        [DisplayName("Admin")]
        public bool EsAdmin { get; set; }
        [DisplayName("Gerente")]
        public bool EsGerente { get; set; }
        [DisplayName("Supervisor")]
        public bool EsSupervisor { get; set; }
        [DisplayName("Cliente")]
        public bool EsCliente { get; set; }

        [DisplayName("Tipo Identificación")]
        public string NombreTipoId { get; set; }

    }
}