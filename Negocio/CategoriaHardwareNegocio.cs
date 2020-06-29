using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;

namespace Negocio
{
    public class CategoriaHardwareNegocio
    {
        public List<CategoriaHardware> listar_categoriahw()
        {
            List<CategoriaHardware> lista = new List<CategoriaHardware>();
            CategoriaHardware aux; 
            AccesoDatos datos = new AccesoDatos();
            try
            {
            datos.setearQuery( "select Id_Categoria_CAT,Descripcion_CAT from Categoria_hardware");
            datos.ejecutarLector();
                while (datos.lector.Read())
                {
                aux = new CategoriaHardware();
                aux.Id_categoria= (string)datos.lector["Id_Categoria_CAT"];
                aux.Descripcion = (string)datos.lector["Descripcion_CAT"];

                    lista.Add(aux);
                }

                return lista;


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }
    }
}
