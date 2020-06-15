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
            usuario.nombre = ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_nombre")).Text;
            usuario.apellido= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_apellido")).Text;
            usuario.dni=((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_dni")).Text;
            usuario.nombreusuario= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_nombreusuario")).Text;
            usuario.direccion= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_direccion")).Text;
            usuario.localidad= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_localidad")).Text;
            usuario.telefono= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_telefono")).Text;
            usuario.email= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_email")).Text;
            usuario.cp= ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("tb_codigopostal")).Text;
            usuario.id_Usuario = Convert.ToInt32(((Label)gvUsuarios.Rows[e.RowIndex].FindControl("lbl_idusuario")).Text);
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


    }
}