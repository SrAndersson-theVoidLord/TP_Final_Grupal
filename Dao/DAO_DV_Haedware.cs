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
    public class DAO_DV_Haedware
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_DV_Haedware()
        {
        }

        public DV_Hardware get_DV_Haedware(DV_Hardware cat)
        {
            DataTable tabla = ds.ObtenerTabla("Detalles_de_ventas_x_Hardware", "Select * from Detalles_de_ventas_x_Hardware where Id_Venta_DXV_H = " + cat.Id_ventas + " OR Id_Hardware_DXV_H = " + cat.Id_hardware);

            cat.Id_ventas = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Id_hardware = Convert.ToInt32(tabla.Rows[0][1].ToString());
            cat.Precio_unitario = Convert.ToDouble(tabla.Rows[0][2].ToString());
            cat.Cantidad_total = Convert.ToInt32(tabla.Rows[0][3].ToString());
            cat.Subtotal = Convert.ToDouble(tabla.Rows[0][4].ToString());

            return cat;
        }

        private void Armar_Parametros_agregar_DV_Haedware(ref SqlCommand Comando, DV_Hardware cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Venta", SqlDbType.Int);
            SqlParametros.Value = cat.Id_ventas;
            SqlParametros = Comando.Parameters.Add("@Id_Hardware", SqlDbType.Int);
            SqlParametros.Value = cat.Id_hardware;
            SqlParametros = Comando.Parameters.Add("@Cantidad_Total", SqlDbType.Int);
            SqlParametros.Value = cat.Cantidad_total;

        }

        public int agregar_DV_Hardware(DV_Hardware cat)
        {

            SqlCommand comando = new SqlCommand();
            Armar_Parametros_agregar_DV_Haedware(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_ingresar_datos_Detalles_de_ventas_x_Hardware");
        }

    }
}
