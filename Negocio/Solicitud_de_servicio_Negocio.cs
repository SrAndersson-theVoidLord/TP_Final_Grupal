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
    public class Solicitud_de_servicio_Negocio
    {

        public Solicitud_de_servicio_Negocio()
        {

        }

        public Solicitud_de_servicio get_Solicitud_de_servicio_Negocio(int id)
        {

            Solicitud_de_servicio cat = new Solicitud_de_servicio();
            DAO_Solicitud_de_servicio dao = new DAO_Solicitud_de_servicio();
            cat.Id_solicitud_de_servicio = id;
            return dao.get_Solicitud_de_servicio(cat);
        }

        public DataTable Obtener_tabla_Solicitud_de_servicio(string comnado)
        {
            DAO_Solicitud_de_servicio dao_hard = new DAO_Solicitud_de_servicio();

            return dao_hard.Obtener_tabla_Solicitud_de_servicio(comnado);

        }

        public bool agregar_Solicitud_de_servicio(int id_cliente, string desctipcion)
        {
            int cantFilas = 0;

            Solicitud_de_servicio cat = new Solicitud_de_servicio();
            cat.Id_cliente = id_cliente;
            cat.Descripcion = desctipcion;
            

            DAO_Solicitud_de_servicio dao = new DAO_Solicitud_de_servicio();
            cantFilas = dao.agregar_Solicitud_de_servicio(cat);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool Dar_de_baja_Solicitud_de_servicio(int id_solicitud)
        {
            int cantFilas = 0;

            Solicitud_de_servicio cat = new Solicitud_de_servicio();
            cat.Id_solicitud_de_servicio = id_solicitud;

            DAO_Solicitud_de_servicio dao = new DAO_Solicitud_de_servicio();
            cantFilas = dao.Dar_de_baja_Solicitud_de_servicio(cat);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }

    }
}
