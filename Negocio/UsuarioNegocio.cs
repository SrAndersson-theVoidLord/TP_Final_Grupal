using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;



namespace Negocio
{
    public class UsuarioNegocio
    {

        /// Clientes:
        /// 
         // Utilizado y creado por Gabriel
        public int agregarcliente(Usuario cliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("insert into Clientes values(@dni,@nombre,@apellido,@nombreusuario,@contraseña,@direccion,@localidad,@cp,@telefono,@email,@estado)");
                datos.agregarParametro("@dni", cliente.Dni);
                datos.agregarParametro("@nombre", cliente.Nombre);
                datos.agregarParametro("@apellido", cliente.Apellido);
                datos.agregarParametro("@nombreusuario", cliente.Nombreusuario);
                datos.agregarParametro("@contraseña", cliente.Constraseña);
                datos.agregarParametro("@direccion", cliente.Direccion);
                datos.agregarParametro("@localidad", cliente.Localidad);
                datos.agregarParametro("@cp", cliente.Cp);
                datos.agregarParametro("@telefono", cliente.Telefono);
                datos.agregarParametro("@email", cliente.Email);
                datos.agregarParametro("@estado", Convert.ToInt16(cliente.Estado));

                int filasafectadas = datos.ejecutarAccion();
                datos.cerrarConexion();
                if(filasafectadas > 0)
                {
                    return 1;

                }
                return 0;
            }
            catch (Exception ex)
            {
                throw ex ;
            }

        }
        
        // Utilizado y creado por Gabriel
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
            datos.setearQuery("select id_Cliente_CLI, DNI_CLI, Nombre_CLI, Apellido_CLI,NombreUsuario_CLI, Direccion_CLI, Localidad_CLI,Codigo_Postal_CLI, Telefono_CLI, Email_CLI,Estado_CLI from Clientes WHERE Estado_CLI = 1");
            //EJECUTO EL LECTOR
            datos.ejecutarLector();

            //MIENTRAS EL LECTOR LEA, DEVULVE LOS DATOS (DEBE COINCIDIR CON LA QUERY)

            while (datos.lector.Read())
            {
                aux = new Usuario();

                aux.Id_Usuario = (int)datos.lector["id_Cliente_CLI"];
                aux.Dni = datos.lector["DNI_CLI"].ToString();
                aux.Nombre = datos.lector["Nombre_CLI"].ToString();
                aux.Apellido = datos.lector["Apellido_CLI"].ToString();
                aux.Nombreusuario = datos.lector["NombreUsuario_CLI"].ToString();
                aux.Direccion = datos.lector["Direccion_CLI"].ToString();
                aux.Localidad = datos.lector["Localidad_CLI"].ToString();
                aux.Cp = datos.lector["Codigo_Postal_CLI"].ToString();
                aux.Telefono = datos.lector["Telefono_CLI"].ToString();
                aux.Email = datos.lector["Email_CLI"].ToString();
                aux.Estado = (Boolean)datos.lector["Estado_CLI"];

                lista.Add(aux);


            }
            datos.cerrarConexion();
            return lista;
        }

        public bool altaCliente(Usuario aux)
        {

            AccesoDatos data = new AccesoDatos();
            data.prepareStatement("" +
                "INSERT INTO Clientes VALUES ('" + aux.Nombre + "', '" + aux.Apellido + "', '" + aux.Dni + "', '" + aux.Direccion + "', '" + aux.Localidad + "', '" + aux.Telefono + "', '" + aux.Email + "', 1)");
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
            data.prepareStatement("update clientes set estado = 0 where DNI = '" + aux.Dni + "'");
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
                cli.Id_Usuario = datos.lector.GetInt32(0);
                cli.Dni = datos.lector.GetString(1);
                cli.Estado = datos.lector.GetBoolean(2);
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

                cliente.Id_Usuario = Convert.ToInt32(datos.lector["id"]);
                cliente.Nombre = datos.lector["Nombre"].ToString();
                cliente.Apellido = datos.lector["Apellido"].ToString();
                cliente.Dni = datos.lector["DNI"].ToString();
                cliente.Direccion = datos.lector["Direccion"].ToString();
                cliente.Localidad = datos.lector["Localidad"].ToString();
                cliente.Telefono = datos.lector["Telefono"].ToString();
                cliente.Email = datos.lector["Mail"].ToString();


            }
            return cliente;
        }
        
        // Utilizado y creado por Gabriel
        public void ModificarCliente(Usuario Cliente)
        {
            AccesoDatos data = new AccesoDatos();
            try
            {
                //data.prepareStatement("update clientes set nombre = @nombre, apellido = @apellido, dni = @dni, direccion = @direccion, localidad = @localidad, telefono = @telefono, mail = @mail where dni = '" + Cliente.dni + "'");
                data.setearQuery("update clientes set Nombre_CLI = @nombre, Apellido_CLI = @apellido, DNI_CLI = @dni,NombreUsuario_CLI=@usuario , Direccion_CLI = @direccion, Localidad_CLI = @localidad, Telefono_CLI = @telefono,Codigo_Postal_CLI = @cp ,Email_CLI = @mail where id_Cliente_CLI = @id_Usuario ");
                data.agregarParametro("@id_Usuario", Cliente.Id_Usuario);
                data.agregarParametro("@nombre", Cliente.Nombre);
                data.agregarParametro("@apellido", Cliente.Apellido);
                data.agregarParametro("@dni", Cliente.Dni);
                data.agregarParametro("@usuario", Cliente.Nombreusuario);
                data.agregarParametro("@direccion", Cliente.Direccion);
                data.agregarParametro("@localidad", Cliente.Localidad);
                data.agregarParametro("@telefono", Cliente.Telefono);
                data.agregarParametro("@mail", Cliente.Email);
                data.agregarParametro("@cp", Cliente.Cp);
                int filasafectadas= data.ejecutarAccion();
                data.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }




        }
        // Utilizado y creado por Gabriel
        public void EliminarCliente(Usuario Cliente)
        {
            AccesoDatos data = new AccesoDatos();
            try
            {
                data.setearQuery("update Clientes set Estado_CLI = 0 where id_Cliente_CLI = '" + Cliente.Id_Usuario + "'");
                int filasafectadas=data.ejecutarAccion();
                data.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }




        // Utilizado y creado por Gabriel
        public Usuario Validar_Clientes(string usuario)
        {

            Usuario aux = new Usuario();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("select id_Cliente_CLI, DNI_CLI, Nombre_CLI, Apellido_CLI,NombreUsuario_CLI,Contrasenia_CLI, Direccion_CLI, Localidad_CLI,Codigo_Postal_CLI, Telefono_CLI, Email_CLI,Estado_CLI from Clientes where NombreUsuario_CLI = '" + usuario + "'");
            datos.ejecutarLector();
            while (datos.lector.Read())
            {
                aux.Id_Usuario = (int)datos.lector["id_Cliente_CLI"];
                aux.Dni = datos.lector["DNI_CLI"].ToString().Trim();
                aux.Nombre = datos.lector["Nombre_CLI"].ToString().Trim();
                aux.Apellido = datos.lector["Apellido_CLI"].ToString().Trim();
                aux.Nombreusuario = datos.lector["NombreUsuario_CLI"].ToString().Trim();
                aux.Constraseña = datos.lector["Contrasenia_CLI"].ToString().Trim();
                aux.Direccion = datos.lector["Direccion_CLI"].ToString().Trim();
                aux.Localidad = datos.lector["Localidad_CLI"].ToString().Trim();
                aux.Cp = datos.lector["Codigo_Postal_CLI"].ToString().Trim();
                aux.Telefono = datos.lector["Telefono_CLI"].ToString().Trim();
                aux.Email = datos.lector["Email_CLI"].ToString().Trim();
                aux.Estado = (Boolean)datos.lector["Estado_CLI"];

            }

            datos.cerrarConexion();

            return aux;
        }

        // Utilizado y creado por Gabriel
        public Usuario Validar_DNI_Cliente(string dni)
        {

            Usuario aux = new Usuario();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("select id_Cliente_CLI, DNI_CLI, Nombre_CLI, Apellido_CLI,NombreUsuario_CLI,Contrasenia_CLI, Direccion_CLI, Localidad_CLI,Codigo_Postal_CLI, Telefono_CLI, Email_CLI,Estado_CLI from Clientes where DNI_CLI = '" + dni + "'");
            datos.ejecutarLector();
            while (datos.lector.Read())
            {
                aux.Id_Usuario = (int)datos.lector["id_Cliente_CLI"];
                aux.Dni = datos.lector["DNI_CLI"].ToString().Trim();
                aux.Nombre = datos.lector["Nombre_CLI"].ToString().Trim();
                aux.Apellido = datos.lector["Apellido_CLI"].ToString().Trim();
                aux.Nombreusuario = datos.lector["NombreUsuario_CLI"].ToString().Trim();
                aux.Constraseña = datos.lector["Contrasenia_CLI"].ToString().Trim();
                aux.Direccion = datos.lector["Direccion_CLI"].ToString().Trim();
                aux.Localidad = datos.lector["Localidad_CLI"].ToString().Trim();
                aux.Cp = datos.lector["Codigo_Postal_CLI"].ToString().Trim();
                aux.Telefono = datos.lector["Telefono_CLI"].ToString().Trim();
                aux.Email = datos.lector["Email_CLI"].ToString().Trim();
                aux.Estado = (Boolean)datos.lector["Estado_CLI"];

            }

            datos.cerrarConexion();

            return aux;
        }



        /////////////////////////////////////////////////////////////////////////////////////


        /// Empleados:

        // Utilizado y creado por Gabriel
        public List<Usuario> listar_Empleados()
        {
            //INSTANCIO LA LISTA
            List<Usuario> lista = new List<Usuario>();
            //DECLARO EL OBJETO
            Usuario aux;
            //INSTANCIO LA CONECCION A LA BASE
            AccesoDatos datos = new AccesoDatos();
            //TIRO LA QUERY
            datos.setearQuery("select id_Empleado_EMP, DNI_EMP, Nombre_EMP, Apellido_EMP,NombreUsuario_EMP, Direccion_EMP, Localidad_EMP,Codigo_Postal_EMP, Telefono_EMP, Email_EMP,Estado_EMP from Empleados WHERE Estado_EMP = 1 ");
            //EJECUTO EL LECTOR
            datos.ejecutarLector();

            //MIENTRAS EL LECTOR LEA, DEVULVE LOS DATOS (DEBE COINCIDIR CON LA QUERY)

            while (datos.lector.Read())
            {
                aux = new Usuario();

                aux.Id_Usuario = (int)datos.lector["id_Empleado_EMP"];
                aux.Dni = datos.lector["DNI_EMP"].ToString();
                aux.Nombre = datos.lector["Nombre_EMP"].ToString();
                aux.Apellido = datos.lector["Apellido_EMP"].ToString();
                aux.Nombreusuario = datos.lector["NombreUsuario_EMP"].ToString();
                aux.Direccion = datos.lector["Direccion_EMP"].ToString();
                aux.Localidad = datos.lector["Localidad_EMP"].ToString();
                aux.Cp = datos.lector["Codigo_Postal_EMP"].ToString();
                aux.Telefono = datos.lector["Telefono_EMP"].ToString();
                aux.Email = datos.lector["Email_EMP"].ToString();
                aux.Estado = (Boolean)datos.lector["Estado_EMP"];

                lista.Add(aux);


            }
            datos.cerrarConexion();
            return lista;
        }



        public bool bajaEmpleado(Usuario aux)
        {
            AccesoDatos data = new AccesoDatos();
            data.prepareStatement("update empleados set estado = 0 where DNI = '" + aux.Dni + "'");
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
                emp.Id_Usuario = datos.lector.GetInt32(0);
                emp.Dni = datos.lector.GetString(1);
                emp.Estado = datos.lector.GetBoolean(2);
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

                Empleado.Id_Usuario = Convert.ToInt32(datos.lector["id"]);
                Empleado.Nombre = datos.lector["Nombre"].ToString();
                Empleado.Apellido = datos.lector["Apellido"].ToString();
                Empleado.Dni = datos.lector["DNI"].ToString();
                Empleado.Direccion = datos.lector["Direccion"].ToString();
                Empleado.Localidad = datos.lector["Localidad"].ToString();
                Empleado.Telefono = datos.lector["Telefono"].ToString();
                Empleado.Email = datos.lector["Mail"].ToString();


            }
            return Empleado;
        }

        // Utilizado y creado por Gabriel
        public void ModificarEmpleado(Usuario Empleado)
        {
            AccesoDatos data = new AccesoDatos();
            try
            {
                data.setearQuery("update Empleados set Nombre_EMP = @nombre, Apellido_EMP = @apellido, DNI_EMP = @dni,NombreUsuario_EMP=@usuario , Direccion_EMP = @direccion, Localidad_EMP = @localidad, Telefono_EMP = @telefono,Codigo_Postal_EMP = @cp ,Email_EMP = @mail where id_Empleado_EMP = @id_Usuario ");
                data.agregarParametro("@id_Usuario", Empleado.Id_Usuario);
                data.agregarParametro("@nombre", Empleado.Nombre);
                data.agregarParametro("@apellido", Empleado.Apellido);
                data.agregarParametro("@dni", Empleado.Dni);
                data.agregarParametro("@usuario", Empleado.Nombreusuario);
                data.agregarParametro("@direccion", Empleado.Direccion);
                data.agregarParametro("@localidad", Empleado.Localidad);
                data.agregarParametro("@telefono", Empleado.Telefono);
                data.agregarParametro("@mail", Empleado.Email);
                data.agregarParametro("@cp", Empleado.Cp);
                int filasafectadas = data.ejecutarAccion();
                data.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }



        }
        
        
        // Utilizado y creado por Gabriel
        public void EliminarEmpleado(Usuario empleado)
        {
            AccesoDatos data = new AccesoDatos();
            try
            {
                data.setearQuery("update Empleados set Estado_EMP = 0 where id_Empleado_EMP = '" + empleado.Id_Usuario + "'");
                int filasafectadas=data.ejecutarAccion();
                data.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        // Utilizado y creado por Gabriel
        public Usuario Validar_Empleados(string usuario)
        {

            Usuario aux = new Usuario();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("select id_Empleado_EMP, DNI_EMP, Nombre_EMP, Apellido_EMP,NombreUsuario_EMP,Contrasenia_EMP, Direccion_EMP, Localidad_EMP,Codigo_Postal_EMP, Telefono_EMP, Email_EMP,Estado_EMP from Empleados where NombreUsuario_EMP = '" + usuario + "'");
            datos.ejecutarLector();
            while (datos.lector.Read())
            {
                aux.Id_Usuario = (int)datos.lector["id_Empleado_EMP"];
                aux.Dni = datos.lector["DNI_EMP"].ToString().Trim();
                aux.Nombre = datos.lector["Nombre_EMP"].ToString().Trim();
                aux.Apellido = datos.lector["Apellido_EMP"].ToString().Trim();
                aux.Nombreusuario = datos.lector["NombreUsuario_EMP"].ToString().Trim();
                aux.Constraseña = datos.lector["Contrasenia_EMP"].ToString().Trim();
                aux.Direccion = datos.lector["Direccion_EMP"].ToString().Trim();
                aux.Localidad = datos.lector["Localidad_EMP"].ToString().Trim();
                aux.Cp = datos.lector["Codigo_Postal_EMP"].ToString().Trim();
                aux.Telefono = datos.lector["Telefono_EMP"].ToString().Trim();
                aux.Email = datos.lector["Email_EMP"].ToString().Trim();
                aux.Estado = (Boolean)datos.lector["Estado_EMP"];

            }

            datos.cerrarConexion();

            return aux;
        }

        // utilizado y creado por Gabriel
        public Usuario Validar_DNI_Empleado(string dni)
        {

            Usuario aux = new Usuario();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("select id_Empleado_EMP, DNI_EMP, Nombre_EMP, Apellido_EMP,NombreUsuario_EMP,Contrasenia_EMP, Direccion_EMP, Localidad_EMP,Codigo_Postal_EMP, Telefono_EMP, Email_EMP,Estado_EMP from Empleados where DNI_EMP = '" + dni + "'");
            datos.ejecutarLector();
            while (datos.lector.Read())
            {
                aux.Id_Usuario = (int)datos.lector["id_Empleado_EMP"];
                aux.Dni = datos.lector["DNI_EMP"].ToString().Trim();
                aux.Nombre = datos.lector["Nombre_EMP"].ToString().Trim();
                aux.Apellido = datos.lector["Apellido_EMP"].ToString().Trim();
                aux.Nombreusuario = datos.lector["NombreUsuario_EMP"].ToString().Trim();
                aux.Constraseña = datos.lector["Contrasenia_EMP"].ToString().Trim();
                aux.Direccion = datos.lector["Direccion_EMP"].ToString().Trim();
                aux.Localidad = datos.lector["Localidad_EMP"].ToString().Trim();
                aux.Cp = datos.lector["Codigo_Postal_EMP"].ToString().Trim();
                aux.Telefono = datos.lector["Telefono_EMP"].ToString().Trim();
                aux.Email = datos.lector["Email_EMP"].ToString().Trim();
                aux.Estado = (Boolean)datos.lector["Estado_EMP"];

            }

            datos.cerrarConexion();

            return aux;
        }

        //creado y utilizado por Gabriel
        public int agregarempleado(Usuario empleado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("insert into Empleados values(@dni,@nombre,@apellido,@nombreusuario,@contraseña,@direccion,@localidad,@cp,@telefono,@email,@estado)");
                datos.agregarParametro("@dni", empleado.Dni);
                datos.agregarParametro("@nombre", empleado.Nombre);
                datos.agregarParametro("@apellido", empleado.Apellido);
                datos.agregarParametro("@nombreusuario", empleado.Nombreusuario);
                datos.agregarParametro("@contraseña", empleado.Constraseña);
                datos.agregarParametro("@direccion", empleado.Direccion);
                datos.agregarParametro("@localidad", empleado.Localidad);
                datos.agregarParametro("@cp", empleado.Cp);
                datos.agregarParametro("@telefono", empleado.Telefono);
                datos.agregarParametro("@email", empleado.Email);
                datos.agregarParametro("@estado", Convert.ToInt16(empleado.Estado));

                int filasafectadas = datos.ejecutarAccion();
                datos.cerrarConexion();
                if (filasafectadas > 0)
                {
                    return 1;

                }
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }




    }

}
