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
            int altausuario;
            Usuario u = new Usuario();
            UsuarioNegocio un = new UsuarioNegocio();
            u = Cargar_Usuario_Registro();
            if(usuarioregistrado() == "null")
            {
            altausuario = un.agregarcliente(u);
            }
            else
            {
            altausuario = un.agregarempleado(u);
            }


            if (altausuario == 1)
            {
                lblAltaUsuario.Text = "El Usuario ha sido dado de alta con Exito!!";
                limpiarregistro();
            }
            else
            {
                lblAltaUsuario.Text = "Ocurrio un problema, intentelo en unos minutos.....";
            }

        }

        protected void limpiarregistro()
        {
            tbUsuarioRegistro.Text = null;
            tbContraseñaRegistro.Text = null;
            tbNombre.Text = null;
            tbApellido.Text = null;
            tbDni.Text = null;
            tbLocalidad.Text = null;
            tbDireccion.Text = null;
            
            tbCP.Text = null;
            tbTelefono.Text = null;
            tbEmail.Text = null;
            

        }

        protected Usuario Cargar_Usuario_Registro()
        {
            Usuario u = new Usuario();
            u.Nombreusuario = tbUsuarioRegistro.Text;
            u.Constraseña = tbContraseñaRegistro.Text;
            u.Nombre = tbNombre.Text;
            u.Apellido = tbApellido.Text;
            u.Dni = tbDni.Text;
            u.Localidad = tbLocalidad.Text;
            u.Direccion = tbDireccion.Text;
            u.Cp = tbCP.Text;
            u.Telefono = tbTelefono.Text;
            u.Email = tbEmail.Text;
            u.Estado = true;
            return u;
        }


        protected void cargarregistro(Usuario u)
        {
            tbUsuarioRegistro.Text = u.Nombreusuario;
            tbContraseñaRegistro.Text = u.Constraseña;
            tbRepetirContraseña.Text = u.Constraseña;
            tbNombre.Text = u.Nombre;
            tbApellido.Text = u.Apellido;
            tbDni.Text = u.Dni;
            tbLocalidad.Text = u.Localidad;
            tbDireccion.Text = u.Direccion;
            tbCP.Text = u.Cp;
            tbTelefono.Text = u.Telefono;
            tbEmail.Text = u.Email;

        }

        protected void tbDni_TextChanged(object sender, EventArgs e)
        {
            UsuarioNegocio un = new UsuarioNegocio();
            Usuario u = new Usuario();
            if(usuarioregistrado() != "Empleado")
            { 
                u = un.Validar_DNI_Cliente(tbDni.Text);
                if (u.Dni != null)
                    {
                
                    lblAltaUsuario.Text = "ATENCION: Ya existe un Usuario creado con este DNI!!!";
                    limpiarregistro();
                }
            }
            else
            {
                u = un.Validar_DNI_Empleado(tbDni.Text);
                if (u.Dni != null)
                {
                lblAltaUsuario.Text = "ATENCION: Ya existe un Usuario creado con este DNI!!!";
                    limpiarregistro();
                }
            }
                
        }

        public String usuarioregistrado()
        {
            if (Session["usuariovalidado"] != null)
            {
                string tipousuario;
                tipousuario = (string)Session["tipousuario"];

                return tipousuario;
            }
            return "null";
        }


    }
}