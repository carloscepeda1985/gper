﻿<%@ Page Language="VB" MasterPageFile="~/MasterAlc.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="HomeAlc.aspx.vb" Inherits="HomeAlc" Title="YouSoft" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    
	<script type="text/javascript">
	    //Put your JavaScript code here.
    </script>
	

<style>
.bar
{
list-style-type:none;
height:38px;
background-image: -webkit-linear-gradient(top,#009456 0,#009456 0%);
background-image: linear-gradient(to bottom,#009456 0,#009456 0%);
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
  background-color: #009456;
  border-color: #009456;
}


.btn-info:focus,
.btn-info:active,
.btn-info.active,
.open .dropdown-toggle.btn-info {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #009456;
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
  background-color: #009456;
  border-color: #009456;
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

                   <li><a href="EquiposAlc.aspx" class="btn btn-danger btn-lg btn-block"><span class="glyphicon glyphicon-scale" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Equipos</span></a></li>
                   <li><a href="ChecklistsAlc.aspx" class="btn btn-danger btn-lg btn-block"><span class="glyphicon glyphicon-list" style="color:white"></span>
                       <span class="nuevoEstilo6">&nbsp;Checklists</span></a></li>
                   <li><a href="MantencionesAlc.aspx" class="btn btn-danger btn-lg btn-block"><span class="glyphicon glyphicon-wrench" style="color:white"></span>
                       <span class="nuevoEstilo7">&nbsp;Mantenciones</span></a></li>
                   <li><a href="UsuariosAlc.aspx" class="btn btn-danger btn-lg btn-block"><span class="glyphicon glyphicon-user" style="color:white"></span>&nbsp;<span 
                           class="nuevoEstilo8">Usuarios</span></a></li>
                </ul>               
              </div>
              <hr/>
            </div>
            <div class="col-md-4">
              <div class="well">
                    <font color="white"><center><h4>Tu Perfil</h4></center>
                    <div class="input-group">
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>   Nombres:   <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>   Apellidos :   <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-envelope"></span>   Email    :   <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-earphone"></span>   Teléfono    :   <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-home"></span>   Cargo   :   <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-home"></span>   Depto.   :   <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></h5>
                       <br/>
                    </font>
               </div>
                      <center><asp:Button ID="Button3" runat="server" Text="Editar Cuenta" CssClass="btn btn-danger" width="80%" /></center>
             </div>
           </div>
         </div>
</asp:Content>
