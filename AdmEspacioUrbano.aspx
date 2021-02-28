<%@ Page Language="VB" MasterPageFile="~/MasterEspacioUrbano.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="AdmEspacioUrbano.aspx.vb" Inherits="AdmGper" Title="Glink" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
	<script type="text/javascript">
	    //Put your JavaScript code here.
    </script>
	

<style>

body
{
    font-family: 'Helvetica', 'Arial', sans-serif;
    color: #444444;
    font-size: 9pt;
    background-color: #FAFAFA;
}
.bar
{
list-style-type:none;
height:38px;
background-image: -webkit-linear-gradient(top,#009456 0,#009456 0%);
background-image: linear-gradient(to bottom,#009456 0,#009456 0%);
font-size:40px;
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
  background-color: #f4841a;
  border-color: #f4841a;
}


.btn-info:focus,
.btn-info:active,
.btn-info.active {
  color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
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
  background-color: #009456;
  border-color: #009456;
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
  background-color: #fb7c0d;
  border-color: #fb7c0d;
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
  background-color: #009456;
  border-color: #009456;
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

   <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="media">
                <ul class="nav nav-pills nav-stacked" background="#E9801E">

                    <li><a href="SolicitudesEspacioUrbano.aspx" class="btn btn-danger btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-log-in" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Solicitudes</span></a></li>
                   <li><a href="TiendasEspacioUrbano.aspx" class="btn btn-danger btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-shopping-cart" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Tiendas</span></a></li>
                   <li><a href="ContratistasEspacioUrbano.aspx" class="btn btn-danger btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-hand-right" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Contratistas</span></a></li>
                   <li><a href="ReportesEspacioUrbano.aspx" class="btn btn-danger btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-dashboard" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Reportes</span></a></li>  
                </ul>               
              </div>
              <hr/>
            </div>
            <div class="col-md-4">
              <div class="well" style="background-color: #a9a2a6;">
                    <font color="white";><center><h4>Tu Perfil</h4></center>
                    <div class="input-group">
                    <h5>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span> &nbsp    Nombres:   <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>  &nbsp   Apellidos :   <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-envelope"></span> &nbsp    Email    :   <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-earphone"></span> &nbsp    Teléfono    :   <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-home"></span> &nbsp    Cargo   :   <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-home"></span>  &nbsp   Depto.   :   <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></h5>
                       <br/>
                    </font>
               </div>
                      <center><asp:Button ID="Button3" runat="server" Text="Editar Cuenta" CssClass="btn btn-danger" width="80%" /></center>
             </div>
           </div>
         </div>
  
</asp:Content>
