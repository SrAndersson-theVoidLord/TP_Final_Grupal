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
    public partial class Empleados_Usuarios : System.Web.UI.Page
    {

        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMostrarClientes_Click(object sender, EventArgs e)
        {

            Session["Grilla"] = "cliente";
            cargarGVClientes();

        }

        protected void btnMostrarEmpleados_Click(object sender, EventArgs e)
        {
            Session["Grilla"] = "empleado";
            cargarGVClientes();
        }
        private void cargarGVClientes()
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            if (Session["Grilla"].ToString() == "cliente")
            {
            gvUsuarios.DataSource = negocio.listar_Clientes();
            }
            else
            {
            gvUsuarios.DataSource = negocio.listar_Empleados();
            }
            gvUsuarios.DataBind();

        }

        protected void gvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsuarios.EditIndex = e.NewEditIndex;
            cargarGVClientes();    

        }

      

        protected void gvUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsuarios.EditIndex = -1;
            cargarGVClientes();

        }

        protected void gvUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.Nombre = ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_nombre")).Text;
            usuario.Apellido= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_apellido")).Text;
            usuario.Dni=((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_dni")).Text;
            usuario.Nombreusuario= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_nombreusuario")).Text;
            usuario.Direccion= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_direccion")).Text;
            usuario.Localidad= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_localidad")).Text;
            usuario.Telefono= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_telefono")).Text;
            usuario.Email= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_email")).Text;
            usuario.Cp= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_codigopostal")).Text;
            usuario.Id_Usuario = Convert.ToInt32(((Label)gvUsuarios.Rows[e.RowIndex].FindControl("lbl_idusuario")).Text);
            //usuario.Estado = Convert.ToBoolean(((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_estado")).Text);

            UsuarioNegocio negocio = new UsuarioNegocio();

            if (Session["Grilla"].ToString() == "cliente")
            {
            negocio.ModificarCliente(usuario);

            }
            else
            {
            negocio.ModificarEmpleado(usuario);
            }

            gvUsuarios.EditIndex = -1;
            cargarGVClientes();
        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;
            cargarGVClientes();
        }

        protected void gvUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.Id_Usuario = Convert.ToInt32(((Label)gvUsuarios.Rows[e.RowIndex].FindControl("lbl_idusuario")).Text);
            UsuarioNegocio negocio = new UsuarioNegocio();

            if (Session["Grilla"].ToString() == "cliente")
            {
                negocio.EliminarCliente(usuario);

            }
            else
            {
                negocio.EliminarEmpleado(usuario);
            }

            gvUsuarios.EditIndex = -1;
            cargarGVClientes();




        }

        protected void btnRegistroEmpleados_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }
    }
}