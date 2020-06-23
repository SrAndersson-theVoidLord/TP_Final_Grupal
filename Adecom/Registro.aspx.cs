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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void btnRegistrarseRegistro_Click(object sender, EventArgs e)
        {
            Usuario u = new Usuario();
            UsuarioNegocio un = new UsuarioNegocio();
            u = Cargar_Usuario_Registro();
            //un.agregarcliente(u);
        }

        protected Usuario Cargar_Usuario_Registro()
        {
            Usuario u = new Usuario();
            u.Nombreusuario = tbUsuarioRegistro.ToString();
            u.Constraseña = tbContraseñaRegistro.ToString();
            u.Nombre = tbNombre.ToString();
            u.Apellido = tbApellido.ToString();
            u.Dni = tbDni.ToString();
            u.Localidad = tbLocalidad.ToString();
            u.Direccion = tbDireccion.ToString() + " " + tbNumero.ToString();
            u.Cp = tbCP.ToString();
            u.Telefono = tbTelefono.ToString();
            u.Email = tbEmail.ToString();
            u.Estado = true;
            return u;
        }

        protected void cvDni_ServerValidate(object source, ServerValidateEventArgs args)
        {
            /*
            UsuarioNegocio un = new UsuarioNegocio();
            Usuario u = new Usuario();
            u = un.ValidarDNI_cliente(args.ToString());
            if ( u != null )
            {
                args.IsValid = false;
                return;
            }
            u = un.ValidarDNI_Empleado(args.ToString());
            if ( u != null)
            {
                args.IsValid = false;
                return;
            }
            */
            args.IsValid = true;
        }
    }
}