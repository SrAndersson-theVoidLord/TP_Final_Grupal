using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoDatos
    {
        public SqlDataReader lector { get; set; }
        public SqlConnection conexion { get; }
        public SqlCommand comando { get; set; }

        //funcion para conectar a base de datos
        public AccesoDatos()
        {
            //colocar el nombre de la base de datos
            conexion = new SqlConnection("data source=localhost\\SQLEXPRESS; initial catalog=POKEDEX_DB; integrated security=sspi");
            comando = new SqlCommand();
            comando.Connection = conexion;
        }

        // funcion para modificar consultas a base de datos
        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
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
              conexion.Close();
            }
        }


        //ejecuta acciones que no son de lectura
        internal void ejecutarAccion()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }

    }
}
