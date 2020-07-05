<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados_Informes.aspx.cs" Inherits="Adecom.Empleados_Informes" %>

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
    <div class="bg-light text-center font-weight-bold">
        <h3>INFORMES</h3>

    </div>


    <div class="d-flex p-2 bd-highlight">
        <h2>Facturacion por Fechas</h2>
    </div>
    <div>
        Fecha desde :  
        <asp:TextBox id="tbfechadesde"  type="date" runat="server" />
        &nbsp<asp:RequiredFieldValidator id="rfvtbfechadesde" text="Debe ingresar una fecha!" ControlToValidate="tbfechadesde" ForeColor="Red" runat="server" />
    </div>
    <div>
        Fecha Hasta :  
        <asp:TextBox id="tbfechahasta"  type="date" runat="server" />
    &nbsp<asp:RequiredFieldValidator id="rfvfechahasta" text="Debe ingresar una fecha!" ControlToValidate="tbfechahasta" ForeColor="Red" runat="server" />
      <br />&nbsp  <asp:CompareValidator  ControlToValidate="tbfechahasta" runat="server" ID="cvfechas" ControlToCompare="tbfechadesde" ForeColor="Red" Text="La fecha ingresada debe ser mayor o igual a la fecha desde!!" Type="Date" Operator="GreaterThanEqual" />
    </div>
    <div>
          
        <asp:Button id="btnBuscar" Text="Buscar" runat="server" OnClick="btnBuscar_Click" />
    </div>

   


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:GridView id="gvInformeVentas"  runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" HorizontalAlign="Center" OnSelectedIndexChanging="gvInformeVentas_SelectedIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="Fecha"> 
                    <ItemTemplate >
                        <asp:Label id="lbl_fecha" Text='<%# Bind("Venta.Fecha") %>' runat="server" />
                    </ItemTemplate>  
               </asp:TemplateField>            
               <asp:TemplateField HeaderText="ID Venta"> 
                    <ItemTemplate >
                        <asp:Label id="lbl_idventa" Text='<%# Bind("Venta.Id_venta") %>' runat="server" />
                </ItemTemplate>  
                </asp:TemplateField>     
               <asp:TemplateField HeaderText="DNI"> 
                    <ItemTemplate >
                        <asp:Label id="lbl_dni" Text='<%# Bind("Usuario.Dni") %>' runat="server" />
                </ItemTemplate>  
                </asp:TemplateField>     
               
                
                
                <asp:TemplateField HeaderText="Nombre"> 
                 <ItemTemplate >
                        <asp:Label id="lbl_nombre" Text='<%# Bind("Usuario.Nombre") %>' runat="server" />
                </ItemTemplate>  
                </asp:TemplateField>
               <asp:TemplateField HeaderText="Apellido"> 
                    <ItemTemplate >
                        <asp:Label id="lbl_Apellido" Text='<%# Bind("Usuario.Apellido") %>' runat="server" />
                </ItemTemplate>  
                </asp:TemplateField>    

               <asp:TemplateField HeaderText="Total"> 
                    <ItemTemplate >
                        <asp:Label id="lbl_Total" Text='<%# Bind("Venta.Total") %>' runat="server" />
                </ItemTemplate>  
                </asp:TemplateField>    


            </Columns>
            <SelectedRowStyle BackColor="#CCFFCC" />
     </asp:GridView>
    <div style="height:10px">&nbsp</div>
     <div >Detalle de Factura Seleccionada :</div>
    <div>
        <asp:GridView id="gvDetalleVentas"  runat="server" HorizontalAlign="Center"> </asp:GridView>

    </div>

</asp:Content>
