using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio;
using System.Data;
using System.Data.SqlClient;


namespace Dao
{
    public class DAO_Hardware
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Hardware(){
        }

        public Hardware get_Hardware(Hardware cat)
        {
            DataTable tabla = ds.ObtenerTabla("Hardware", "Select * from Hardware where Id_Hardware_HAR =" + cat.Id_hardware);



            cat.Id_hardware = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Str_categoria = tabla.Rows[0][1].ToString();
            cat.Nombre = tabla.Rows[0][2].ToString();
            cat.Descripcion = tabla.Rows[0][3].ToString();
            cat.Imagen = tabla.Rows[0][4].ToString();
            cat.Precio_unitario = Convert.ToSingle(tabla.Rows[0][5].ToString());
            cat.Estado = Convert.ToBoolean(tabla.Rows[0][6].ToString());

            return cat;
        }


    }
}
