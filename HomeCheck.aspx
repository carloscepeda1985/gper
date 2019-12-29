<%@ Page Language="VB" MasterPageFile="~/MasterGper.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="HomeCheck.aspx.vb" Inherits="HomeCheck" Title="YouSoft" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<style type="text/css">
    
    .checkbox
        {
            padding-left: 20px;
        }
        .checkbox label
        {
            display: inline-block;
            vertical-align: middle;
            position: relative;
            padding-left: 5px;
        }
        .checkbox label::before
        {
            content: "";
            display: inline-block;
            position: absolute;
            width: 17px;
            height: 17px;
            left: 0;
            margin-left: -20px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            background-color: #fff;
            -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
        }
        .checkbox label::after
        {
            display: inline-block;
            position: absolute;
            width: 16px;
            height: 16px;
            left: 0;
            top: 0;
            margin-left: -20px;
            padding-left: 3px;
            padding-top: 1px;
            font-size: 11px;
            color: #555555;
        }
        .checkbox input[type="checkbox"]
        {
            opacity: 0;
            z-index: 1;
        }
     
      
        .checkbox-primary input[type="checkbox"]:checked + label::before
        {
            background-color: #00C851;
            border-color: #00C851;
        }
        .checkbox-primary input[type="checkbox"]:checked + label::after
        {
            color: #fff;
        }
    
    .btn-sample {
 color: #FFFFFF;
  background-color: #558551;
  border-color: #558551;
}


.btn-sample:focus,
.btn-sample:active,
.btn-sample.active,
.open .dropdown-toggle.btn-sample {
  color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}

 .btn-info {
 color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}


.btn-info:focus,
.btn-info:active,
.btn-info.active,
.open .dropdown-toggle.btn-info {
  color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}



 .btn-primary {
 color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a
}


.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open .dropdown-toggle.btn-primary {
  color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}



 .btn-warning {
 color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}


.btn-warning:focus,
.btn-warning:active,
.btn-warning.active,
.open .dropdown-toggle.btn-warning {
  color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}



 .btn-danger {
 color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}


.btn-danger:focus,
.btn-danger:active,
.btn-danger.active,
.open .dropdown-toggle.btn-danger {
  color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}




 .btn-success {
 color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
}


.btn-success:focus,
.btn-successr:active,
.btn-success.active,
.open .dropdown-toggle.btn-success {
  color: #FFFFFF;
  background-color: #f4841a;
  border-color: #f4841a;
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
     
     .state-icon {
    left: -5px;
}
.list-group-item-primary {
    color: rgb(255, 255, 255);
    background-color: rgb(66, 139, 202);
}

/* DEMO ONLY - REMOVES UNWANTED MARGIN */
.well .list-group {
    margin-bottom: 0px;
}
     
 </style>

<!-- Page Content -->
<div class="container">


<div class="table-responsive">

<fieldset>

<legend><center>Checklists Extintor</center></legend>
&nbsp;&nbsp; <strong>Código Equipo:
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;- Usuario:
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </strong>
    <div class="checkbox checkbox-primary">
    <asp:CheckBoxList runat="server" ID="cblItem" CssClass="styled" Font-Size="Larger" Height="800px">
 
        <asp:ListItem Text="El extintor tiene el número clave/código de identificación" /> 
        <asp:ListItem Text="El extintor está ubicado en el lugar designado y en posición correcta" />
        <asp:ListItem Text="El extintor se encuentra claramente visible" />
        <asp:ListItem Text="El acceso al extintor NO se encuentra obstruido" /> 
        <asp:ListItem Text="El soporte del extintor está en buenas condiciones" />
        <asp:ListItem Text="NO se observan signos o señales de corrosión" />
        <asp:ListItem Text="NO se observan desperfectos debido a fugas o filtraciones" /> 
        <asp:ListItem Text="NO hay evidencia de daños y averías mecánicas" />
        <asp:ListItem Text="El conjunto manguera y acoples está en buenas condiciones" />
        <asp:ListItem Text="La boquilla de descarga está en buenas condiciones" /> 
        <asp:ListItem Text="La palanca de descarga está en buenas condiciones" />
        <asp:ListItem Text="El mango o manija de transporte está en buenas condiciones" />
        <asp:ListItem Text="Tiene visibles y legibles las marcas y etiqueta de identificación y placa de instrucciones" /> 
        <asp:ListItem Text="Tiene visible y legibles la etiqueta de última revisión de Servicio Técnico / mantención según Decreto Nº 369 y la etiqueta de control de inspección visual" />


        </asp:CheckBoxList>
    </div>

  <div id="Div1" class="form-group" runat="server">
  <label class="col-md-4 control-label"></label>
  <center>
  <asp:Button ID="Button2" runat="server" Text="Cancelar" Width="30%" cssclass="btn btn-success"/>
  &nbsp&nbsp&nbsp<asp:Button ID="Button1" runat="server" Text="Enviar Datos" Width="30%" cssclass="btn btn-success"/>
  <center> <asp:Button ID="Button3" Visible="false" runat="server"  Text="volver" class="btn btn-danger btn-lg btn-block"  width="40%" /> </center>
  </center>
</div>


</fieldset>

</div>



</div>
    
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


</asp:Content>
