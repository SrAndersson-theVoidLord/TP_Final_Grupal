using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;


namespace Negocio
{
    public class DV_HardwareNegocio
    {

        public DV_HardwareNegocio()
        {

        }

        public DV_Hardware get_DV_HardwareNegocio(int id_hard, int id_vent)
        {

            DV_Hardware cat = new DV_Hardware();
            DAO_DV_Haedware dao = new DAO_DV_Haedware();
            cat.Id_hardware = id_hard;
            cat.Id_ventas = id_vent;
            return dao.get_DV_Haedware(cat);
        }

        public bool agregar_DV_HardwareNegocio(int id_vent, int id_hard, int cant)
        {
            int cantFilas = 0;

            DV_Hardware cat = new DV_Hardware();
            cat.Id_ventas = id_vent;
            cat.Id_hardware = id_hard;
            cat.Cantidad_total = cant;

            DAO_DV_Haedware dao = new DAO_DV_Haedware();
            cantFilas = dao.agregar_DV_Hardware(cat);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }

    }
}
