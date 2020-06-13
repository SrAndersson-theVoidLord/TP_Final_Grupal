<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente_Reparaciones.aspx.cs" Inherits="Adecom.Cliente_Reparaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: x-large;
        }
        .auto-style2 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style1">
        <strong>Reparaciones</strong></p>
    <p class="auto-style2">
        Realize una brebe descripcion de su problema:</p>
    <p class="auto-style2">
        <asp:TextBox ID="txtProblema" runat="server" Height="152px" Width="725px"></asp:TextBox>
    </p>
    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style2">
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar Formulario" />
    </p>
</asp:Content>
