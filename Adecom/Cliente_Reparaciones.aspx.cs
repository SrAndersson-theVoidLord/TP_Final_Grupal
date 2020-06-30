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
    }
}