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

    }
}
