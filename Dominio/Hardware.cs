using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Hardware
    {
        public int id_hardware { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string imagen { get; set; }
        public double precio_unitario { get; set; }
        public int stock { get; set; }
        public Boolean estado { get; set; }

    }
}
