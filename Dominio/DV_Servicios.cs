using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DV_Servicios
    {
        public int id_dv_servicios { get; set; }
        public int id_venta { get; set; }
        public int id_actividad { get; set; }
        public string descripcion { get; set; }
        public double subtotal { get; set; }

    }
}
