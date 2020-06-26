using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;


namespace Negocio
{
    public class VentasNegocio
    {

        public VentasNegocio()
        {

        }

        public Ventas get_VentasNegocio(int id_vent)
        {

            Ventas cat = new Ventas();
            DAO_Ventas dao = new DAO_Ventas();
            cat.Id_venta = id_vent;
            return dao.get_Ventas(cat);
        }

        public bool agregar_Ventas(int id_cliente)
        {
            int cantFilas = 0;

            Ventas cat = new Ventas();
            cat.Id_cliente = id_cliente;

            DAO_Ventas dao = new DAO_Ventas();
            cantFilas = dao.agregar_Ventas(cat);
            

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public int Obtener_Ultimo_id_ventas()
        {

            DAO_Ventas dao = new DAO_Ventas();
            return dao.Obtener_Ultimo_id_ventas();

        }

    }
}
