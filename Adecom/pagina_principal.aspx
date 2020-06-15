<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pagina_principal.aspx.cs" Inherits="Adecom.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 80px;
        }
    </style>
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
            <div class="bg-light text-center font-weight-bold " >
        <h3></h3>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="card bg-light mb-3" >
  <div class="card-header">ADECOM</div>
  <div class="card-body">
  
    <p class="card-text">
            Somos una empresa dedicada a la comercialización de productos y servicios de informática que desde hace 18 años comercializa sus productos a través de nuestro website asi como también a través de renombrados portales de E-Commerce.
            Nuestro objetivo es brindar un servicio de excelencia con los mejores precios del mercado, atendiendo a nuestros clientes de manera personalizada, asistiendolos y asesorandolos durante el proceso de compra y brindándoles un excelente servicio de post-venta.

    </p>
  </div>
</div>


</asp:Content>
