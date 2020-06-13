<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente_armados_a_pedido.aspx.cs" Inherits="Adecom.armados_a_pedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: center;
            font-size: x-large;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style3">
        <strong>Armados a pedido</strong></p>
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">Tipo:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Procesador:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Motheboard:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList3" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Placa de Video:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList4" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Memoria Ram:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList5" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Fuente:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList6" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Sistema Operativo:</td>
            <td class="auto-style6">
                <asp:CheckBox ID="chkWindows" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Windows" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="chkLinux" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Linux" />
            </td>
        </tr>
    </table>
    <p class="auto-style2">
        <asp:Button ID="btnRealizarpedido" runat="server" OnClick="Button1_Click" Text="Realizar pedido" />
    </p>
</asp:Content>
