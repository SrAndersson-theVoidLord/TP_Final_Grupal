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
    public class DAO_Solicitud_de_servicio
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Solicitud_de_servicio()
        {
        }

        public Solicitud_de_servicio get_Solicitud_de_servicio(Solicitud_de_servicio cat)
        {

            DataTable tabla = ds.ObtenerTabla("Solicitud_de_servicio", "Select * from Solicitud_de_servicio where Id_Solicitud_SdS =" + cat.Id_solicitud_de_servicio);

            cat.Id_solicitud_de_servicio = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Id_cliente = Convert.ToInt32(tabla.Rows[0][1].ToString());
            
            cat.Descripcion = tabla.Rows[0][2].ToString();
            cat.Estado = Convert.ToBoolean(tabla.Rows[0][3].ToString());

            return cat;

        }

        public DataTable Obtener_tabla_Solicitud_de_servicio(string comnado)
        {

            return ds.ObtenerTabla("Solicitud_de_servicio", comnado);

        }

        private void Armar_Parametros_agregar_Solicitud_de_servicio(ref SqlCommand Comando, Solicitud_de_servicio cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Cliente", SqlDbType.Int);
            SqlParametros.Value = cat.Id_cliente;
            
            SqlParametros = Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = cat.Descripcion;

        }

        public int agregar_Solicitud_de_servicio(Solicitud_de_servicio cat)
        {

            SqlCommand comando = new SqlCommand();
            Armar_Parametros_agregar_Solicitud_de_servicio(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_ingresar_datos_Solicitud_de_servicio");
        }



        private void Armar_Parametros_Dar_de_baja_Solicitud_de_servicio(ref SqlCommand Comando, Solicitud_de_servicio cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Id_Solisitud", SqlDbType.Int);
            SqlParametros.Value = cat.Id_solicitud_de_servicio;


        }

        public int Dar_de_baja_Solicitud_de_servicio(Solicitud_de_servicio cat)
        {

            SqlCommand comando = new SqlCommand();
            Armar_Parametros_Dar_de_baja_Solicitud_de_servicio(ref comando, cat);
            return ds.EjecutarProcedimiento(comando, "PRO_Desabilitar_Solicitud_de_servicio");
        }

    }
}
