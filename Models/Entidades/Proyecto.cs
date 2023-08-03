using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Proyectos")]
    public class Proyecto
    {
        [Key]
        [Column("ProyectoId")]
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int? ProyectoPadre { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaActualizacion { get; set; }
        public int EstadoId { get; set; }

        [ForeignKey("EstadoId")]
        public Estado Estado { get; set; }

    }
}
