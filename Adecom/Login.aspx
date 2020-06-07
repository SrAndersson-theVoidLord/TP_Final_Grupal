<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Adecom.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



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
        <asp:Button ID="btnInciarSesion" Text="Iniciar Sesion" CssClass="btn btn-dark" runat="server" Width="80%" />
    </div>
        <div style="height: 70px; width: 45%; float: left">
        <asp:Button ID="btnRegistrarse" Text="Registrarse" CssClass="btn btn-danger" runat="server" Width="80%" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>
        



</asp:Content>
