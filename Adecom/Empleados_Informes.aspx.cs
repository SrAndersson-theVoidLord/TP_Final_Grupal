using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace Adecom
{
    public partial class Empleados_Informes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == true)
            {

            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            InformeVentasNegocio n = new InformeVentasNegocio();
            gvInformeVentas.DataSource = n.listar(Convert.ToDateTime(tbfechadesde.Text), Convert.ToDateTime(tbfechahasta.Text));
            gvInformeVentas.DataBind();
            gvDetalleVentas.Visible = false;

        }

        protected void gvInformeVentas_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string s_IdVenta = ((Label)gvInformeVentas.Rows[e.NewSelectedIndex].FindControl("lbl_idventa")).Text;
            verdetalle(s_IdVenta);
        }

       protected void verdetalle(string idventa)
        {
            gvDetalleVentas.Visible = true;
            InformeVentasDetalleNegocio n = new InformeVentasDetalleNegocio();
            gvDetalleVentas.DataSource = n.listar(Convert.ToInt16(idventa));
            gvDetalleVentas.DataBind();

        }

    }
}