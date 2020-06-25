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
    class DAO_Categoria_hardware
    {

        AccesoDatos ds = new AccesoDatos();

        public DAO_Categoria_hardware()
        {
        }

        public CategoriaHardware get_Hardware(CategoriaHardware cat)
        {
            DataTable tabla = ds.ObtenerTabla("Categoria_hardware", "Select * from Categoria_hardware where Id_Categoria_CAT = '" + cat.Id_categoria + "'");
            
            cat.Id_categoria = tabla.Rows[0][0].ToString();
            cat.Descripcion = tabla.Rows[0][1].ToString();

            return cat;
        }

    }
}
