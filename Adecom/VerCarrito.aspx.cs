using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Negocio;
using Dominio;

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

            double total_carrito = 0;
            DataTable dt = (DataTable)Session["Carrito"];

            if(Session["Carrito"] == null)
            {
                Total.Text = "No hay productos cargados en el carrito";
            }
            else
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    total_carrito += Convert.ToSingle(dt.Rows[i]["Precio total"]);


                }

                Total.Text = "Total del carrito: $" + Convert.ToString(total_carrito);

            }

        }

        public void Borrar_carrito()
        {

            Session["Carrito"] = null;
            GridView_Carrito.DataSource = (DataTable)Session["Carrito"];
            GridView_Carrito.DataBind();
            

        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {



            if (Session["Carrito"] != null)
            {

                Borrar_carrito();
                Total.Text = "Borrado exitoso: Ya no hay productos cargados en el carrito";

            }
            


        }



        protected void btnConfirmar_Click(object sender, EventArgs e)
        {

            if (Session["usuariovalidado"] != null) {

                VentasNegocio v_neg = new VentasNegocio();
                DV_HardwareNegocio dv_h_neg = new DV_HardwareNegocio();

                ActividadNegocio act_neg = new ActividadNegocio();
                DV_ServiciosNegocio dv_s_neg = new DV_ServiciosNegocio();
                

                DataTable dt = (DataTable)Session["Carrito"];
                int id_vent;
                int id_actividad;

                if (Session["Carrito"] != null)
                {

                    Usuario us = (Usuario)Session["usuariovalidado"];



                    if (v_neg.agregar_Ventas(us.Id_Usuario)) 
                    {

                        id_vent = v_neg.Obtener_Ultimo_id_ventas();

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (Convert.ToString(dt.Rows[i]["Producto/Servicio"]) == "Producto") {
                                dv_h_neg.agregar_DV_HardwareNegocio(id_vent, Convert.ToInt32(dt.Rows[i]["ID"]), Convert.ToInt32(dt.Rows[i]["Cantidad"]));
                            }
                            else
                            {

                                if (Convert.ToString(dt.Rows[i]["Producto/Servicio"]) == "Servicio")
                                {

                                    if (Convert.ToInt32(dt.Rows[i]["ID"]) == 3)
                                    {

                                        //Agregar random empleado.

                                        act_neg.agregar_Actividad_Negocio_armado(us.Id_Usuario, 1, Convert.ToInt32(dt.Rows[i]["ID"]), "Armado", Convert.ToSingle(dt.Rows[i]["Precio total"]));

                                        id_actividad = act_neg.Obtener_Ultimo_id_Actividad();

                                        dv_s_neg.agregar_DV_ServiciosNegocio(id_vent, id_actividad, "Armado");


                                    }

                                }

                            }

                        }

                        Borrar_carrito();
                        Total.Text = "Venta exitosa";
                    }

                }

            }
            else
            {
                lab_mensaje.Text = "Ingrese un usuario antes de confirmar una venta.";
            }



        }



    }
}