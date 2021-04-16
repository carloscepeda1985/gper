<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="SolicitudesTieGlink.aspx.vb" Inherits="SolicitudesCon" Title="Glink" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
	<script type="text/javascript">
	    //Put your JavaScript code here.
    </script>

<style>
    a:hover {
        background-color: #286090 !important;
        cursor: pointer;
    }
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

 </style>--%>

    <div class="col-md-9">
    <div class="bar">

    <e class="letracolor"><span class="glyphicon glyphicon-log-in" style="color:white"></span>&nbsp;Solicitudes</e>
    

    </div>

          
<div class="input-group">
    
      <div style="float:left">
     <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Width="100" placeholder="N° Solicitud"  maxlength="8"  onkeypress="return checkNumero(event);" ></asp:TextBox>&nbsp
     </div>&nbsp&nbsp
     <div  style="float:left">
     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
     <asp:listitem text="Todas" value="0"></asp:listitem>
     <asp:listitem text="Aceptadas" value="1"></asp:listitem>
     <asp:listitem text="Pendientes" value="2"></asp:listitem>
     <asp:listitem text="Rechazadas" value="3"></asp:listitem>
     </asp:DropDownList>
      </div>&nbsp&nbsp
        <div style="float:left">
            &nbsp&nbsp<asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-primary"/>
       </div>
    </div>
        <br />
   
   
<%--    <div container>
     <div>
     <button style="float: right"; type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">+Agregar</button>
  
      <div class="input-group">
      <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Width="150" placeholder="Ingrese Nombre"></asp:TextBox>&nbsp
      <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-warning"/>
     
      </div>
      </div>
     <!-- Modal -->
  <div class="modal fade" data-backdrop="static" data-keyboard="false" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ingrese datos del Trabajador</h4>
        </div>
        <div class="modal-body">
          <p>
          Rut:<asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox> 
          Nombre:<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox> 
          Apellido:<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox> 
          Teléfono:<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
          Cargo:<asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
          Empresa:<asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
          <br/>
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
 --%>
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="10">
            <Columns>

            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-edit" style="color:white"></span>' ControlStyle-CssClass="btn btn-info" SelectText="Ver" />

            <asp:TemplateField HeaderText="Estado" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("Estado").ToString() = "M", "M.png", If(Eval("Estado").ToString() = "P", "P.png", "A.png"))) %>' ToolTip ='<%# If(Eval("Estado").ToString() = "M", "Pendiente", If(Eval("Estado").ToString() = "P", "Aprobada", "Rechazada")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

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
            <HeaderStyle BackColor="#a9a2a6" ForeColor="White" />
        </asp:GridView>
 </div>
        <br />
 &nbsp&nbsp&nbsp<small><img src="Images/P.png" alt="Aprobada" style="width:21px; height:21px;"/>&nbsp= Aprobada,&nbsp&nbsp <img src="Images/M.png" alt="Pendiente" style="width:21px; height:21px;"/>&nbsp= Pendiente,&nbsp&nbsp <img src="Images/A.png" alt="Rechazada" style="width:21px; height:21px;" />&nbsp= Rechazada.</small>
 <br />
        <br />
   </div>

    <div class="col-md-3">


     <ul class="nav nav-pills nav-stacked" background="#E9801E">


                     <li><a href="TieGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-home" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Menú Principal</span></a></li>

                    <li><a href="CrearSolicitudTieGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-share" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Nueva Solicitud</span></a></li>

                    <li><a href="SolicitudesTieGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-log-in" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Solicitudes</span></a></li>

                   <li><a href="TrabajadoresTieGlink.aspx" class="btn btn-primary btn-lg btn-block" style="line-height: 2;"><span class="glyphicon glyphicon-briefcase" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Trabajadores</span></a></li>
         

               </ul>
				   
    </div>

</asp:Content>