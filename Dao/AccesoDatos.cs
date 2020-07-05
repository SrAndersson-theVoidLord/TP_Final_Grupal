using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

using System.Data;

namespace Dao
{
    public class AccesoDatos
    {
        public SqlDataReader lector { get; set; }
        public SqlConnection conexion { get; }
        public SqlCommand comando { get; set; }
        private int affectedRows;

        //funcion para conectar a base de datos
        public AccesoDatos()
        {
            //colocar el nombre de la base de datos
            conexion = new SqlConnection("data source=localhost\\SQLEXPRESS; initial catalog=Adecom; integrated security=sspi");
            comando = new SqlCommand();
            comando.Connection = conexion;
            affectedRows = 0;
        }

        // funcion para modificar consultas a base de datos
        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void prepareStatement(string statement)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = statement;
        }

        // funcion para obtener lector
        public SqlDataReader getReader()
        {
            return lector;
        }
        // funcion para obtener filas afectadas
        public int getAffectedRows()
        {
            return affectedRows;
        }


        // funcion para modificar stored procedures
        public void setearSP(string sp)
        {

        }

        //funcion para agregar parametros
        public void agregarParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        //funcion para cerrar conexion
        public void cerrarConexion()
        {
            conexion.Close();
        }


        //funcion para ejecutra lectura de base de datos
        public void ejecutarLector()
        {
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }


        //ejecuta acciones que no son de lectura
        public int ejecutarAccion()
        {
            try
            {
                conexion.Open();
                int filasafectadas = comando.ExecuteNonQuery();
                return filasafectadas;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }

        //Obtener adaptador
        private SqlDataAdapter ObtenerAdaptador(String consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch (Exception)
            {
                return null;
            }
        }

        //Obtener tabla
        public DataTable ObtenerTabla(String NombreTabla, String Sql)
        {
            DataSet ds = new DataSet();
            
            SqlDataAdapter adp = ObtenerAdaptador(Sql, conexion);
            adp.Fill(ds, NombreTabla);
            
            return ds.Tables[NombreTabla];
        }

        //Obtener ultimo id
        public int Obtener_Ultimo_id(String consulta)
        {
            int max = 0;
            conexion.Open();
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                max = Convert.ToInt32(datos[0].ToString());
            }
            return max;
        }

        //Ejecutar procedimiento almacenado
        public int EjecutarProcedimiento(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            conexion.Open();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            
            return FilasCambiadas;
        }

        //Destructor
        //~AccesoDatos()
        //{
        //    conexion.Close();
        //}

    }
}
