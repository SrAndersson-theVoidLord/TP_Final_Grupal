using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Adecom
{
    public partial class VerCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Carrito"] != null)
            {
                GridView_Carrito.DataSource = (DataTable)Session["Carrito"];
                GridView_Carrito.DataBind();
            }

        }


    }
}