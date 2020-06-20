using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CategoriaHardware
    {
        private string id_categoria;
        private string descripcion;
        
        public CategoriaHardware()
        {

        }

        public string Id_categoria { get => id_categoria; set => id_categoria = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
    }
}
