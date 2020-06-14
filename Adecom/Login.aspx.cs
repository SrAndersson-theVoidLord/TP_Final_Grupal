using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adecom
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInciarSesion_Click(object sender, EventArgs e)
        {
            if (cbSoyEmpleado.Checked is true)
            {
             Response.Redirect("/Empleados_Productos.aspx");
            }
            else
            {
            Response.Redirect("/Cliente_Productos.aspx");
            }    
            

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Registro.aspx");
        }
    }
}