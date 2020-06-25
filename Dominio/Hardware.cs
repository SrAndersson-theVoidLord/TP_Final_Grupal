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
        private Single precio_unitario;
        private Boolean estado;

        public Hardware()
        {

        }

        public int Id_hardware { get => id_hardware; set => id_hardware = value; }
        public string Str_categoria { get => str_categoria; set => str_categoria = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public string Imagen { get => imagen; set => imagen = value; }
        public Single Precio_unitario { get => precio_unitario; set => precio_unitario = value; }
        public bool Estado { get => estado; set => estado = value; }
        public CategoriaHardware Categoria { get => categoria; set => categoria = value; }

        //Gets

        //public int getId_hardware()
        //{
        //    return id_hardware;
        //}

        //public string getstr_categoria()
        //{
        //    return str_categoria;
        //}

        //public string getnombre()
        //{
        //    return nombre;
        //}

        //public string getdescripcion()
        //{
        //    return descripcion;
        //}

        //public string getimagen()
        //{
        //    return imagen;
        //}

        //public Single getprecio_unitario()
        //{
        //    return precio_unitario;
        //}

        //public bool getestado()
        //{
        //    return estado;
        //}

        ////Sets

        //public void setId_hardware(int x)
        //{
        //    id_hardware = x;
        //}

        //public void set_str_categoria(string x)
        //{
        //    str_categoria = x;
        //}

        //public void set_nombre(string x)
        //{
        //    nombre = x;
        //}

        //public void set_descripcion(string x)
        //{
        //    descripcion = x;
        //}

        //public void set_imagen(string x)
        //{
        //    imagen = x;
        //}

        //public void set_Precio_unitario(Single x)
        //{
        //    precio_unitario = x;
        //}

        //public void set_Estado(bool x)
        //{
        //    estado = x;
        //}

    }
}