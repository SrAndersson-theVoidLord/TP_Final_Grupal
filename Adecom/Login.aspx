<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Adecom.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Contenido_menu_contextual" runat="server">

 <div class="d-flex flex-column p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Productos.aspx" >Productos</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_armados_a_pedido.aspx" >Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Reparaciones.aspx" >Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Contactos.aspx" >Contacto</a>
    </div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">

        <div class="bg-light text-center font-weight-bold ">
        <h3>Inicio de Sesion</h3>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Usuario</label>
        <asp:TextBox ID="tbUsuario" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>

    <div style="height: 20px; width: 100%; float: left">&nbsp</div>
    
    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Contraseña</label>
        <asp:TextBox ID="tbContraseña" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
    
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    
    <div style="height: 40px; width: 10%; float: left">&nbsp</div>
    <div style="height: 40px; width: 60%; float: left">
        <asp:CheckBox ID="cbSoyEmpleado" Text="Soy Empleado" CssClass="form-check" runat="server" />
    </div>
    <div style="height: 40px; width: 30%; float: left">&nbsp</div>
    
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 15%; float: left">
        <asp:Button ID="btnInciarSesion" Text="Iniciar Sesion" CssClass="btn btn-dark" runat="server" Width="80%" OnClick="btnInciarSesion_Click" />
    </div>
        <div style="height: 70px; width: 45%; float: left">
        <asp:Button ID="btnRegistrarse" Text="Registrarse" CssClass="btn btn-danger" runat="server" Width="80%" OnClick="btnRegistrarse_Click" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
        



</asp:Content>
