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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack == false)
            {

            }


        }

        protected void btnInciarSesion_Click(object sender, EventArgs e)
        {
            if (cbSoyEmpleado.Checked is true)
            {
                UsuarioNegocio login = new UsuarioNegocio();
                Usuario usuariologin = new Usuario();
                usuariologin = login.Validar_Empleados(tbUsuario.Text);
                if (usuariologin.Nombreusuario == tbUsuario.Text)
                {

                    if (usuariologin.Constraseña == tbContraseña.Text)
                    {
                        Session["usuariovalidado"] = (Usuario)usuariologin;
                        Response.Redirect("/Empleados_Productos.aspx");
                    }
                }

       

            }
            else
            {
                UsuarioNegocio login = new UsuarioNegocio();
                Usuario usuariologin = new Usuario();
                usuariologin = login.Validar_Clientes(tbUsuario.Text);
                if (usuariologin.Nombreusuario == tbUsuario.Text)
                {

                    if (usuariologin.Constraseña == tbContraseña.Text)
                    {
                        Session["usuariovalidado"] = (Usuario)usuariologin;
                        Response.Redirect("/Cliente_Productos.aspx");
                    }
                }


            }
        }

        

        

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Registro.aspx");
        }
    }
}