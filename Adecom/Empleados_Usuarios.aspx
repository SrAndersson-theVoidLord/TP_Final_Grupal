<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados_Usuarios.aspx.cs" Inherits="Adecom.Empleados_Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido_menu_contextual" runat="server">
    <div class="d-flex flex-column p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Productos.aspx">Hardware</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_armados_a_pedido.aspx">Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Reparaciones.aspx">Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Usuarios.aspx">Usuarios</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Informes.aspx">Informes</a>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">
    <div class="bg-light text-center font-weight-bold ">
        <h3>USUARIOS</h3>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex p-2 bd-highlight">

        <asp:Button ID="btnMostrarClientes" CssClass="btn btn-outline-success btn-lg border-dark w-50" Text="Mostrar Clientes" runat="server" OnClick="btnMostrarClientes_Click" />
        <asp:Button ID="btnMostrarEmpleados" CssClass="btn btn-outline-success btn-lg border-dark w-50" Text="Mostrar Empleados" runat="server" />
    </div>
    <div class=" overflow-auto">

        <asp:GridView ID="gvUsuarios" CssClass="text-center" runat="server" AllowPaging="false"></asp:GridView>
    </div>

</asp:Content>
