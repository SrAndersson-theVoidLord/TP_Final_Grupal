using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class InformeVentasDetalle
    {
        private int idventa;
        private string descripcion;
        private int cantidad;
        private double subtotal;

        public  InformeVentasDetalle()
        {
        }

        public int Idventa { get => idventa; set => idventa = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
        public double Subtotal { get => subtotal; set => subtotal = value; }
    }
}
