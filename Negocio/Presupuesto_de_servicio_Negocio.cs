using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

using Dominio;
using Dao;

namespace Negocio
{
    public class Presupuesto_de_servicio_Negocio
    {

        public Presupuesto_de_servicio_Negocio()
        {

        }

        public Presupuesto_de_servicio get_Presupuesto_de_servicio_Negocio(int id)
        {

            Presupuesto_de_servicio cat = new Presupuesto_de_servicio();
            DAO_Presupuesto_de_servicio dao = new DAO_Presupuesto_de_servicio();
            cat.Id_presupuesto = id;
            return dao.get_Presupuesto_de_servicio(cat);
        }

        public DataTable Obtener_tabla_Presupuesto_de_servicio(string comnado)
        {
            DAO_Presupuesto_de_servicio dao_hard = new DAO_Presupuesto_de_servicio();

            return dao_hard.Obtener_tabla_Presupuesto_de_servicio(comnado);

        }

        public bool agregar_Presupuesto_de_servicio(int id_solisitud, int id_cliente, int id_empleado, int id_tipo, int horas_trabajadas, string desctipcion)
        {
            int cantFilas = 0;

            Presupuesto_de_servicio cat = new Presupuesto_de_servicio();
            cat.Id_solisitud = id_solisitud;
            cat.Id_cliente = id_cliente;
            cat.Id_empleado = id_empleado;
            cat.Id_tipo = id_tipo;
            cat.Horas_trabajadas = horas_trabajadas;
            cat.Descripcion = desctipcion;

            DAO_Presupuesto_de_servicio dao = new DAO_Presupuesto_de_servicio();
            cantFilas = dao.agregar_Presupuesto_de_servicio(cat);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool Dar_de_baja_Presupuesto_de_servicio(int id_presupuesto)
        {
            int cantFilas = 0;

            Presupuesto_de_servicio cat = new Presupuesto_de_servicio();
            cat.Id_presupuesto = id_presupuesto;

            DAO_Presupuesto_de_servicio dao = new DAO_Presupuesto_de_servicio();
            cantFilas = dao.Dar_de_baja_Presupuesto_de_servicio(cat);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }

    }
}
