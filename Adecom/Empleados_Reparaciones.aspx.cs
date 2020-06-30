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
    public partial class Empleados_Reparaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack == false)
            {

                Iniciar_grid_view();

            }
        }

        public void Iniciar_grid_view()
        {

            Solicitud_de_servicio_Negocio sol_neg = new Solicitud_de_servicio_Negocio();

            GridView1.DataSource = sol_neg.Obtener_tabla_Solicitud_de_servicio("SELECT [Id_Solicitud_SdS] AS [Id], [Id_Cliente_SdS] AS [Cliente], [Descripcion_SdS] AS [Descripcion] FROM [Solicitud_de_servicio] WHERE [Estado_SdS] = 1");
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            //Session["Id_reparacion"] = [e.NewSelectedIndex];

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanging1(object sender, GridViewSelectEventArgs e)
        {

            Session["Id_reparacion"] = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("lab_id")).Text;

            Response.Redirect("/Empleados_Configurar_Reparaciones.aspx");

        }
    }
}