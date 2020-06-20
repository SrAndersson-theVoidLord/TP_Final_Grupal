using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DV_Servicios
    {
        private int id_venta;
        private int id_actividad;
        private string descripcion;
        private double subtotal;

        public DV_Servicios()
        {

        }

        public int Id_venta { get => id_venta; set => id_venta = value; }
        public int Id_actividad { get => id_actividad; set => id_actividad = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public double Subtotal { get => subtotal; set => subtotal = value; }
    }
}
