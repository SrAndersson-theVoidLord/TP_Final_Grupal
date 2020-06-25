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
    class DAO_DV_Haedware
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_DV_Haedware()
        {
        }

        public DV_Hardware get_Hardware(DV_Hardware cat)
        {
            DataTable tabla = ds.ObtenerTabla("Detalles_de_ventas_x_Hardware", "Select * from Detalles_de_ventas_x_Hardware where Id_Venta_DXV_H = " + cat.Id_ventas + " OR Id_Hardware_DXV_H = " + cat.Id_hardware);

            cat.Id_ventas = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Id_hardware = Convert.ToInt32(tabla.Rows[0][1].ToString());
            cat.Precio_unitario = Convert.ToDouble(tabla.Rows[0][2].ToString());
            cat.Cantidad_total = Convert.ToInt32(tabla.Rows[0][3].ToString());
            cat.Subtotal = Convert.ToDouble(tabla.Rows[0][4].ToString());

            return cat;
        }

    }
}
