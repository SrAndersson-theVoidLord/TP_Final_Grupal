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
        protected void Page_Load(object sender, EventArgs e)
        {

            

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

            //string[] datos = new string[5];
            //datos = e.CommandArgument.ToString().Split(';');

            //bool flag = false;

            //int ID_Producto = Convert.ToInt32(datos[0]);
            //string Categoria_Producto = datos[1];
            //string Nombre_Producto = datos[2];
            //string Descripcion_Producto = datos[3];
            //float Precio_Producto = Convert.ToSingle(datos[4]);

            //Crear_columna((DataTable)Session["Carrito"], ID_Producto, Categoria_Producto, Nombre_Producto, Descripcion_Producto, Precio_Producto);


            Llenar_carrito(Convert.ToInt32(DropDownList1.SelectedValue));
            Llenar_carrito(Convert.ToInt32(DropDownList2.SelectedValue));
            Llenar_carrito(Convert.ToInt32(DropDownList3.SelectedValue));
            Llenar_carrito(Convert.ToInt32(DropDownList4.SelectedValue));
            Llenar_carrito(Convert.ToInt32(DropDownList5.SelectedValue));
            Llenar_carrito(Convert.ToInt32(DropDownList6.SelectedValue));
            Llenar_carrito(Convert.ToInt32(DropDownList7.SelectedValue));
            Llenar_carrito(Convert.ToInt32(DropDownList8.SelectedValue));

        }

        public void Llenar_carrito(int id)
        {

            Hardware hard = new Hardware();
            HardwareNegocio neg = new HardwareNegocio();

            hard = neg.get_HardwareNegocio(id);

            int ID_Producto = hard.Id_hardware;
            string Categoria_Producto = hard.Str_categoria;
            string Nombre_Producto = hard.Nombre;
            string Descripcion_Producto = hard.Descripcion;
            float Precio_Producto = hard.Precio_unitario;

            Crear_columna((DataTable)Session["Carrito"], ID_Producto, Categoria_Producto, Nombre_Producto, Descripcion_Producto, Precio_Producto);


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
            aux_columna["Precio"] = Precio_Producto;
            aux_columna["Cantidad"] = 1;

            aux_table.Rows.Add(aux_columna);

        }
    }
}