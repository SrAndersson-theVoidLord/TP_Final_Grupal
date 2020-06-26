<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente_armados_a_pedido.aspx.cs" Inherits="Adecom.armados_a_pedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: left;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 345px;
        }
        .auto-style6 {
            width: 1011px;
        }
    </style>
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
        <h3>Armados a Pedido</h3>

    </div>
    <br />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="auto-style4">
        <tr>
            <td class="auto-style5">Disco:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre_HAR" DataValueField="Id_Hardware_HAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString %>" SelectCommand="SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = 'DISO') OR ([Categoria_HAR] = 'DIRI')">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Procesador:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre_HAR" DataValueField="Id_Hardware_HAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString %>" SelectCommand="SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = @Categoria_HAR)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="PROC" Name="Categoria_HAR" SessionField="Procesador" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Motheboard:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre_HAR" DataValueField="Id_Hardware_HAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString %>" SelectCommand="SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = @Categoria_HAR)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="PLMA" Name="Categoria_HAR" SessionField="Placa madre" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Placa de Video:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="Nombre_HAR" DataValueField="Id_Hardware_HAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString %>" SelectCommand="SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = @Categoria_HAR)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="PLVI" Name="Categoria_HAR" SessionField="Placa de video" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Memoria Ram:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="Nombre_HAR" DataValueField="Id_Hardware_HAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString %>" SelectCommand="SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = @Categoria_HAR)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="MRAM" Name="Categoria_HAR" SessionField="Memoria RAM" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Fuente:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource6" DataTextField="Nombre_HAR" DataValueField="Id_Hardware_HAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString %>" SelectCommand="SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = @Categoria_HAR)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="FUEN" Name="Categoria_HAR" SessionField="Fuente" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Gabinete:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource7" DataTextField="Nombre_HAR" DataValueField="Id_Hardware_HAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString %>" SelectCommand="SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = @Categoria_HAR)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="GABI" Name="Categoria_HAR" SessionField="Gabinete" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Sistema Operativo:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource8" DataTextField="Nombre_HAR" DataValueField="Id_Hardware_HAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString %>" SelectCommand="SELECT [Id_Hardware_HAR], [Nombre_HAR] FROM [Hardware] WHERE ([Categoria_HAR] = @Categoria_HAR)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="SOFT" Name="Categoria_HAR" SessionField="Software" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <p class="auto-style2">
        <asp:Button ID="btnRealizarpedido" runat="server" OnClick="Button1_Click" Text="Realizar pedido" />
    </p>
</asp:Content>
