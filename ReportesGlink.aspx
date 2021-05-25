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
    <%--  --%>

    <div class="col-md-9">

    <div class="bar">

    <e class="letracolor"><span class="glyphicon2 glyphicon-dashboard" style="color:white"></span>&nbsp;Reportes</e>
    
    </div>
       
      <div class="table-responsive" style="border:none;" >
          <div   style="min-width:490px;">

<ul class="nav nav-tabs">
 <li role="presentation" class="active"><a href="ReportesGlink.aspx"><b>Trabajos Autorizados</b></a></li>
  <li role="presentation"><a href="ReportesTraAutGlink.aspx">Trabajadores Autorizados</a></li>
   <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
      Buscar <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
    <li><a href="#">Tiendas</a></li>
    <li><a href="#">Contratistas</a></li>
    <li><a href="#">Trabajadores de Tiendas</a></li>
    <li><a href="#">Trabajadores de Contratistas</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Accesos Trabajadores</a></li>
    </ul>
  </li>
</ul>


        <br />		

         Desde:&nbsp<telerik:RadDatePicker ID="RadDatePicker2" runat="server" Skin="Metro" Font-Size="Large" DateInput-DateFormat="MM-dd-yyyy"></telerik:RadDatePicker>
         Hasta:&nbsp<telerik:RadDatePicker ID="RadDatePicker1" runat="server" Skin="Metro" Font-Size="Large" DateInput-DateFormat="MM-dd-yyyy"></telerik:RadDatePicker>
        
              <asp:Button ID="Button2" runat="server" Font-Size="Small" Text="Buscar" 
            CssClass="btn btn-primary" />

        <br />
        <br />

        <div class="alert alert-info" role="alert" id="Div1" runat="server">
            <center>
		<strong>Atención : </strong>No se encontraron solicitudes aprobadas para las fechas seleccionadas<br />
               </center>
        </div>	

<asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="10">
            <Columns>

            <asp:BoundField DataField="N_Solicitud" HeaderText="N° Solicitud" ItemStyle-Width="150" ItemStyle-Wrap="false" >
                <HeaderStyle Wrap="False" />
<ItemStyle Wrap="False" Width="150px"></ItemStyle>
                </asp:BoundField>
            <asp:BoundField DataField="Empresa" HeaderText="Empresa" ItemStyle-Width="130" ItemStyle-Wrap="false" >
<ItemStyle Wrap="False" Width="130px"></ItemStyle>
                </asp:BoundField>
            <asp:BoundField DataField="Resumen" HeaderText="Resumen" ItemStyle-Width="150" ItemStyle-Wrap="false" >
<ItemStyle Wrap="False" Width="150px"></ItemStyle>
                </asp:BoundField>
            <asp:BoundField DataField="Lugar" HeaderText="Lugar" ItemStyle-Width="150" ItemStyle-Wrap="false" >
<ItemStyle Wrap="False" Width="150px"></ItemStyle>
                </asp:BoundField>
            <asp:BoundField DataField="Fecha Inicio" HeaderText="Fecha" ItemStyle-Width="150" ItemStyle-Wrap="false" >
<ItemStyle Wrap="False" Width="150px"></ItemStyle>
                </asp:BoundField>
            <asp:BoundField DataField="Hora Entrada" HeaderText="Hora" ItemStyle-Width="150" ItemStyle-Wrap="false" >
<ItemStyle Wrap="False" Width="150px"></ItemStyle>
                </asp:BoundField>
            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" ItemStyle-Width="150" ItemStyle-Wrap="false" >
<ItemStyle Wrap="False" Width="150px"></ItemStyle>
                </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="150" ItemStyle-Wrap="false" >     

<ItemStyle Wrap="False" Width="150px"></ItemStyle>
                </asp:BoundField>

    </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
                    <asp:Button ID="Button3" runat="server" Font-Size="Small" Text="Exportar a PDF" 
            CssClass="btn btn-warning" />
        <hr />
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