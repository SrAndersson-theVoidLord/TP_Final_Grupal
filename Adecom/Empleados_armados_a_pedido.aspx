<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados_armados_a_pedido.aspx.cs" Inherits="Adecom.Empleados_armados_a_pedido" %>

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
    <div class="bg-light text-center font-weight-bold ">
        <h3>ARMADOS A PEDIDO</h3>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Id actividad">
                    <ItemTemplate>
                        <asp:Label ID="lab_id_actividad" runat="server" Text='<%# Bind("Id_Actividad_A") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id cliente">
                    <ItemTemplate>
                        <asp:Label ID="lab_id_cliente" runat="server" Text='<%# Bind("Id_Cliente_A") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id empleado">
                    <ItemTemplate>
                        <asp:Label ID="lab_id_empleado" runat="server" Text='<%# Bind("Id_Empleado_A") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio total">
                    <ItemTemplate>
                        <asp:Label ID="lab_precio_total" runat="server" Text='<%# Bind("Subtotal_A") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha">
                    <ItemTemplate>
                        <asp:Label ID="lab_fecha" runat="server" Text='<%# Bind("Fecha_A") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <p>
    </p>
</asp:Content>
