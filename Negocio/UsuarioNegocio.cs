using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;


namespace Negocio
{
    public class UsuarioNegocio
    {
        public void agregarcliente(Usuario cliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("insert into clientes values(@nombreusuario,@contraseña,@nombre,@apellido,@dni,@localidad,@direccion,@numero,@cp,@telefono,@email,@estado)");
                datos.agregarParametro("@nombreusuario", cliente.nombre);
                datos.agregarParametro("@constraseña", cliente.constraseña);
                datos.agregarParametro("@nombre", cliente.nombre);
                datos.agregarParametro("@apellido", cliente.apellido);
                datos.agregarParametro("@dni", cliente.dni);
                datos.agregarParametro("@localidad", cliente.localidad);
                datos.agregarParametro("@direccion", cliente.direccion);
                datos.agregarParametro("@numero",cliente.numero);
                datos.agregarParametro("@cp", cliente.cp);
                datos.agregarParametro("@telefono", cliente.telefono);
                datos.agregarParametro("@email", cliente.email);
                datos.agregarParametro("@estado", cliente.estado);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex ;
            }


        }
    }
}
