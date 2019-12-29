<%@ Page Language="VB" MasterPageFile="~/Site_residente.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="frm_entregaretiro.aspx.vb" Inherits="frm_entregaretiro" Title="YouSoft" %>

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

<style>
.bar
{
list-style-type:none;
height:38px;
background-image: -webkit-linear-gradient(top,#a02c15 0,#a02c15 0%);
background-image: linear-gradient(to bottom,#a02c15 0,#a02c15 0%);
font-size:40px;
font: 26px Tahoma, Verdana, Arial, sans-serif;
border-radius:4px;
margin-bottom:11px;
}
e.letracolor{
padding-left:20px;
color: #fff;

}

</style>

<style type="text/css">
    .btn-sample {
 color: #FFFFFF;
  background-color: #123740;
  border-color: #123740;
}


.btn-sample:focus,
.btn-sample:active,
.btn-sample.active,
.open .dropdown-toggle.btn-sample {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #123740;
}

 .btn-info {
 color: #FFFFFF;
  background-color: #2c777a;
  border-color: #2c777a;
}


.btn-info:focus,
.btn-info:active,
.btn-info.active,
.open .dropdown-toggle.btn-info {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #2c777a;
}



 .btn-primary {
 color: #FFFFFF;
  background-color: #3ca3a0;
  border-color: #3ca3a0;
}


.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open .dropdown-toggle.btn-primary {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #3ca3a0;
}



 .btn-warning {
 color: #FFFFFF;
  background-color: #ff8029;
  border-color: #ff8029;
}


.btn-warning:focus,
.btn-warning:active,
.btn-warning.active,
.open .dropdown-toggle.btn-warning {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #ff8029;
}



 .btn-danger {
 color: #FFFFFF;
  background-color: #f94007;
  border-color: #f94007;
}


.btn-danger:focus,
.btn-danger:active,
.btn-danger.active,
.open .dropdown-toggle.btn-danger {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #f94007;
}




 .btn-success {
 color: #FFFFFF;
  background-color: #a02c15;
  border-color: #a02c15;
}


.btn-success:focus,
.btn-successr:active,
.btn-success.active,
.open .dropdown-toggle.btn-success {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #a02c15;
}



.btn-sample:active,
.btn-sample.active,
.open .dropdown-toggle.btn-sample {
  background-image: none;
}

.btn-sample.disabled,
.btn-sample[disabled],
fieldset[disabled] .btn-sample,

.btn-sample.disabled:focus,
.btn-sample[disabled]:focus,
fieldset[disabled] .btn-sample:focus,
.btn-sample.disabled:active,
.btn-sample[disabled]:active,
fieldset[disabled] .btn-sample:active,
.btn-sample.disabled.active,
.btn-sample[disabled].active,
fieldset[disabled] .btn-sample.active {
 color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #3BBFA5;
}

.btn-sample .badge {
 color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #3BBFA5;
}
     .nuevoEstilo1
     {
         color: #FFFFFF;
     }
     .nuevoEstilo2
     {
         color: #FFFFFF;
     }
     .nuevoEstilo3
     {
         color: #FFFFFF;
     }
     .nuevoEstilo4
     {
         color: #FFFFFF;
     }
     .nuevoEstilo5
     {
         color: #FFFFFF;
         font-weight: bold;
     }
     .nuevoEstilo6
     {
         color: #FFFFFF;
     }
     .nuevoEstilo7
     {
         color: #FFFFFF;
     }
     .nuevoEstilo8
     {
         color: #FFFFFF;
     }
 </style>

   <div class="col-md-9">
    <div class="bar"><e class="letracolor">Entrega y Retiro</e></div>
    <div container>
     <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" style="float:right;">Agregar Entrega o Retiro</button>
       
     <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ingrese datos de su Entrega o Retiro</h4>
        </div>
        <div class="modal-body">
          <p>
          Empresa: <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox><br>
          Tipo:<telerik:RadComboBox ID="RadComboBox1" runat="server" Skin="Metro" Font-Size="Large"></telerik:RadComboBox><br><br>
          Descripción:<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox><br>
          Desde:<br><telerik:RadDatePicker ID="RadDatePicker1" runat="server" Skin="Metro" Font-Size="Large"></telerik:RadDatePicker><br><br>
          Hasta:<br><telerik:RadDatePicker ID="RadDatePicker2" runat="server" Skin="Metro" Font-Size="Large"></telerik:RadDatePicker>
         </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-danger" />
        </div>
      </div>
      
    </div>
  </div>

    </div>
      
      <br />
<br />


    <div class="table-responsive">
   

        <asp:GridView ID="GridView1" runat="server" Width="100%" 
            CssClass="table table-bordered bs-table">

         <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" 
                    SelectImageUrl="~/editar.png" ControlStyle-CssClass="btn btn-success" SelectText="Editar" />
            </Columns>
            <HeaderStyle BackColor="#a02c15" ForeColor="White" />
        </asp:GridView>



 </div>


   </div>

    <div class="col-md-3">


     <ul class="nav nav-pills nav-stacked" background="#E9801E">

   <li><a href="frm_menuprincipal.aspx" class="btn btn-sample btn-lg btn-block"><span class="glyphicon glyphicon-home" style="color:white"></span>
         <strong><span class="nuevoEstilo2">&nbsp;</span></strong><span class="nuevoEstilo2">Menu 
         Principal</span></a></li>
                   <li><a href="frm_familia.aspx" class="btn btn-info btn-lg btn-block"><span class="glyphicon glyphicon-user" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Familiares</span></a></li>
                   <li><a href="frm_visitas.aspx" class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-eye-open" style="color:white"></span>&nbsp;<span 
                           class="nuevoEstilo4">Visitas</span></a></li>
                   <li><a href="frm_trabajadores.aspx" class="btn btn-warning btn-lg btn-block"><span class="glyphicon glyphicon-briefcase" style="color:white"></span>
                       <span class="nuevoEstilo6">&nbsp;Trabajadores</span></a></li>
                   <li><a href="frm_vehiculo.aspx" class="btn btn-danger btn-lg btn-block"><span class="glyphicon glyphicon-log-in" style="color:white"></span>
                       <span class="nuevoEstilo7">&nbsp;Vehiculos</span></a></li>
                   <li><a href="frm_entregaretiro.aspx" class="btn btn-success btn-lg btn-block"><span class="glyphicon glyphicon-gift" style="color:white"></span>&nbsp;<span 
                           class="nuevoEstilo8">Entrega y Retiros</span></a></li>

               </ul>
				   
    </div>
  
</asp:Content>

