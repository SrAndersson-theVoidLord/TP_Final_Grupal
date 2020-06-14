<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente_Reparaciones.aspx.cs" Inherits="Adecom.Cliente_Reparaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: x-large;
        }
        .auto-style2 {
            text-align: left;
        }
    </style>
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
       <div class="bg-light text-center font-weight-bold border border-danger">
        <h3>Reparaciones</h3>

    </div>
    <br />

    <p class="auto-style2">
        Realize una brebe descripcion de su problema:</p>
    <p class="auto-style2">
        <asp:TextBox ID="txtProblema" runat="server" Height="152px" Width="725px"></asp:TextBox>
    </p>
    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style2">
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar Formulario" />
    </p>
</asp:Content>
