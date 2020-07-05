using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class InformeVentas
    {
        private Ventas venta;
        private Usuario usuario;

        public InformeVentas()
        {

        }

        public Ventas Venta { get => venta; set => venta = value; }
        public Usuario Usuario { get => usuario; set => usuario = value; }
    }
}
