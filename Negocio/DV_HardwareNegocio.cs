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

    }
}
