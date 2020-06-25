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
    class DAO_Ventas
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Ventas()
        {
        }

        public Ventas get_Hardware(Ventas cat)
        {
            DataTable tabla = ds.ObtenerTabla("Ventas", "Select * from Ventas where Id_Venta_VEN =" + cat.Id_venta);

            cat.Id_venta = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Id_cliente = Convert.ToInt32(tabla.Rows[0][1].ToString());
            cat.Fecha = Convert.ToDateTime(tabla.Rows[0][2].ToString());
            cat.Total = Convert.ToDouble(tabla.Rows[0][3].ToString());
            
            return cat;
        }

    }
}
