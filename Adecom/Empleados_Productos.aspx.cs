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
    public partial class Empleados_Productos : System.Web.UI.Page
    {

        public List<Hardware> ListaHardware { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                listarhardware();
                cargarddlfiltros();
                if (Session["usuariovalidado"]==null)
                {
                    Response.Redirect("/Login.aspx");
                }
            }
            
        }

        protected void btnAgregarHarware_Click(object sender, EventArgs e)
        {
            Response.Redirect("Empleados_AMProductos.aspx");
        }

        protected void cargarddlfiltros()
        {
            CategoriaHardwareNegocio ncategoria = new CategoriaHardwareNegocio();
            ddlCategoria.DataSource = ncategoria.listar_categoriahw();
            ddlCategoria.DataTextField = "Descripcion";
            ddlCategoria.DataValueField = "Id_categoria";
            ddlCategoria.DataBind();

        }

        protected void listarhardware()
        {
            HardwareNegocio negocio = new HardwareNegocio();
            ListaHardware = negocio.listar("1","%");


        }

        protected void ddlActivos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlfiltros();
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlfiltros();

        }

        protected void ddlfiltros()
        {
            HardwareNegocio negocio = new HardwareNegocio();
            if (ddlActivos.SelectedItem.Text == "Habilitados")
                ListaHardware = negocio.listar("1",ddlCategoria.SelectedValue);
            if (ddlActivos.SelectedItem.Text == "Deshabilitados")
                ListaHardware = negocio.listar("0", ddlCategoria.SelectedValue);

        }


    }
}