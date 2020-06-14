using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DV_Hardware
    {
        public int id_ventas { get; set; }
        public int id_hardware { get; set; }
        public Double precio_unitario { get; set; }
        public int cantidad_total { get; set; }
        public double subtotal { get; set; }

    }
}
