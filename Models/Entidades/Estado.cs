﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Estados")]
    public class Estado
    {
        [Key]
        [Column("EstadoId")]
        public int Id { get; set; }
        public string Descripcion { get; set; }
    }
}
