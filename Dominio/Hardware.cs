using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Dominio
{
    public class Hardware
    {
        private int id_hardware;
        private CategoriaHardware categoria;
        private string str_categoria;
        private string nombre;
        private string descripcion;
        private string imagen;
        private double precio_unitario;
        private Boolean estado;

        public Hardware()
        {

        }

        public int Id_hardware { get => id_hardware; set => id_hardware = value; }
        public string Str_categoria { get => str_categoria; set => str_categoria = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public string Imagen { get => imagen; set => imagen = value; }
        public double Precio_unitario { get => precio_unitario; set => precio_unitario = value; }
        public bool Estado { get => estado; set => estado = value; }
        public CategoriaHardware Categoria { get => categoria; set => categoria = value; }

        

    }
}