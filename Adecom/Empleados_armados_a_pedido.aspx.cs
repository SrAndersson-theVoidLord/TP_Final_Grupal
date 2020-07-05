using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Dominio;
using Negocio;

namespace Adecom
{
    public partial class Empleados_armados_a_pedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Usuario us = (Usuario)Session["usuariovalidado"];

            ActividadNegocio a_n = new ActividadNegocio();

            GridView1.DataSource = a_n.Obtener_tabla_Actividad("SELECT * FROM [Actividades] WHERE [Estado_A] = 1 AND [Id_Tipo_de_Pedido__A] = 3");
            GridView1.DataBind();

        }
    }
}