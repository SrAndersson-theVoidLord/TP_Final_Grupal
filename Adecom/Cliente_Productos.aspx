<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente_Productos.aspx.cs" Inherits="Adecom.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style3 {
            width: 546px;
        }
        .auto-style4 {
            width: 348px;
        }
        .auto-style1 {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style4">
                <asp:ListView ID="lvProductos" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" GroupItemCount="3">
                    
                  
                <%--    <AlternatingItemTemplate>
                        <td runat="server" style="background-color:#FFF8DC;">Nombre_HAR:
                            <asp:Label ID="Nombre_HARLabel" runat="server" Text='<%# Eval("Nombre_HAR") %>' />
                            <br />
                            Imagen_HAR:
                            <asp:Label ID="Imagen_HARLabel" runat="server" Text='<%# Eval("Imagen_HAR") %>' />
                            <br />
                            Precio_HAR:
                            <asp:Label ID="Precio_HARLabel" runat="server" Text='<%# Eval("Precio_HAR") %>' />
                            <br />
                        </td>
                    </AlternatingItemTemplate>--%>
                    <EditItemTemplate>
                        <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">Nombre_HAR:
                            <asp:TextBox ID="Nombre_HARTextBox" runat="server" Text='<%# Bind("Nombre_HAR") %>' />
                            <br />
                            Imagen_HAR:
                            <asp:TextBox ID="Imagen_HARTextBox" runat="server" Text='<%# Bind("Imagen_HAR") %>' />
                            <br />
                            Precio_HAR:
                            <asp:TextBox ID="Precio_HARTextBox" runat="server" Text='<%# Bind("Precio_HAR") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                            <br />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No se han devuelto datos.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">Nombre_HAR:
                            <asp:TextBox ID="Nombre_HARTextBox" runat="server" Text='<%# Bind("Nombre_HAR") %>' />
                            <br />
                            Imagen_HAR:
                            <asp:TextBox ID="Imagen_HARTextBox" runat="server" Text='<%# Bind("Imagen_HAR") %>' />
                            <br />
                            Precio_HAR:
                            <asp:TextBox ID="Precio_HARTextBox" runat="server" Text='<%# Bind("Precio_HAR") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            <br />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;">Nombre:
                            <asp:Label ID="Nombre_HARLabel" runat="server" Text='<%# Eval("Nombre_HAR") %>' />
                            <br />
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("Imagen_HAR") %>' />
                            <br />
                            Precio:$
                            <asp:Label ID="Precio_HARLabel" runat="server" Text='<%# Eval("Precio_HAR") %>' />
                            <br />
                            <asp:Button ID="btnAniadir" runat="server" Text="añadir al carrito" />
                            <br />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">Nombre_HAR:
                            <asp:Label ID="Nombre_HARLabel" runat="server" Text='<%# Eval("Nombre_HAR") %>' />
                            <br />
                            Imagen_HAR:
                            <asp:Label ID="Imagen_HARLabel" runat="server" Text='<%# Eval("Imagen_HAR") %>' />
                            <br />
                            Precio_HAR:
                            <asp:Label ID="Precio_HARLabel" runat="server" Text='<%# Eval("Precio_HAR") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style4">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdecomConnectionString2 %>" SelectCommand="SELECT [Nombre_HAR], [Imagen_HAR], [Precio_HAR] FROM [Hardware]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
