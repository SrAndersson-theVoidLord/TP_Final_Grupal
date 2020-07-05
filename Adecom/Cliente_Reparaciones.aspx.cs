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
    public partial class Cliente_Reparaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack == false)
            {
                if (Session["usuariovalidado"] != null)
                {

                    Iniciar_grid();

                }

            }

        }

        public void Iniciar_grid()
        {
            Usuario us = (Usuario)Session["usuariovalidado"];

            Presupuesto_de_servicio_Negocio ps_n = new Presupuesto_de_servicio_Negocio();

            GridView1.DataSource = ps_n.Obtener_tabla_Presupuesto_de_servicio("SELECT * FROM [Presupuesto_de_servicio] WHERE [Estado_PdS] = 1 AND [Id_Cliente_PdS] = " + us.Id_Usuario);
            GridView1.DataBind();
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {

            if (Session["usuariovalidado"] != null)
            {

                Solicitud_de_servicio_Negocio soli_serv_neg = new Solicitud_de_servicio_Negocio();
                Usuario us = (Usuario)Session["usuariovalidado"];

                soli_serv_neg.agregar_Solicitud_de_servicio(us.Id_Usuario, txtProblema.Text);

                txtProblema.Text = "";
                leb_mensaje.Text = "La solisitud a sido enviada.";

            }
            else
            {
                leb_mensaje.Text = "Ingrese un usuario antes de confirmar una venta.";
            }

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Presupuesto_de_servicio ps = new Presupuesto_de_servicio();
            Presupuesto_de_servicio_Negocio ps_n = new Presupuesto_de_servicio_Negocio();
            ActividadNegocio a_n = new ActividadNegocio();
            VentasNegocio v_n = new VentasNegocio();
            DV_ServiciosNegocio dv_s_n = new DV_ServiciosNegocio();

            Label la = (Label)GridView1.Rows[e.NewSelectedIndex].FindControl("lab_presupuesto");
            int id = Convert.ToInt32(la.Text);

            ps = ps_n.get_Presupuesto_de_servicio_Negocio(id);

            a_n.agregar_ActividadNegocio(ps.Id_cliente, ps.Id_empleado, ps.Id_tipo, ps.Descripcion, ps.Horas_trabajadas);

            ps_n.Dar_de_baja_Presupuesto_de_servicio(id);

            v_n.agregar_Ventas(ps.Id_cliente);

            int id_venta = v_n.Obtener_Ultimo_id_ventas();
            int id_actividad = a_n.Obtener_Ultimo_id_Actividad();

            dv_s_n.agregar_DV_ServiciosNegocio(id_venta, id_actividad, ps.Descripcion);


            Iniciar_grid();

        }
    }
}