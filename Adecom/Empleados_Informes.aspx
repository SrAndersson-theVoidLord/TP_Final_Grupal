<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados_Informes.aspx.cs" Inherits="Adecom.Empleados_Informes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido_menu_contextual" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">
         <div class="d-flex p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark w-25" href="#" >Productos mas Vendidos</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-25" href="#" >Facturacion por Fechas</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-25" href="#" >Productividad Empleados</a>
        
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
