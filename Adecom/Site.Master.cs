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
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            usuarioregistrado();
           
        }


        public void usuarioregistrado()
        {
            if (Session["usuariovalidado"] != null)
            {
                Usuario usuariologin = new Usuario();
                usuariologin = (Usuario)Session["usuariovalidado"];
                hlIniciarSesion.Enabled = false;
                hlIniciarSesion.Text = "Bienvenido " + usuariologin.Nombre + " " + usuariologin.Apellido;
                
                btnCerrarSesion.Enabled = true;
                btnCerrarSesion.Visible = true;
                if(tipousuarioregistrado() == "Empleado")
                {
                    hlVerCarrito.Visible = false;
                    hlPaginaPrincipal.Enabled = false;
                }
                else
                {
                    hlVerCarrito.Visible = true ;
                    hlPaginaPrincipal.Enabled = true;
                }


            }
            else
            {
                
                hlIniciarSesion.Enabled = true;
                hlIniciarSesion.Text = "Iniciar Sesion";
                hlVerCarrito.Visible = true;
                hlPaginaPrincipal.Enabled = true;

                btnCerrarSesion.Enabled = false;
                btnCerrarSesion.Visible = false;

            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuariovalidado"] = null;
            Response.Redirect("/Login.aspx");

        }

        public String tipousuarioregistrado()
        {
            if (Session["usuariovalidado"] != null)
            {
                UsuarioNegocio un = new UsuarioNegocio();
                Usuario usuariologin = new Usuario();
                usuariologin = (Usuario)Session["usuariovalidado"];
                Usuario aux = new Usuario();
                aux = un.Validar_DNI_Empleado(usuariologin.Dni);
                if (aux.Dni == usuariologin.Dni)
                {
                    return "Empleado";
                }
                else
                {
                    return "null";
                }
            }
            return "null";
        }




    }
}