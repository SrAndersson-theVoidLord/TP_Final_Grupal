<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente_contactos.aspx.cs" Inherits="Adecom.Cliente_contactos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="Contenido_menu_contextual" runat="server">

    <div class="d-flex flex-column p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Productos.aspx">Productos</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_armados_a_pedido.aspx">Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Reparaciones.aspx">Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Contactos.aspx">Contacto</a>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">

    <div class="bg-light text-center font-weight-bold">
        <h3>Contactos</h3>

    </div>
    Mail: <a href="mailto:adecom@gmail.com">adecom@gmail.com</a><br />
    Telefono: 4795-7230<br />
    WhatsApp:15-6234-8976<br />
    Instagram: @Adecom<br />
    Facebook:<a href="https://es-la.facebook.com/adecomdevillaadelina/">https://es-la.facebook.com/adecomdevillaadelina/</a><br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
