using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;

using System.Data;
using System.Data.SqlClient;

namespace Negocio
{
    public class TipoPedidoNegocio
    {

        public TipoPedidoNegocio()
        {

        }

        public TipoPedido get_TipoPedidoNegocio(int id_tipo)
        {

            TipoPedido cat = new TipoPedido();
            DAO_Tipos_de_pedido dao = new DAO_Tipos_de_pedido();
            cat.Id_tipo = id_tipo;
            return dao.get_Tipos_de_pedido(cat);
        }

        public DataTable Obtener_tabla_TipoPedido(string comnado)
        {
            DAO_Tipos_de_pedido dao_hard = new DAO_Tipos_de_pedido();

            return dao_hard.Obtener_tabla_Tipos_de_pedido(comnado);

        }

    }
}
