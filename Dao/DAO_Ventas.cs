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
    public class DAO_Ventas
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Ventas()
        {
        }

        public Ventas get_Ventas(Ventas cat)
        {
            DataTable tabla = ds.ObtenerTabla("Ventas", "Select * from Ventas where Id_Venta_VEN =" + cat.Id_venta);

            cat.Id_venta = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Id_cliente = Convert.ToInt32(tabla.Rows[0][1].ToString());
            cat.Fecha = Convert.ToDateTime(tabla.Rows[0][2].ToString());
            cat.Total = Convert.ToDouble(tabla.Rows[0][3].ToString());
            
            return cat;
        }

        private void Armar_Parametros_agregar_Ventas(ref SqlCommand Comando, Ventas cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Cliente", SqlDbType.Int);
            SqlParametros.Value = cat.Id_cliente;
            
        }

        public int agregar_Ventas(Ventas cat)
        {
            
            SqlCommand comando = new SqlCommand();
            Armar_Parametros_agregar_Ventas(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_ingresar_datos_Ventas");
        }

        public int Obtener_Ultimo_id_ventas()
        {

            return ds.Obtener_Ultimo_id("SELECT max(Id_Venta_VEN) FROM Ventas");

        }

    }
}
