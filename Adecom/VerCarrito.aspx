﻿<%@ Page Title="Productos Seleccionados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerCarrito.aspx.cs" Inherits="Adecom.VerCarrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido_menu_contextual" runat="server">
     <div class="d-flex flex-column p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Productos.aspx" >Productos</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_armados_a_pedido.aspx" >Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Reparaciones.aspx" >Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Contactos.aspx" >Contacto</a>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">
        <div class="bg-light text-center font-weight-bold ">
        <h3>Productos Seleccionados</h3>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
            



    <asp:GridView ID="GridView_Carrito" runat="server">
    </asp:GridView>

    
            



    <asp:Label ID="Total" runat="server"></asp:Label>

    
            



    <br />
    <asp:Label ID="lab_mensaje" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btnConfirmar" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar compra" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnBorrar" runat="server" OnClick="btnBorrar_Click" Text="Borrar carrito" />

    
            



</asp:Content>
