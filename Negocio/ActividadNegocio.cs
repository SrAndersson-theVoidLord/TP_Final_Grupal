using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;


namespace Negocio
{
    public class ActividadNegocio
    {

        public ActividadNegocio()
        {

        }

        public Actividad get_ActividadNegocio(int id_acti)
        {

            Actividad cat = new Actividad();
            DAO_Actividades dao = new DAO_Actividades();
            cat.Id_actividad = id_acti;
            return dao.get_Actividades(cat);
        }

        public bool agregar_ActividadNegocio(int id_cliente, int id_empleado, int id_típo, string descripcion, int horas_trabajadas)
        {
            int cantFilas = 0;

            Actividad cat = new Actividad();
            cat.Id_cliente = id_cliente;
            cat.Id_empleado = id_empleado;
            cat.Id_tipo_pedido = id_típo;
            cat.Descripcion = descripcion;
            cat.Horas_trabajadas = horas_trabajadas;

            DAO_Actividades dao = new DAO_Actividades();
            cantFilas = dao.agregar_Actividades(cat);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public int Obtener_Ultimo_id_Actividad()
        {

            DAO_Actividades dao = new DAO_Actividades();
            return dao.Obtener_Ultimo_id_Actividades();

        }

        public bool agregar_Actividad_Negocio_armado(int id_cliente, int id_empleado, int id_típo, string descripcion, float total_armado)
        {
            int cantFilas = 0;

            Actividad cat = new Actividad();
            cat.Id_cliente = id_cliente;
            cat.Id_empleado = id_empleado;
            cat.Id_tipo_pedido = id_típo;
            cat.Descripcion = descripcion;
            cat.Subtotal = total_armado;

            DAO_Actividades dao = new DAO_Actividades();
            cantFilas = dao.agregar_Actividades_armado(cat);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }

    }
}
