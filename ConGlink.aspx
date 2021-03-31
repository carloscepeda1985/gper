<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="ConGlink.aspx.vb" Inherits="ConGper"  Title="Glink" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
	<script type="text/javascript">
	    //Put your JavaScript code here.
    </script>
	

<%--<style>
.bar
{
list-style-type:none;
height:38px;
background-image: -webkit-linear-gradient(top,#01203c 0,#01203c 0%);
background-image: linear-gradient(to bottom,#01203c 0,#01203c 0%);
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
.btn-info.active {
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
</style>



   <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="media">
                <ul class="nav nav-pills nav-stacked" background="#E9801E">

                     

                   <li><a class="btn btn-primary btn-lg btn-block" style="line-height: 2;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-share" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Nueva Solicitud</span></a></li>

                    <li><a href="SolicitudesConGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-log-in" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Solicitudes</span></a></li>

                   <li><a href="TrabajadoresConGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-briefcase" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Trabajadores</span></a></li>
         
                </ul>   
                    
                     <!-- Modal Logo -->
  <div class="modal fade" data-backdrop="static" data-keyboard="false" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background:#185189; color: white;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Términos y Condiciones </h4>
        </div>
        <div class="modal-body">
   
           <div style="
            background : #ffffff;
            color : #000000;
            padding : 4px;
            width : 100%;
            height : 350px;
            overflow : auto; ">
1. Autorización de ingreso por parte de la empresa Cada vez que una empresa contratista se adjudique una licitación, esta deberá contar con la respectiva autorización de las siguientes áreas:<br /> - Adjudicación de Licitación por el mandante (Quien solicita los trabajos) <br />- Autorización del proyecto entregado por el área de Arquitectura tanto del Mandante o de nuestra empresa, con autorización a obra respectivo.<br /> 
<br />2. Objetivo o Fundamento:<br /> Disminuir al máximo el riesgo de daño colateral a nuestra empresa, velando por las condiciones laborales de los colaboradores subcontratistas y dando fiel cumplimiento de las normativas legales vigentes.<br /> 
<br />3. Responsable:<br /> Se aplica a la totalidad de la empresa, representada por la administración del centro comercial.<br /> 
<br />4. Descripción Procedimiento:<br /> Información General Toda empresa y sus trabajadores que presten algún servicio deberá dar cumplimiento a los siguientes requerimientos mínimos en materia de prevención de riesgos.<br /> El no cumplir con lo estipulado, originará la prohibición en la ejecución de los trabajos y la suspensión de la empresa.<br /> Es responsabilidad de la empresa prestadora de los servicios, cumplir con toda la normativa vigente, del ámbito de la relación con nuestra compañía.<br />
<br />5. Modalidad en la ejecución de los trabajos:<br /> 
a) Antes de comenzar los trabajos, la persona a cargo de éstos deberá tomar contacto diariamente con el coordinador designado en nuestra empresa.<br />
b) Diariamente, antes de comenzar los trabajos, la persona a cargo de éstos y en presencia del coordinador designado, deberá instruir al personal que ejecutará tareas.<br /> Sobre la labor a desempeñar, las obligaciones y prohibiciones que deben seguir, la revisión de los materiales a utilizar para garantizar su buen estado, la verificación del uso de los elementos de protección personal de ser necesarios.<br /> 
c) Diariamente se controlará la condición y cantidad de los EPP a utilizar.<br /> 
<br />6. Paralización de los Trabajos:<br /> Al detectarse cualquier anomalía, por mínimo que parezca como:<br />
 − Falta de algún elemento básico para la ejecución de los trabajos de forma segura.<br /> 
− Detección de personal no declarado en la nómina de ingreso a obra.<br /> 
− Falencias en el estado del orden y limpieza de la obra por riesgo de incendio y accidentes.<br />
 − No tener elementos de extinción suficientes en la obra, a lo menos un extintor con su respectivo encargado.<br /> 
− Riesgo eléctrico.<br />
− Mantención de elementos no permitidos al interior, como hervidores, anafre, cocinillas − Sustancias prohibidas, como alcohol y drogas.<br /> 
− Vías de evacuación obstruidas.<br />
 − Falta de ventilación.<br /> 
− Falta de iluminación.<br /> 
− Trabajo en horarios no autorizados.<br />
 − Daños al equipamiento del centro comercial, entiéndase por:<br /> ▪ Sistema de detección de incendio.<br /> ▪ Sistema de extinción de incendio.<br /> ▪ Sistema de alarmas de seguridad.<br /> ▪ Sistema eléctrico.<br /> ▪ Sistema de CCTV.<br /> ▪ Red sanitaria del centro comercial.<br /> ▪ Cubierta de techos del centro comercial.<br /> 
− Cualquier acto que vulnere la honra y dignidad de colaboradores, visitas y clientes del centro comercial.<br /> 
− Daños a otros operadores del centro comercial.<br /> 
− Cualquier situación que afecte la normal operación del centro comercial, como:<br /> ▪ Ruidos molestos.<br /> ▪ Tránsito por lugares no autorizados.<br /> ▪ Movimientos de escombros y/o materiales por vías y horarios no autorizados.<br /> ▪ Acumulación de materiales dentro de la obra.<br /> ▪ Gente pernoctando al interior de la obra.<br />
- La persona que tome conocimiento del tema tiene la obligación desuspender los trabajos, hasta que se corrija la situación detectada.<br /> 
- Ante toda irregularidad siempre dar aviso, en primera instancia ADMINISTRACIÓN

</div> 

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Cancelar</button>
            <formaction id="Form1" enctype="multipart/form-data"   runat="server" CssClass="btn btn-danger btn-flat">    
             <asp:Button ID="Button1" runat="server" Text="Acepto términos y condiciones" CssClass="btn btn-success"  CausesValidation="false"  />
    </formaction>
        </div>
      </div>
      
    </div>
  </div>





              </div>
              <hr/>
            </div>
            <div class="col-md-4">
              <div class="well" style="background-color: #103b65;">
                    <font color="white"><center><h4>Tu Perfil</h4></center>
                    <div class="input-group">
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>     Rut:   <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>     Nombre :   <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-envelope"></span>     Contacto    :   <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-earphone"></span>     Telefono    :   <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-home"></span>     Email   :   <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></h5>
                       <br/>
                    </font>
               </div>
                      <center><asp:Button ID="Button3" runat="server" Text="Editar Cuenta" CssClass="btn btn-primary" width="80%" /></center>
             </div>
           </div>
         </div>
  
</asp:Content>
