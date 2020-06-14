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
            HardwareNegocio negocio = new HardwareNegocio();
            ListaHardware = negocio.listar();

        }
    }
}