using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DV_Hardware
    {
        private int id_ventas;
        private int id_hardware;
        private Double precio_unitario;
        private int cantidad_total;
        private double subtotal;

        public DV_Hardware()
        {

        }

        public int Id_ventas { get => id_ventas; set => id_ventas = value; }
        public int Id_hardware { get => id_hardware; set => id_hardware = value; }
        public double Precio_unitario { get => precio_unitario; set => precio_unitario = value; }
        public int Cantidad_total { get => cantidad_total; set => cantidad_total = value; }
        public double Subtotal { get => subtotal; set => subtotal = value; }
    }
}
