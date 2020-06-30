using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

using Dominio;
using Negocio;

namespace Adecom
{
    public partial class armados_a_pedido : System.Web.UI.Page
    {

        double total_armado = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack == false)
            {

                Iniciar_DDLs();
               
            }

            Llenar_labels_precios();




        }

        

        public void Iniciar_DDLs()
        {

            HardwareNegocio hard_neg = new HardwareNegocio();

            DropDownList1.DataSource = hard_neg.Obtener_tabla_Hardware("SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'DISO') OR ([Categoria_HAR] = 'DIRI')");
            DropDownList1.DataBind();
           

            DropDownList2.DataSource = hard_neg.Obtener_tabla_Hardware("SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'PROC')");
            DropDownList2.DataBind();

            DropDownList3.DataSource = hard_neg.Obtener_tabla_Hardware("SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'PLMA')");
            DropDownList3.DataBind();

            DropDownList4.DataSource = hard_neg.Obtener_tabla_Hardware("SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'PLVI')");
            DropDownList4.DataBind();

            DropDownList5.DataSource = hard_neg.Obtener_tabla_Hardware("SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'MRAM')");
            DropDownList5.DataBind();

            DropDownList6.DataSource = hard_neg.Obtener_tabla_Hardware("SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'FUEN')");
            DropDownList6.DataBind();

            DropDownList7.DataSource = hard_neg.Obtener_tabla_Hardware("SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'GABI')");
            DropDownList7.DataBind();

            DropDownList8.DataSource = hard_neg.Obtener_tabla_Hardware("SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'SOFT')");
            DropDownList8.DataBind();

        }

        public void Llenar_labels_precios()
        {

            lvlDisco.Text= "$" + preciolabel(Convert.ToInt32(DropDownList1.SelectedValue));
            lvlProcesador.Text = "$" + preciolabel(Convert.ToInt32(DropDownList2.SelectedValue));
            lvlMother.Text = "$" + preciolabel(Convert.ToInt32(DropDownList3.SelectedValue));
            lvlPlacadeVideo.Text = "$" + preciolabel(Convert.ToInt32(DropDownList4.SelectedValue));
            lvlRam.Text = "$" + preciolabel(Convert.ToInt32(DropDownList5.SelectedValue));
            lvlFuente.Text = "$" + preciolabel(Convert.ToInt32(DropDownList6.SelectedValue));
            lvlGabinete.Text = "$" + preciolabel(Convert.ToInt32(DropDownList7.SelectedValue));
            lvlSistema.Text = "$" + preciolabel(Convert.ToInt32(DropDownList8.SelectedValue));
        }
        string preciolabel(int id)
        {
            Hardware hard = new Hardware();
            HardwareNegocio neg = new HardwareNegocio();

            hard = neg.get_HardwareNegocio(id);
            int n = Convert.ToInt32(hard.Precio_unitario);
            string b = Convert.ToString(n);
            return b;
        }
            protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Session["Carrito"] == null)
            {

                Session["Carrito"] = Crear_tabla();

            }

            total_armado = 0;

            Llenar_carrito(Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(ddl_disco.SelectedValue), "Producto");
            Llenar_carrito(Convert.ToInt32(DropDownList2.SelectedValue), 1, "Producto");
            Llenar_carrito(Convert.ToInt32(DropDownList3.SelectedValue), 1, "Producto");
            Llenar_carrito(Convert.ToInt32(DropDownList4.SelectedValue), Convert.ToInt32(ddl_placa_video.SelectedValue), "Producto");
            Llenar_carrito(Convert.ToInt32(DropDownList5.SelectedValue), Convert.ToInt32(ddl_memoria_ram.SelectedValue), "Producto");
            Llenar_carrito(Convert.ToInt32(DropDownList6.SelectedValue), 1, "Producto");
            Llenar_carrito(Convert.ToInt32(DropDownList7.SelectedValue), 1, "Producto");
            Llenar_carrito(Convert.ToInt32(DropDownList8.SelectedValue), 1, "Producto");

            Llenar_carrito(3, 1, "Servicio");

            total_armado = 0;

        }

        public bool Repeticion_de_producto(int id, int cantidad, string tipo)
        {
            
            DataTable dt = (DataTable)Session["Carrito"];

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                if (Convert.ToInt32(dt.Rows[i]["ID"]) == id && Convert.ToString(dt.Rows[i]["Producto/Servicio"]) == "Producto")
                {

                    dt.Rows[i]["Cantidad"] = Convert.ToInt32(dt.Rows[i]["Cantidad"]) + cantidad;

                    dt.Rows[i]["Precio total"] = Convert.ToInt32(dt.Rows[i]["Cantidad"]) * Convert.ToSingle(dt.Rows[i]["Precio unitario"]);

                    total_armado += cantidad * Convert.ToSingle(dt.Rows[i]["Precio unitario"]);

                    Session["Carrito"] = dt;


                    return false;

                }
                
            }

            return true;


        }

        public bool Repeticion_de_servicios(int id, string tipo)
        {

            DataTable dt = (DataTable)Session["Carrito"];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                
                if (Convert.ToInt32(dt.Rows[i]["ID"]) == id && Convert.ToString(dt.Rows[i]["Producto/Servicio"]) == "Servicio")
                {

                    dt.Rows[i]["Precio total"] = Convert.ToSingle(dt.Rows[i]["Precio total"]) + (total_armado * 0.1);
                    dt.Rows[i]["Precio unitario"] = Convert.ToSingle(dt.Rows[i]["Precio total"]);

                    Session["Carrito"] = dt;

                    return false;

                }
                
            }

            return true;

        }

        public void Llenar_carrito(int id, int cantidad, string tipo)
        {
            if (tipo == "Producto") {
                if (Repeticion_de_producto(id, cantidad, tipo)) {

                    Hardware hard = new Hardware();
                    HardwareNegocio neg = new HardwareNegocio();

                    hard = neg.get_HardwareNegocio(id);

                    int ID_Producto = hard.Id_hardware;
                    string Categoria_Producto = hard.Str_categoria;
                    string Nombre_Producto = hard.Nombre;
                    string Descripcion_Producto = hard.Descripcion;
                    double Precio_Producto = hard.Precio_unitario;

                    total_armado += hard.Precio_unitario * cantidad;

                    Crear_columna((DataTable)Session["Carrito"], ID_Producto, Categoria_Producto, Nombre_Producto, Descripcion_Producto, Precio_Producto, cantidad, tipo);

                }

            }
            else
            {

                if (Repeticion_de_servicios(id, tipo))
                {


                    int ID_Producto = 3;
                    string Categoria_Producto = "Armado";
                    string Nombre_Producto = "Armado";
                    string Descripcion_Producto = "Armado";


                    double Precio_Producto = total_armado * 0.10;

                    Crear_columna((DataTable)Session["Carrito"], ID_Producto, Categoria_Producto, Nombre_Producto, Descripcion_Producto, Precio_Producto, cantidad, tipo);

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

        public void Crear_columna(DataTable aux_table, int ID_Producto, string Categoria_Producto, string Nombre_Producto, string Descripcion_Producto, double Precio_Producto, int cantidad, string tipo)
        {

            DataRow aux_columna = aux_table.NewRow();

            aux_columna["ID"] = ID_Producto;
            aux_columna["Categoria"] = Categoria_Producto;
            aux_columna["Nombre"] = Nombre_Producto;
            aux_columna["Descripcion"] = Descripcion_Producto;
            aux_columna["Precio unitario"] = Precio_Producto;
            aux_columna["Cantidad"] = cantidad;
            aux_columna["Precio total"] = Precio_Producto * cantidad;

            aux_columna["Producto/Servicio"] = tipo;

            aux_table.Rows.Add(aux_columna);

        }
    }
}