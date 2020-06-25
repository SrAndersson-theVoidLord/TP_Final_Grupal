using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Adecom
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {

            }
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_añadir_producto(object sender, CommandEventArgs e)
        {

            if (e.CommandName == "añadir_producto")
            {

                Label1.Text = "aaaaaa";

                if (Session["Carrito"] == null)
                {

                    Session["Carrito"] = Crear_tabla();

                }

                string[] datos = new string[5];
                datos = e.CommandArgument.ToString().Split(';');

                bool flag = false;
                //DataTable dt = (DataTable)Session["Carrito"];
                //for (int i = 0; i < dt.Rows.Count; i++)
                //{
                //    if (datos[0] == dt.Rows[i]["ID"].ToString())
                //    {
                //        //flag = true;

                //        dt.Rows[i]["Cantidad"] = 1;

                //        Session["Carrito"]

                //    }
                //}

                //if (!flag)
                //{
                    int ID_Producto = Convert.ToInt32(datos[0]);
                    string Categoria_Producto = datos[1];
                    string Nombre_Producto = datos[2];
                    string Descripcion_Producto = datos[3];
                    //string Imagen_Producto = datos[4];
                    float Precio_Producto = Convert.ToSingle(datos[4]);

                    Crear_columna((DataTable)Session["Carrito"], ID_Producto, Categoria_Producto, Nombre_Producto, Descripcion_Producto, Precio_Producto);
                //}
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

            //aux_column = new DataColumn("Imagen", System.Type.GetType("System.String"));
            //aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Precio", System.Type.GetType("System.Single"));
            aux_table.Columns.Add(aux_column);

            aux_column = new DataColumn("Cantidad", System.Type.GetType("System.Int32"));
            aux_table.Columns.Add(aux_column);

            return aux_table;

        }

        public void Crear_columna(DataTable aux_table, int ID_Producto, string Categoria_Producto, string Nombre_Producto, string Descripcion_Producto, float Precio_Producto)
        {

            DataRow aux_columna = aux_table.NewRow();

            aux_columna["ID"] = ID_Producto;
            aux_columna["Categoria"] = Categoria_Producto;
            aux_columna["Nombre"] = Nombre_Producto;
            aux_columna["Descripcion"] = Descripcion_Producto;
            //aux_columna["Imagen"] = Imagen_Producto;
            aux_columna["Precio"] = Precio_Producto;
            aux_columna["Cantidad"] = 1;

            aux_table.Rows.Add(aux_columna);

        }
    }
}