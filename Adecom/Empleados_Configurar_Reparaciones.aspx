<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados_Configurar_Reparaciones.aspx.cs" Inherits="Adecom.Empleados_Configurar_Reparaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 265px;
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
        <h3>Configurar reparacion</h3>

    </div>
    <br />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <p class="auto-style2">
        &nbsp;&nbsp;Cliente:
        <asp:Label ID="Iad_Cliente" runat="server"></asp:Label>
    </p>
    <p class="auto-style2">
        Descripcion:
        <asp:Label ID="lab_Descripcion" runat="server"></asp:Label>
    </p>
    <p class="auto-style2">
        Tipo de trabajo:</p>
    <p class="auto-style2">
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="Descripcion_TDP" DataValueField="Id_Tipo_TDP">
        </asp:DropDownList>
    </p>
    <p class="auto-style2">
        Horas trabajadas:</p>
    <p class="auto-style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table class="auto-style3">
            <tr>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="reb_Horas" runat="server" ControlToValidate="TextBox2" ValidationExpression="^\d+" ValidationGroup="Grup_1">Solo se pueden ingresar numeros.*</asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ValidationGroup="Grup_1">Ingrese las horas trabajadas.*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
&nbsp;
    </p>
    <p class="auto-style2">
        Ingresa una descripcion:</p>
    <p class="auto-style2">
        <table class="auto-style3">
            <tr>
                <td class="auto-style4">
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ValidationGroup="Grup_1">Ingrese la descripcion del presupuesto.*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </p>
    <p class="auto-style2">
        <asp:Button ID="but_Aceptar" runat="server" Text="Aceptar" OnClick="but_Aceptar_Click" ValidationGroup="Grup_1" />
    </p>
    <p class="auto-style2">
        &nbsp;</p>
</asp:Content>
