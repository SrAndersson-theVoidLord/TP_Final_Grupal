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
    class DAO_Tipos_de_pedido
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Tipos_de_pedido()
        {
        }

        public TipoPedido get_Hardware(TipoPedido cat)
        {
            DataTable tabla = ds.ObtenerTabla("Tipos_de_pedido", "Select * from Tipos_de_pedido where Id_Tipo_TDP =" + cat.Id_tipo);

            cat.Id_tipo = Convert.ToInt32(tabla.Rows[0][0].ToString());
            cat.Descripcion = tabla.Rows[0][1].ToString();
            cat.Precio_por_hora = Convert.ToDouble(tabla.Rows[0][2].ToString());
            
            return cat;
        }

    }
}
