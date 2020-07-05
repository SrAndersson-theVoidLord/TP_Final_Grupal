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
    public class DAO_Actividades
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Actividades()
        {
        }

        public Actividad get_Actividades(Actividad cat)
        {
            DataTable tabla = ds.ObtenerTabla("Actividades", "Select * from Actividades where Id_Actividad_A =" + cat.Id_actividad);
            
            cat.Id_actividad = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Id_cliente = Convert.ToInt32(tabla.Rows[0][1].ToString());
            cat.Id_empleado = Convert.ToInt32(tabla.Rows[0][2].ToString());
            cat.Id_tipo_pedido = Convert.ToInt32(tabla.Rows[0][3].ToString());
            cat.Descripcion = tabla.Rows[0][4].ToString();
            cat.Precio_por_Hora = Convert.ToDouble(tabla.Rows[0][5].ToString());
            cat.Horas_trabajadas = Convert.ToInt32(tabla.Rows[0][6].ToString());
            cat.Subtotal = Convert.ToDouble(tabla.Rows[0][7].ToString());
            cat.Fecha = Convert.ToDateTime(tabla.Rows[0][8].ToString());

            cat.Estado_act = Convert.ToBoolean(tabla.Rows[0][9].ToString());

            return cat;
        }

        public DataTable Obtener_tabla_Actividades(string comnado)
        {

            return ds.ObtenerTabla("Actividades", comnado);

        }

        private void Armar_Parametros_agregar_Actividades(ref SqlCommand Comando, Actividad cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Cliente", SqlDbType.Int);
            SqlParametros.Value = cat.Id_cliente;
            SqlParametros = Comando.Parameters.Add("@Id_Empleado", SqlDbType.Int);
            SqlParametros.Value = cat.Id_empleado;
            SqlParametros = Comando.Parameters.Add("@Id_Tipo_de_Pedido", SqlDbType.Int);
            SqlParametros.Value = cat.Id_tipo_pedido;
            SqlParametros = Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = cat.Descripcion;
            SqlParametros = Comando.Parameters.Add("@Horas_trabajadas", SqlDbType.Int);
            SqlParametros.Value = cat.Horas_trabajadas;

        }

        public int agregar_Actividades(Actividad cat)
        {

            SqlCommand comando = new SqlCommand();
            Armar_Parametros_agregar_Actividades(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_ingresar_datos_Actividades");
        }

        public int Obtener_Ultimo_id_Actividades()
        {

            return ds.Obtener_Ultimo_id("SELECT max(Id_Actividad_A) FROM Actividades");

        }

        //-------------

        private void Armar_Parametros_agregar_Actividades_armado(ref SqlCommand Comando, Actividad cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Cliente", SqlDbType.Int);
            SqlParametros.Value = cat.Id_cliente;
            SqlParametros = Comando.Parameters.Add("@Id_Empleado", SqlDbType.Int);
            SqlParametros.Value = cat.Id_empleado;
            SqlParametros = Comando.Parameters.Add("@Id_Tipo_de_Pedido", SqlDbType.Int);
            SqlParametros.Value = cat.Id_tipo_pedido;
            SqlParametros = Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = cat.Descripcion;
            SqlParametros = Comando.Parameters.Add("@Total_del_armado", SqlDbType.Float);
            SqlParametros.Value = cat.Subtotal;

        }

        public int agregar_Actividades_armado(Actividad cat)
        {

            SqlCommand comando = new SqlCommand();
            Armar_Parametros_agregar_Actividades_armado(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_ingresar_datos_Actividades_armado");
        }

    }
}
