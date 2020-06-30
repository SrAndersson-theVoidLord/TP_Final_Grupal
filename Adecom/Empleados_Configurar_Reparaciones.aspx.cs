using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adecom
{
    public partial class Empleados_Configurar_Reparaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (IsPostBack == false)
            {
                Solicitud_de_servicio ss = new Solicitud_de_servicio();
                Solicitud_de_servicio_Negocio ss_neg = new Solicitud_de_servicio_Negocio();
                TipoPedidoNegocio tp_neg = new TipoPedidoNegocio();

                int id_ss = Convert.ToInt32(Session["Id_reparacion"]);

                ss = ss_neg.get_Solicitud_de_servicio_Negocio(id_ss);

                Iad_Cliente.Text = Convert.ToString(ss.Id_cliente);
                lab_Descripcion.Text = Convert.ToString(ss.Descripcion);

                DropDownList1.DataSource = tp_neg.Obtener_tabla_TipoPedido("SELECT [Id_Tipo_TDP], [Descripcion_TDP] FROM [Tipos_de_pedido]");
                DropDownList1.DataBind();

            }

        }

        protected void but_Aceptar_Click(object sender, EventArgs e)
        {

            Presupuesto_de_servicio ps = new Presupuesto_de_servicio(); 

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}