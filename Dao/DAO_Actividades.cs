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
    class DAO_Actividades
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Actividades()
        {
        }

        public Actividad get_Hardware(Actividad cat)
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

    }
}
