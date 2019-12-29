<%@ Page Language="VB" MasterPageFile="~/Site.Master" EnableEventValidation="false"  AutoEventWireup="false" CodeFile="frm_prohibidos.aspx.vb" Inherits="frm_prohibidos" Title="YouSoft" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts>
			<%--Needed for JavaScript IntelliSense in VS2010--%>
			<%--For VS2008 replace RadScriptManager with ScriptManager--%>
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
		</Scripts>
	</telerik:RadScriptManager>
	<script type="text/javascript">
	    //Put your JavaScript code here.
    </script>
	<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
	</telerik:RadAjaxManager>

    <h2>
   
    </h2>
    <div>
        Buscar Rut :
        <asp:TextBox ID="numero" runat="server" Font-Size="Medium" Width="100px"></asp:TextBox>
        Nombre :
        <asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium" Width="120px"></asp:TextBox>
        Apellido :
        <asp:TextBox ID="TextBox6" runat="server" Font-Size="Medium" Width="120px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Font-Size="Small" Text="Buscar" 
            CssClass="btn btn-warning" Font-Bold="True" />
  <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" style="float:right;">Agregar Bolqueo</button>
       
     <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ingrese datos para Bloqueo</h4>
        </div>
        <div class="modal-body">
          <p>
          Rut:<asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox> 
          Nombre:<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox> 
          Apellido:<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox> 
          Motivo:<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox> 
           </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-success" />
        </div>
      </div>
      
    </div>
  </div>
    </div>

    <br />

     <div class="clear hideSkiplink">
        <center><asp:Label ID="Label1" runat="server" Text="Registro Prohibidos" Font-Bold="True" 
             Font-Size="Large" ForeColor="White"></asp:Label></center>
    </div>
    <asp:GridView ID="GridView1" runat="server" Width="100%" 
        CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="15">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Editar" 
               ControlStyle-CssClass="btn btn-warning" ShowSelectButton="True" />
        </Columns>
        <HeaderStyle BackColor="#3A4F63" ForeColor="White" />
    </asp:GridView>

    <center><asp:Button ID="Button3" runat="server" Font-Size="Small" Text="Exportar a Excel" 
            CssClass="btn btn-warning" Font-Bold="True" /></center>
    <br />
    
</asp:Content>
