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

    <div >&nbsp&nbsp<h4>Filtros:</h4></div>
    <div>
        <div class="d-flex p-2 bd-highlight" >
        &nbsp&nbsp Hardware:&nbsp<asp:DropDownList id="ddlActivos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlActivos_SelectedIndexChanged">
            
            <asp:ListItem Text="Habilitados" />
            <asp:ListItem Text="Deshabilitados" />
        </asp:DropDownList>
       &nbsp&nbsp Categorias:&nbsp<asp:DropDownList id="ddlCategoria" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged">
       
       </asp:DropDownList>
        
        </div>
    
    
    </div>


    <div style="height:10px">&nbsp</div>
    <div>
        <asp:Button CssClass="btn btn-outline-success w-100" ID="btnAgregarHarware" Text="Agregar Hardware" runat="server" OnClick="btnAgregarHarware_Click" />
    </div>
     <div style="height:10px">&nbsp</div>
    <div class="card-columns" style="margin-left: 10px; margin-right: 10px;">
        <% foreach (var item in ListaHardware)

            {  %>
        <div class="card">
            <div class="card-body" style="width: 300px; height: 300px">
                <div class="card-header text-center bg-white ">ID Hardware: <% = item.Id_hardware %></div>
                <img src="<% = item.Imagen %>" class="card-img-top" alt="..." style="width: 200px;">
                <div class="card-tite  w-100"><% = item.Nombre %></div>
            </div>
          
            <a class="btn btn-outline-warning w-100" href="Empleados_AMProductos.aspx?idhw=<% = item.Id_hardware.ToString() %>">Modificar / Eliminar</a>

        </div>
        <% } %>
    </div>


</asp:Content>
