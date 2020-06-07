using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Ventas
    {
        public int id_venta { get; set; }
        public int id_cliente { get; set; }
        public DateTime fecha { get; set; }
        public Double total { get; set; }
        public Boolean estado { get; set; }


    }
}
