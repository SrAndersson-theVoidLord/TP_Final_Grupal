<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Adecom.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">

 <div class="d-flex p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark w-25" href="/Cliente_Productos.aspx" >Productos</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-25" href="/Cliente_armados_a_pedido.aspx" >Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-25" href="/Cliente_Reparaciones.aspx" >Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-25" href="/Cliente_Contactos.aspx" >Contacto</a>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="bg-light text-center font-weight-bold border border-danger" >
        <h3>Registro de Usuarios</h3>
    </div>
    

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Ingresar Usuario</label>
        <asp:TextBox ID="tbUsuarioRegistro" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Ingresar Constraseña</label>
        <asp:TextBox ID="tbContraseñaRegistro" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Repetir Contraseña</label>
        <asp:TextBox ID="tbRepetirContraseña" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Nombre</label>
        <asp:TextBox ID="tbNombre" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Apellido</label>
        <asp:TextBox ID="tbApellido" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">DNI</label>
        <asp:TextBox ID="tbDni" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Localidad</label>
        <asp:TextBox ID="tbLocalidad" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Direccion</label>
        <asp:TextBox ID="tbDireccion" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Numero</label>
        <asp:TextBox ID="tbNumero" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Codigo Postal</label>
        <asp:TextBox ID="tbCP" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Telefono</label>
        <asp:TextBox ID="tbTelefono" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Email</label>
        <asp:TextBox ID="tbEmail" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

        <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <asp:Button ID="btnRegistrarseRegistro" Text="Registrarse" CssClass="btn btn-danger" runat="server" Width="80%" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>


</asp:Content>
