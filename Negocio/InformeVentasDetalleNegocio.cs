using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;

namespace Negocio
{
    public class InformeVentasDetalleNegocio
    {
        public List<InformeVentasDetalle> listar(int idventa)
        {
            List<InformeVentasDetalle> lista = new List<InformeVentasDetalle>();
            InformeVentasDetalle aux;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("exec PRO_Mostrar_DetalledeFactura @idventa");
                datos.agregarParametro("@idventa", idventa);
                datos.ejecutarLector();
                while(datos.lector.Read())
                {
                    aux = new InformeVentasDetalle();
                    aux.Idventa = (int)datos.lector["Idventa"];
                    aux.Descripcion = datos.lector["Descripcion"].ToString();
                    aux.Cantidad = (int)datos.lector["Cantidad"];
                    aux.Subtotal = (double)datos.lector["Subtotal"];
                    lista.Add(aux);

                }
                datos.cerrarConexion();
                double total = 0;
                foreach (var item in lista)
                {
                    total += item.Subtotal;

                }
                aux = new InformeVentasDetalle();
                aux.Idventa = 0;
                aux.Descripcion = "TOTAL";
                aux.Cantidad = 0;
                aux.Subtotal = total;
                lista.Add(aux);

                return lista;


            }
            catch (Exception ex)
            {

                throw ex;
            }
            
           

        }

    }
}
