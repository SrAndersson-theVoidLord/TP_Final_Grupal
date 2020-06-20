using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        private int id_Usuario;
        private string dni;
        private string nombre;
        private string apellido;
        private string nombreusuario;
        private string constraseña;
        private string direccion;
        private string localidad;
        private string cp;
        private string telefono;
        private string email;
        private Boolean estado;

        public Usuario()
        {

        }


        public int Id_Usuario { get => id_Usuario; set => id_Usuario = value; }
        public string Dni { get => dni; set => dni = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Nombreusuario { get => nombreusuario; set => nombreusuario = value; }
        public string Constraseña { get => constraseña; set => constraseña = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Localidad { get => localidad; set => localidad = value; }
        public string Cp { get => cp; set => cp = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Email { get => email; set => email = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
