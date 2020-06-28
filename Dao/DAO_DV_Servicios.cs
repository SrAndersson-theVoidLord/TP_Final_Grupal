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
    public class DAO_DV_Servicios
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_DV_Servicios()
        {
        }

        public DV_Servicios get_DV_Servicios(DV_Servicios cat)
        {
            DataTable tabla = ds.ObtenerTabla("Detalles_de_ventas_x_Actividades", "Select * from Detalles_de_ventas_x_Actividades where Id_Venta_DXV_S =" + cat.Id_venta + " OR Id_Actividad_DXV_S = " + cat.Id_actividad);

            cat.Id_venta = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Id_actividad = Convert.ToInt32(tabla.Rows[0][1].ToString());
            cat.Descripcion = tabla.Rows[0][2].ToString();
            cat.Subtotal = Convert.ToDouble(tabla.Rows[0][3].ToString());
            

            return cat;
        }

        private void Armar_Parametros_agregar_DV_Servicios(ref SqlCommand Comando, DV_Servicios cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Venta", SqlDbType.Int);
            SqlParametros.Value = cat.Id_venta;
            SqlParametros = Comando.Parameters.Add("@Id_Actividad", SqlDbType.Int);
            SqlParametros.Value = cat.Id_actividad;
            SqlParametros = Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = cat.Descripcion;

        }

        public int agregar_DV_Servicios(DV_Servicios cat)
        {

            SqlCommand comando = new SqlCommand();
            Armar_Parametros_agregar_DV_Servicios(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_ingresar_datos_Detalles_de_ventas_x_Actividades");
        }

        

    }
}
