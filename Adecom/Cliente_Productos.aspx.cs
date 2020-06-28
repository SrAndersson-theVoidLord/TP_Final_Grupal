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
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Iniciar_LV();
            }
        }

        public void Iniciar_LV()
        {

            HardwareNegocio hard_neg = new HardwareNegocio();
            string comnado = "SELECT [Nombre_HAR], [Imagen_HAR], [Precio_HAR], [Id_Hardware_HAR], [Categoria_HAR], [Descripcion_HAR] FROM [Hardware]";

            lvProductos.DataSource = hard_neg.Obtener_tabla_Hardware(comnado);
            lvProductos.DataBind();

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_añadir_producto(object sender, CommandEventArgs e)
        {

            if (e.CommandName == "añadir_producto")
            {

                

                if (Session["Carrito"] == null)
                {

                    Session["Carrito"] = Crear_tabla();

                }

                string[] datos = new string[5];
                datos = e.CommandArgument.ToString().Split(';');

                if (Repeticion_de_producto(Convert.ToInt32(datos[0]), 1, "Producto"))
                {

                    int ID_Producto = Convert.ToInt32(datos[0]);
                    string Categoria_Producto = datos[1];
                    string Nombre_Producto = datos[2];
                    string Descripcion_Producto = datos[3];
                    //string Imagen_Producto = datos[4];
                    float Precio_Producto = Convert.ToSingle(datos[4]);

                    Crear_columna((DataTable)Session["Carrito"], ID_Producto, Categoria_Producto, Nombre_Producto, Descripcion_Producto, Precio_Producto, 1, "Producto");
                }

            }

        }

        public DataTable Crear_tabla()
        {

            DataTable aux_table = new DataTable();
            DataColumn aux_column = new DataColumn();

            aux_column = new DataColumn("ID", System.Type.GetType("System.Int32"));
            aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Categoria", System.Type.GetType("System.String"));
            aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Nombre", System.Type.GetType("System.String"));
            aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Descripcion", System.Type.GetType("System.String"));
            aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Precio unitario", System.Type.GetType("System.Double"));
            aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Cantidad", System.Type.GetType("System.Int32"));
            aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Precio total", System.Type.GetType("System.Double"));
            aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Producto/Servicio", System.Type.GetType("System.String"));
            aux_table.Columns.Add(aux_column);

            return aux_table;

        }

        public bool Repeticion_de_producto(int id, int cantidad, string tipo)
        {

            DataTable dt = (DataTable)Session["Carrito"];

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                if (Convert.ToInt32(dt.Rows[i]["ID"]) == id && Convert.ToString(dt.Rows[i]["Producto/Servicio"]) == tipo)
                {

                    dt.Rows[i]["Cantidad"] = Convert.ToInt32(dt.Rows[i]["Cantidad"]) + cantidad;

                    dt.Rows[i]["Precio total"] = Convert.ToSingle(Convert.ToInt32(dt.Rows[i]["Cantidad"]) * Convert.ToSingle(dt.Rows[i]["Precio unitario"]));

                    Session["Carrito"] = dt;


                    return false;

                }


            }

            return true;


        }

        public void Crear_columna(DataTable aux_table, int ID_Producto, string Categoria_Producto, string Nombre_Producto, string Descripcion_Producto, double Precio_Producto, int cantidad, string tipo)
        {

            DataRow aux_columna = aux_table.NewRow();

            aux_columna["ID"] = ID_Producto;
            aux_columna["Categoria"] = Categoria_Producto;
            aux_columna["Nombre"] = Nombre_Producto;
            aux_columna["Descripcion"] = Descripcion_Producto;
            aux_columna["Precio unitario"] = Precio_Producto;
            aux_columna["Cantidad"] = cantidad;
            aux_columna["Precio total"] = Convert.ToSingle(Precio_Producto * cantidad);

            aux_columna["Producto/Servicio"] = tipo;

            aux_table.Rows.Add(aux_columna);

        }
    }
}