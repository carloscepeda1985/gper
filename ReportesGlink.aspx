<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="ReportesGlink.aspx.vb" Inherits="ReportesGper" Title="Glink" %>

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
	

<%--<style>
.bar
{
list-style-type:none;
height:38px;
background-image: -webkit-linear-gradient(top,#01203c  0,#01203c  0%);
background-image: linear-gradient(to bottom,#01203c  0,#01203c  0%);
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
  background-color: #0559a2;
  border-color: #0559a2;
}


.btn-sample:focus,
.btn-sample:active,
.btn-sample.active,
.open .dropdown-toggle.btn-sample {
  color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}

 .btn-info {
 color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}


.btn-info:focus,
.btn-info:active,
.btn-info.active,
.open .dropdown-toggle.btn-info {
  color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}



 .btn-primary {
 color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}


.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open .dropdown-toggle.btn-primary {
  color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}



 .btn-warning {
 color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}


.btn-warning:focus,
.btn-warning:active,
.btn-warning.active,
.open .dropdown-toggle.btn-warning {
  color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}



 .btn-danger {
 color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}


.btn-danger:focus,
.btn-danger:active,
.btn-danger.active,
.open .dropdown-toggle.btn-danger {
  color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}


 .btn-success {
 color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
}


.btn-success:focus,
.btn-successr:active,
.btn-success.active,
.open .dropdown-toggle.btn-success {
  color: #FFFFFF;
  background-color: #0559a2;
  border-color: #0559a2;
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
  background-color: #f4841a;
  border-color: #f4841a;
}

.btn-sample .badge {
 color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
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
     
     .glyphicon2 {
    position: relative;
    top: 6px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: 400;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

 </style>
<style>
    a:hover {
        background-color: #286090 !important;
        cursor: pointer;
    }
</style>--%>
<style>
    a:hover {
        background-color: #286090 !important;
        cursor: pointer;
    }
    .glyphicon2 {
        position: relative;
        top: 6px;
        display: inline-block;
        font-family: 'Glyphicons Halflings';
        font-style: normal;
        font-weight: 400;
        line-height: 1;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }
    e.letracolor {
        padding-left: 20px;
        color: #fff;
    }
    .bar {
        list-style-type: none;
        height: 38px;
        background-image: -webkit-linear-gradient(top,#01203c 0,#01203c 0%);
        background-image: linear-gradient(to bottom,#01203c 0,#01203c 0%);
        font-size: 40px;
        font: 26px Tahoma, Verdana, Arial, sans-serif;
        border-radius: 4px;
        margin-bottom: 11px;
    }

</style>


    <div class="col-md-9">
    <div class="bar">

    <e class="letracolor"><span class="glyphicon2 glyphicon-dashboard" style="color:white"></span>&nbsp;Reportes</e>
    
    </div>


     <div class="widget-box transparent">
			<div class="widget-header widget-header-small">
				<h4 class="widget-title smaller">
					<i class="ace-icon fa fa-check-square-o bigger-110"></i>
					Últimos Checklists 
					</h4>
			</div>

						
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" Width="100%" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="6" >
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" 
                    SelectImageUrl="~/editar.png" ControlStyle-CssClass="btn btn-primary" SelectText="Ver"  HeaderText='<span class="glyphicon glyphicon-eye-open" style="color:white"></span>' />
            </Columns>
            <HeaderStyle BackColor="#a9a2a6" ForeColor="White" />
        </asp:GridView>
    </div>

	</div>


     <div class="widget-box transparent">
			<div class="widget-header widget-header-small">
				<h4 class="widget-title smaller">
					<i class="ace-icon fa fa-check-square-o bigger-110"></i>
					Accesos del día
					</h4>
			</div>

						
    <div class="table-responsive">
        <asp:GridView ID="GridView2" runat="server" Width="100%" 
            CssClass="table table-bordered bs-table"  AllowPaging="True" PageSize="6" >
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" 
                    SelectImageUrl="~/editar.png" ControlStyle-CssClass="btn btn-primary" SelectText="Ver"  HeaderText='<span class="glyphicon glyphicon-eye-open" style="color:white"></span>' />
            </Columns>
            <HeaderStyle BackColor="#a9a2a6" ForeColor="White" />
        </asp:GridView>
    </div>

	</div>









   </div>

    <div class="col-md-3">


     <ul class="nav nav-pills nav-stacked" background="#E9801E">

                   <li><a href="AdmGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-home" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Menú Principal</span></a></li>
                   <li><a href="SolicitudesGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-log-in" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Solicitudes</span></a></li>
                   <li><a href="TiendasGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-shopping-cart" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Tiendas</span></a></li>
                   <li><a href="ContratistasGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-hand-right" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Contratistas</span></a></li>
                    <li><a href="EquiposGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-scale" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Equipos</span></a></li>
                   <li><a href="ReportesGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-dashboard" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Reportes</span></a></li>
               </ul>
				   
    </div>

</asp:Content>