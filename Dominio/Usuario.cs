using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public int id_cliente { get; set; }
        public string nombreusuario { get; set; }
        public string constraseña { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public int dni { get; set; }
        public string localidad { get; set; }
        public string direccion { get; set; }
        public int numero { get; set; }
        public string cp { get; set; }
        public string telefono { get; set; }
        public string email { get; set; }
        public Boolean estado { get; set; }

    }
}
