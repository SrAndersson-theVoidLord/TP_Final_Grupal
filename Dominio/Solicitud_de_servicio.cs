using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Solicitud_de_servicio
    {

        private int id_solicitud_de_servicio;
        private int id_cliente;
        private string descripcion;
        private bool estado;

        public Solicitud_de_servicio()
        {

        }

        public int Id_solicitud_de_servicio { get => id_solicitud_de_servicio; set => id_solicitud_de_servicio = value; }
        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
