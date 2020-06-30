<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados_Reparaciones.aspx.cs" Inherits="Adecom.Empleados_Reparaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido_menu_contextual" runat="server">
             <div class="d-flex flex-column p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark "  href="/Empleados_Productos.aspx" >Hardware</a>
        <a class="btn btn-outline-secondary btn-lg border-dark"  href="/Empleados_armados_a_pedido.aspx" >Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark"  href="/Empleados_Reparaciones.aspx" >Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark"  href="/Empleados_Usuarios.aspx" >Usuarios</a>
         <a class="btn btn-outline-secondary btn-lg border-dark"  href="/Empleados_Informes.aspx" >Informes</a>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">
        <div class="bg-light text-center font-weight-bold ">
        <h3>REPARACIONES</h3>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanging1">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="lab_id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cliente">
                    <ItemTemplate>
                        <asp:Label ID="lab_cliente" runat="server" Text='<%# Bind("Cliente") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripcion">
                    <ItemTemplate>
                        <asp:Label ID="lab_descripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    </p>
    <p class="auto-style1">
        &nbsp;</p>
</asp:Content>
