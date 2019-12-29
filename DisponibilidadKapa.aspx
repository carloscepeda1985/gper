<%@ Page Language="VB" MasterPageFile="~/MasterKapa.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="DisponibilidadKapa.aspx.vb" Inherits="DisponibilidadKapa" Title="YouSoft" %>

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

   <div class="col-md-9">
    <div class="bar"><e class="letracolor"><span class="glyphicon2 glyphicon-list-alt" style="color:white"></span>&nbsp;Solicitudes</e></div>
    <div container>
     <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" style="float:right;">Agregar Mantención</button>
       
     <!-- Modal -->
  <div class="modal fade" data-backdrop="static" data-keyboard="false" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ingrese datos de la Mantención</h4>
        </div>
        <div class="modal-body">
          <p>
          <asp:Label ID="Label1" runat="server" Text="N° ID:"></asp:Label><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox> 
          Nombre:<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox> 
          Tipo:<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox> 
          Ubicación:<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox> 
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
            CssClass="table table-bordered bs-table" >
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" 
                    SelectImageUrl="~/editar.png" ControlStyle-CssClass="btn btn-info" SelectText="Ver" />
            </Columns>
            <HeaderStyle BackColor="#009456" ForeColor="White" />
        </asp:GridView>
 </div>


   </div>

    <div class="col-md-3">


     <ul class="nav nav-pills nav-stacked" background="#E9801E">

                   <li><a href="" class="btn btn-info btn-lg btn-block"><span class="glyphicon glyphicon-book" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Cursos</span></a></li>
                   <li><a href="" class="btn btn-warning btn-lg btn-block"><span class="glyphicon glyphicon-briefcase" style="color:white"></span>
                       <span class="nuevoEstilo6">&nbsp;Profesores</span></a></li>
                   <li><a href="" class="btn btn-danger btn-lg btn-block"><span class="glyphicon glyphicon-star-empty" style="color:white"></span>
                       <span class="nuevoEstilo7">&nbsp;Clientes</span></a></li>
                   <li><a href="UsuariosKapa.aspx" class="btn btn-success btn-lg btn-block"><span class="glyphicon glyphicon-user" style="color:white"></span>&nbsp;<span 
                           class="nuevoEstilo8">Usuarios</span></a></li>

               </ul>
				   
    </div>
  
</asp:Content>  