using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dao;


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

    }
}
