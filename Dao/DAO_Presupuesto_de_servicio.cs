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
    public class DAO_Presupuesto_de_servicio
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Presupuesto_de_servicio()
        {
        }

        public Presupuesto_de_servicio get_Presupuesto_de_servicio(Presupuesto_de_servicio cat)
        {
            
            DataTable tabla = ds.ObtenerTabla("Presupuesto_de_servicio", "Select * from Presupuesto_de_servicio where Id_Presupuesto_PdS =" + cat.Id_presupuesto);

            cat.Id_presupuesto = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Id_solisitud = Convert.ToInt32(tabla.Rows[0][1].ToString());
            cat.Id_cliente = Convert.ToInt32(tabla.Rows[0][2].ToString());
            cat.Id_empleado = Convert.ToInt32(tabla.Rows[0][3].ToString());
            cat.Id_tipo = Convert.ToInt32(tabla.Rows[0][4].ToString());

            cat.Precio_x_hora = Convert.ToDouble(tabla.Rows[0][5].ToString());
            cat.Horas_trabajadas = Convert.ToInt32(tabla.Rows[0][6].ToString());
            cat.Subtotal = Convert.ToDouble(tabla.Rows[0][7].ToString());

            cat.Descripcion = tabla.Rows[0][8].ToString();
            cat.Estado = Convert.ToBoolean(tabla.Rows[0][9].ToString());

            return cat;

        }

        public DataTable Obtener_tabla_Presupuesto_de_servicio(string comnado)
        {

            return ds.ObtenerTabla("Presupuesto_de_servicio", comnado);

        }

        private void Armar_Parametros_agregar_Presupuesto_de_servicio(ref SqlCommand Comando, Presupuesto_de_servicio cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Solicitud", SqlDbType.Int);
            SqlParametros.Value = cat.Id_solisitud;
            SqlParametros = Comando.Parameters.Add("@Id_Cliente", SqlDbType.Int);
            SqlParametros.Value = cat.Id_cliente;
            SqlParametros = Comando.Parameters.Add("@Id_Empleado", SqlDbType.Int);
            SqlParametros.Value = cat.Id_empleado;
            SqlParametros = Comando.Parameters.Add("@Id_Tipo_de_pedido", SqlDbType.Int);
            SqlParametros.Value = cat.Id_tipo;
            SqlParametros = Comando.Parameters.Add("@Horas_trabajadas", SqlDbType.Int);
            SqlParametros.Value = cat.Horas_trabajadas;

            SqlParametros = Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = cat.Descripcion;

        }

        public int agregar_Presupuesto_de_servicio(Presupuesto_de_servicio cat)
        {

            SqlCommand comando = new SqlCommand();
            Armar_Parametros_agregar_Presupuesto_de_servicio(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_ingresar_datos_Presupuesto_de_servicio");
        }

        private void Armar_Parametros_Dar_de_baja_Presupuesto_de_servicio(ref SqlCommand Comando, Presupuesto_de_servicio cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Presupuesto", SqlDbType.Int);
            SqlParametros.Value = cat.Id_presupuesto;
            

        }

        public int Dar_de_baja_Presupuesto_de_servicio(Presupuesto_de_servicio cat)
        {

            SqlCommand comando = new SqlCommand();
            Armar_Parametros_Dar_de_baja_Presupuesto_de_servicio(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_Desabilitar_Presupuesto_de_servicio");
        }

    }
}
