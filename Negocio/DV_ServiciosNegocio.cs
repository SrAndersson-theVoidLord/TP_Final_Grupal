using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;


namespace Negocio
{
    public class DV_ServiciosNegocio
    {

        public DV_ServiciosNegocio()
        {

        }

        public DV_Servicios get_DV_ServiciosNegocio(int id_acti, int id_vent)
        {

            DV_Servicios cat = new DV_Servicios();
            DAO_DV_Servicios dao = new DAO_DV_Servicios();
            cat.Id_actividad = id_acti;
            cat.Id_venta = id_vent;
            return dao.get_DV_Servicios(cat);
        }

        public bool agregar_DV_ServiciosNegocio(int id_vent, int id_acti, string desc)
        {
            int cantFilas = 0;

            DV_Servicios cat = new DV_Servicios();
            cat.Id_venta = id_vent;
            cat.Id_actividad = id_acti;
            cat.Descripcion = desc;

            DAO_DV_Servicios dao = new DAO_DV_Servicios();
            cantFilas = dao.agregar_DV_Servicios(cat);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }

    }
}
