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

    }
}
