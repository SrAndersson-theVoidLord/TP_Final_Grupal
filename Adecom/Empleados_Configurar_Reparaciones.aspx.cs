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

            Presupuesto_de_servicio_Negocio ps = new Presupuesto_de_servicio_Negocio();

            Solicitud_de_servicio ss = new Solicitud_de_servicio();
            Solicitud_de_servicio_Negocio ss_neg = new Solicitud_de_servicio_Negocio();

            Usuario usu = new Usuario();

            usu = (Usuario)Session["usuariovalidado"];

            ss = ss_neg.get_Solicitud_de_servicio_Negocio(Convert.ToInt32(Session["Id_reparacion"]));

            int tipo = Convert.ToInt32(DropDownList1.SelectedValue);
            int horas = Convert.ToInt32(TextBox2.Text);
            string descripcion = TextBox1.Text;

            ps.agregar_Presupuesto_de_servicio(ss.Id_solicitud_de_servicio, ss.Id_cliente, usu.Id_Usuario, tipo, horas, descripcion);
            ss_neg.Dar_de_baja_Solicitud_de_servicio(ss.Id_solicitud_de_servicio);

            Response.Redirect("/Empleados_Reparaciones.aspx");

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}