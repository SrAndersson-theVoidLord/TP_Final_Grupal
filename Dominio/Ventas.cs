using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Ventas
    {
        private int id_venta;
        private int id_cliente;
        private DateTime fecha;
        private Double total;

        public Ventas()
        {

        }

        public int Id_venta { get => id_venta; set => id_venta = value; }
        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
        public double Total { get => total; set => total = value; }
    }
}
