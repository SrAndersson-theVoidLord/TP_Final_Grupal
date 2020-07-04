using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

using Dominio;
using Dao;


namespace Negocio
{
    public class HardwareNegocio
    {

        public HardwareNegocio()
        {

        }

        public List<Hardware> listar()
        {
            List<Hardware> lista = new List<Hardware>();
            Hardware aux;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("SELECT Id_Hardware_HAR,Categoria_HAR,Nombre_HAR,Descripcion_HAR,Imagen_HAR as Imagen,Precio_HAR,Estado_HAR FROM Hardware where Estado_HAR = 1"); 
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new Hardware();
                    aux.Id_hardware = (int)datos.lector["id_Hardware_HAR"];
                    aux.Categoria = new CategoriaHardware();
                    aux.Categoria.Id_categoria = (string)datos.lector["Categoria_HAR"];
                    aux.Nombre = (string)datos.lector["Nombre_HAR"];
                    aux.Descripcion = (string)datos.lector["Descripcion_HAR"];
                    aux.Imagen = datos.lector["Imagen"].ToString();
                    if(aux.Imagen.StartsWith("~"))
                    {
                        aux.Imagen = aux.Imagen.Substring(1);
                    }
                    aux.Precio_unitario = (double)datos.lector["Precio_HAR"];
                    aux.Estado = (Boolean)datos.lector["Estado_HAR"];

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
                datos = null;
            }
        }

        public Hardware get_HardwareNegocio(int id)
        {
            
            Hardware cat = new Hardware();
            DAO_Hardware dao = new DAO_Hardware();
            cat.Id_hardware = id;
            return dao.get_Hardware(cat);
        }

        public DataTable Obtener_tabla_Hardware(string comnado)
        {
            DAO_Hardware dao_hard = new DAO_Hardware();

            return dao_hard.Obtener_tabla_Hardware(comnado);
            
        }

        public bool EliminarHardware(int aux)
        {
            AccesoDatos data = new AccesoDatos();
            try
            {
                data.setearQuery("update Hardware set Estado_HAR = 0 where id_Hardware_HAR = '" + aux + "'");
                int filasafectadas= data.ejecutarAccion();
                data.cerrarConexion();
                if(filasafectadas > 0)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public bool ModificarHardware(Hardware aux)
        {
            AccesoDatos data = new AccesoDatos();
            try
            {
                data.setearQuery("update Hardware set Categoria_HAR=@Categoria,Nombre_HAR =@Nombre , Descripcion_HAR = @Descripcion, Imagen_HAR=@Imagen,Precio_HAR=@Precio where id_Hardware_HAR = '" + aux.Id_hardware + "'");
                data.agregarParametro("@Categoria", aux.Categoria.Id_categoria);
                data.agregarParametro("@Nombre", aux.Nombre);
                data.agregarParametro("@Descripcion", aux.Descripcion);
                data.agregarParametro("@Imagen", aux.Imagen);
                data.agregarParametro("@Precio", aux.Precio_unitario);
                int filasafectadas = data.ejecutarAccion();
                data.cerrarConexion();
                if (filasafectadas > 0)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool agregarHardware(Hardware aux)
        {
            AccesoDatos data = new AccesoDatos();
            try
            {
                data.setearQuery("insert into Hardware values (@Categoria, @Nombre , @Descripcion, @Imagen, @Precio , @Estado)");
                data.agregarParametro("@Categoria", aux.Categoria.Id_categoria);
                data.agregarParametro("@Nombre", aux.Nombre);
                data.agregarParametro("@Descripcion", aux.Descripcion);
                data.agregarParametro("@Imagen", aux.Imagen);
                data.agregarParametro("@Precio", aux.Precio_unitario);
                data.agregarParametro("@Estado", aux.Estado);
                int filasafectadas = data.ejecutarAccion();
                data.cerrarConexion();
                if (filasafectadas > 0)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }



    }
}
