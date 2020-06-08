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

        /// Clientes:
        public void agregarcliente(Usuario cliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("insert into clientes values(@nombreusuario,@contraseña,@nombre,@apellido,@dni,@localidad,@direccion,@cp,@telefono,@email,@estado)");
                datos.agregarParametro("@nombreusuario", cliente.nombre);
                datos.agregarParametro("@constraseña", cliente.constraseña);
                datos.agregarParametro("@nombre", cliente.nombre);
                datos.agregarParametro("@apellido", cliente.apellido);
                datos.agregarParametro("@dni", cliente.dni);
                datos.agregarParametro("@localidad", cliente.localidad);
                datos.agregarParametro("@direccion", cliente.direccion);
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

        //FUNCION PARA LISTAR LOS DATOS DE LA BBDD
        public List<Usuario> listar_Clientes()
        {
            //INSTANCIO LA LISTA
            List<Usuario> lista = new List<Usuario>();
            //DECLARO EL OBJETO
            Usuario aux;
            //INSTANCIO LA CONECCION A LA BASE
            AccesoDatos datos = new AccesoDatos();
            //TIRO LA QUERY
            datos.setearQuery("select nombre, apellido, dni, direccion, localidad, telefono, mail from Clientes where estado = 1");
            //EJECUTO EL LECTOR
            datos.ejecutarLector();

            //MIENTRAS EL LECTOR LEA, DEVULVE LOS DATOS (DEBE COINCIDIR CON LA QUERY)

            while (datos.lector.Read())
            {
                aux = new Usuario();

                aux.nombre = datos.lector["Nombre"].ToString();
                aux.apellido = datos.lector["Apellido"].ToString();
                aux.dni = datos.lector["DNI"].ToString();
                aux.direccion = datos.lector["Direccion"].ToString();
                aux.localidad = datos.lector["Localidad"].ToString();
                aux.telefono = datos.lector["Telefono"].ToString();
                aux.email = datos.lector["Mail"].ToString();

                lista.Add(aux);


            }
            return lista;
            //datos.cerrarConexion();
        }

        public bool altaCliente(Usuario aux)
        {

            AccesoDatos data = new AccesoDatos();
            data.prepareStatement("" +
                "INSERT INTO Clientes VALUES ('" + aux.nombre + "', '" + aux.apellido + "', '" + aux.dni + "', '" + aux.direccion + "', '" + aux.localidad + "', '" + aux.telefono + "', '" + aux.email + "', 1)");
            data.ejecutarAccion();
            data.cerrarConexion();

            if (data.getAffectedRows() <= 0)
            {
                return false;
            }
            else return true;
        }


        public bool bajaCliente(Usuario aux)
        {
            AccesoDatos data = new AccesoDatos();
            data.prepareStatement("update clientes set estado = 0 where DNI = '" + aux.dni + "'");
            data.ejecutarAccion();
            data.cerrarConexion();

            if (data.getAffectedRows() <= 0)
            {
                return false;
            }
            return true;
        }

        public Usuario ValidarDNI_cliente(string dnicliente)
        {
            AccesoDatos datos = new AccesoDatos();
            Usuario cli = new Usuario();

            datos.setearQuery("Select id, dni, estado from Clientes where dni = @dni and estado = 1");
            datos.agregarParametro("dni", dnicliente);
            datos.ejecutarLector();
            if (datos.lector.Read())
            {
                cli.id_Usuario = datos.lector.GetInt32(0);
                cli.dni = datos.lector.GetString(1);
                cli.estado = datos.lector.GetBoolean(2);
            }
            else
            {
                cli = null;
            }
            return cli;
        }


        public Usuario BuscarDNI_Cliente(string aux)
        {
            //INSTANCIO LA LISTA
            List<Usuario> lista = new List<Usuario>();
            //DECLARO EL OBJETO
            Usuario cliente = new Usuario();
            //INSTANCIO LA CONECCION A LA BASE
            AccesoDatos datos = new AccesoDatos();
            //TIRO LA QUERY
            datos.setearQuery("select id, nombre, apellido, dni, direccion, localidad, telefono, mail from Clientes where estado = 1 and dni = '" + aux + "'");
            //EJECUTO EL LECTOR
            datos.ejecutarLector();

            //MIENTRAS EL LECTOR LEA, DEVULVE LOS DATOS (DEBE COINCIDIR CON LA QUERY)

            while (datos.lector.Read())
            {

                cliente.id_Usuario = Convert.ToInt32(datos.lector["id"]);
                cliente.nombre = datos.lector["Nombre"].ToString();
                cliente.apellido = datos.lector["Apellido"].ToString();
                cliente.dni = datos.lector["DNI"].ToString();
                cliente.direccion = datos.lector["Direccion"].ToString();
                cliente.localidad = datos.lector["Localidad"].ToString();
                cliente.telefono = datos.lector["Telefono"].ToString();
                cliente.email = datos.lector["Mail"].ToString();


            }
            return cliente;
        }

        public bool ModificarCliente(Usuario Cliente)
        {
            AccesoDatos data = new AccesoDatos();
            data.prepareStatement("update clientes set nombre = @nombre, apellido = @apellido, dni = @dni, direccion = @direccion, localidad = @localidad, telefono = @telefono, mail = @mail where dni = '" + Cliente.dni + "'");
            data.agregarParametro("@nombre", Cliente.nombre);
            data.agregarParametro("@apellido", Cliente.apellido);
            data.agregarParametro("@dni", Cliente.dni);
            data.agregarParametro("@direccion", Cliente.direccion);
            data.agregarParametro("@localidad", Cliente.localidad);
            data.agregarParametro("@telefono", Cliente.telefono);
            data.agregarParametro("@mail", Cliente.email);
            data.ejecutarAccion();
            data.cerrarConexion();

            if (data.getAffectedRows() <= 0)
            {
                return false;
            }
            return true;
        }


        /////////////////////////////////////////////////////////////////////////////////////
        
            
            /// Empleados:


        public List<Usuario> listar_Empleados()
        {
            //INSTANCIO LA LISTA
            List<Usuario> lista = new List<Usuario>();
            //DECLARO EL OBJETO
            Usuario aux;
            //INSTANCIO LA CONECCION A LA BASE
            AccesoDatos datos = new AccesoDatos();
            //TIRO LA QUERY
            datos.setearQuery("select nombre, apellido, dni, direccion, localidad, telefono, mail from Clientes where estado = 1");
            //EJECUTO EL LECTOR
            datos.ejecutarLector();

            //MIENTRAS EL LECTOR LEA, DEVULVE LOS DATOS (DEBE COINCIDIR CON LA QUERY)

            while (datos.lector.Read())
            {
                aux = new Usuario();

                aux.nombre = datos.lector["Nombre"].ToString();
                aux.apellido = datos.lector["Apellido"].ToString();
                aux.dni = datos.lector["DNI"].ToString();
                aux.direccion = datos.lector["Direccion"].ToString();
                aux.localidad = datos.lector["Localidad"].ToString();
                aux.telefono = datos.lector["Telefono"].ToString();
                aux.email = datos.lector["Mail"].ToString();

                lista.Add(aux);


            }
            return lista;
            //datos.cerrarConexion();
        }

        

        public bool bajaEmpleado(Usuario aux)
        {
            AccesoDatos data = new AccesoDatos();
            data.prepareStatement("update empleados set estado = 0 where DNI = '" + aux.dni + "'");
            data.ejecutarAccion();
            data.cerrarConexion();

            if (data.getAffectedRows() <= 0)
            {
                return false;
            }
            return true;
        }

        public Usuario ValidarDNI_Empleado(string dnicliente)
        {
            AccesoDatos datos = new AccesoDatos();
            Usuario emp = new Usuario();

            datos.setearQuery("Select id, dni, estado from Clientes where dni = @dni and estado = 1");
            datos.agregarParametro("dni", dnicliente);
            datos.ejecutarLector();
            if (datos.lector.Read())
            {
                emp.id_Usuario = datos.lector.GetInt32(0);
                emp.dni = datos.lector.GetString(1);
                emp.estado = datos.lector.GetBoolean(2);
            }
            else
            {
                emp = null;
            }
            return emp;
        }


        public Usuario BuscarDNI_Empleado(string aux)
        {
            //INSTANCIO LA LISTA
            List<Usuario> lista = new List<Usuario>();
            //DECLARO EL OBJETO
            Usuario Empleado = new Usuario();
            //INSTANCIO LA CONECCION A LA BASE
            AccesoDatos datos = new AccesoDatos();
            //TIRO LA QUERY
            datos.setearQuery("select id, nombre, apellido, dni, direccion, localidad, telefono, mail from Clientes where estado = 1 and dni = '" + aux + "'");
            //EJECUTO EL LECTOR
            datos.ejecutarLector();

            //MIENTRAS EL LECTOR LEA, DEVULVE LOS DATOS (DEBE COINSIDIR CON LA QUERY)

            while (datos.lector.Read())
            {

                Empleado.id_Usuario = Convert.ToInt32(datos.lector["id"]);
                Empleado.nombre = datos.lector["Nombre"].ToString();
                Empleado.apellido = datos.lector["Apellido"].ToString();
                Empleado.dni = datos.lector["DNI"].ToString();
                Empleado.direccion = datos.lector["Direccion"].ToString();
                Empleado.localidad = datos.lector["Localidad"].ToString();
                Empleado.telefono = datos.lector["Telefono"].ToString();
                Empleado.email = datos.lector["Mail"].ToString();


            }
            return Empleado;
        }

        public bool ModificarEmpleado(Usuario Empleado)
        {
            AccesoDatos data = new AccesoDatos();
            data.prepareStatement("update clientes set nombre = @nombre, apellido = @apellido, dni = @dni, direccion = @direccion, localidad = @localidad, telefono = @telefono, mail = @mail where dni = '" + Empleado.dni + "'");
            data.agregarParametro("@nombre", Empleado.nombre);
            data.agregarParametro("@apellido", Empleado.apellido);
            data.agregarParametro("@dni", Empleado.dni);
            data.agregarParametro("@direccion", Empleado.direccion);
            data.agregarParametro("@localidad", Empleado.localidad);
            data.agregarParametro("@telefono", Empleado.telefono);
            data.agregarParametro("@mail", Empleado.email);
            data.ejecutarAccion();
            data.cerrarConexion();

            if (data.getAffectedRows() <= 0)
            {
                return false;
            }
            return true;
        }


    }

}
