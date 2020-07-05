using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;


namespace Negocio
{
    public class InformeVentasNegocio
    {
        public List<InformeVentas> listar(DateTime fd,DateTime fh)
        {
            List<InformeVentas> lista = new List<InformeVentas>();
            InformeVentas aux;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("select P.Fecha_VEN as Fecha, P.Id_Venta_VEN as IDVenta,C.DNI_CLI as DNI,C.Nombre_CLI as Nombre,C.Apellido_CLI as Apellido,P.Monto_final_VEN as Total from ventas P INNER JOIN Clientes C ON C.Id_Cliente_CLI = P.Id_Cliente_VEN WHERE P.FECHA_VEN >= @fechadesde and P.Fecha_VEN <= @fechahasta");
                datos.agregarParametro("@fechadesde",fd);
                datos.agregarParametro("@fechahasta", fh);
                datos.ejecutarLector();
                while(datos.lector.Read())
                {
                    aux = new InformeVentas();
                    aux.Venta = new Ventas();
                    aux.Usuario = new Usuario();
                    aux.Venta.Fecha = Convert.ToDateTime(datos.lector["Fecha"]);
                    aux.Venta.Id_venta = Convert.ToInt16(datos.lector["IDVenta"]);
                    aux.Usuario.Dni = (string)datos.lector["DNI"];
                    aux.Usuario.Nombre = (string)datos.lector["Nombre"];
                    aux.Usuario.Apellido = (string)datos.lector["Apellido"];
                    aux.Venta.Total = Convert.ToDouble(datos.lector["Total"]);
                    lista.Add(aux);
                }
                datos.cerrarConexion();
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
    }
}
