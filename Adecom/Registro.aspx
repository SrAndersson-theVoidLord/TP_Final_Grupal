<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Adecom.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ContentPlaceHolderID="Contenido_menu_contextual" runat="server">
      <% if(usuarioregistrado() == "Empleado")
        {%>
        <div class="d-flex flex-column p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Productos.aspx">Hardware</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_armados_a_pedido.aspx">Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Reparaciones.aspx">Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Usuarios.aspx">Usuarios</a>
        <a class="btn btn-outline-secondary btn-lg border-dark" href="/Empleados_Informes.aspx">Informes</a>

    </div>

        <%}
        else
        {%>
        <div class="d-flex flex-column p-2 bd-highlight">
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Productos.aspx" >Productos</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_armados_a_pedido.aspx" >Armados a Pedido</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Reparaciones.aspx" >Reparaciones</a>
        <a class="btn btn-outline-secondary btn-lg border-dark w-100" href="/Cliente_Contactos.aspx" >Contacto</a>
        </div>


       <% } %> 
        

    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Contenido_menu_principal" runat="server">
        <div class="bg-light text-center font-weight-bold " >
        <h3>Registro de Usuarios</h3>
            <br />
            <asp:Label id="lblAltaUsuario" Text="" runat="server"  />
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    



    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Ingresar Usuario</label>
        <asp:TextBox ID="tbUsuarioRegistro" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="tbUsuarioRegistro" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Ingresar Constraseña</label>
        <asp:TextBox ID="tbContraseñaRegistro" CssClass="form-control" Width="80%" runat="server" TextMode="Password" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="tbContraseñaRegistro" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Repetir Contraseña</label>
        <asp:TextBox ID="tbRepetirContraseña" CssClass="form-control" Width="80%" runat="server" TextMode="Password" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvRepetirContraseña" runat="server" ControlToValidate="tbRepetirContraseña" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        <br />
        <asp:CompareValidator ID="cvRepetirContraseña" runat="server" ControlToCompare="tbContraseñaRegistro" ControlToValidate="tbRepetirContraseña" ErrorMessage="* Las contraseñas no son iguales" ForeColor="Red" ValidationGroup="Grupo1"></asp:CompareValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Nombre</label>
        <asp:TextBox ID="tbNombre" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="tbNombre" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Apellido</label>
        <asp:TextBox ID="tbApellido" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="tbApellido" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">DNI</label>
        <asp:TextBox ID="tbDni" CssClass="form-control" Width="80%" runat="server" AutoPostBack="True" OnTextChanged="tbDni_TextChanged" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        
        <br />
        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="tbDni" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="tbDni" ErrorMessage="* El campo debe ser valido" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="Grupo1"></asp:RegularExpressionValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Localidad</label>
        <asp:TextBox ID="tbLocalidad" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="tbLocalidad" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Direccion</label>
        <asp:TextBox ID="tbDireccion" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="tbDireccion" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>


    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Codigo Postal</label>
        <asp:TextBox ID="tbCP" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvCP" runat="server" ControlToValidate="tbCP" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="revCP" runat="server" ControlToValidate="tbCP" ErrorMessage="* El campo debe ser valido" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="Grupo1"></asp:RegularExpressionValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Telefono</label>
        <asp:TextBox ID="tbTelefono" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="tbTelefono" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="tbTelefono" ErrorMessage="* El campo debe ser valido" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="Grupo1"></asp:RegularExpressionValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp</div>

    <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <label class="col-form-label">Email</label>
        <asp:TextBox ID="tbEmail" CssClass="form-control" Width="80%" runat="server" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp<br />
        <br />
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="* El campo no puede estar vacío" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="* El campo debe ser valido" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Grupo1"></asp:RegularExpressionValidator>
    </div>
    <div style="height: 20px; width: 100%; float: left">&nbsp
        
    </div>

        <div style="height: 70px; width: 10%; float: left">&nbsp</div>
    <div style="height: 70px; width: 60%; float: left">
        <asp:Button ID="btnRegistrarseRegistro" Text="Registrarse" CssClass="btn btn-danger" runat="server" Width="80%"  OnClick="btnRegistrarseRegistro_Click" ValidationGroup="Grupo1" />
    </div>
    <div style="height: 70px; width: 30%; float: left">&nbsp</div>


</asp:Content>
