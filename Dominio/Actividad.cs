using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Actividad
    {
        public int id_actividad { get; set; }
        public int id_cliente { get; set; }
        public int id_empleado { get; set; }
        public int id_tipo_pedido { get; set; }
        public string descripcion { get; set; }
        public double precio_por_Hora { get; set; }
        public int horas_trabajadas { get; set; }
        public Double subtotal { get; set; }
        public DateTime fecha { get; set; }
        public string estado_act { get; set; }
    }
}
