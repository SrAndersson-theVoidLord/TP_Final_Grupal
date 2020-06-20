<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados_Productos.aspx.cs" Inherits="Adecom.Empleados_Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido_menu_contextual" runat="server">
    <div class="d-flex flex-column p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark " href="/Empleados_Productos.aspx">Hardware</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_armados_a_pedido.aspx">Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Reparaciones.aspx">Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Usuarios.aspx">Usuarios</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Informes.aspx">Informes</a>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">
    <div class="bg-light text-center font-weight-bold">
        <h3>Listado Hardware</h3>

    </div>
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
        <asp:Button CssClass="btn btn-outline-success w-100" ID="btnAgregarHarware" Text="Agregar Hardware" runat="server" />
    </div>
    <div class="card-columns" style="margin-left: 10px; margin-right: 10px;">
        <% foreach (var item in ListaHardware)

            { %>
        <div class="card">
            <div class="card-body" style="width: 300px; height: 300px">
                <div class="card-header text-center bg-white ">ID Hardware: <% = item.Id_hardware %></div>
                <img src="<% = item.Imagen %>" class="card-img-top" alt="..." style="width: 200px;">
                <div class="card-tite  w-100"><% = item.Nombre %></div>
            </div>
            <asp:Button CssClass="btn btn-outline-warning w-100" ID="btnModificarHarware" Text="Modificar" runat="server" />
            <asp:Button CssClass="btn btn-outline-danger w-100" ID="btnEliminarHarware" Text="Eliminar" runat="server" />
        </div>
        <% } %>
    </div>


</asp:Content>
