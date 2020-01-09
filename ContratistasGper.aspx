<%@ Page Language="VB" MasterPageFile="~/MasterGper.Master" AutoEventWireup="false" CodeFile="ContratistasGper.aspx.vb" Inherits="ContratistasGper" Title="Gper" %>
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
background-image: -webkit-linear-gradient(top,#185189 0,#185189 0%);
background-image: linear-gradient(to bottom,#185189 0,#185189 0%);
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
  background-color: #f4841a;
  border-color: #f4841a;
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
  border-color: #f4841a;
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
    <div class="bar">



  
    <e class="letracolor"><span class="glyphicon2 glyphicon-hand-right" style="color:white"></span>&nbsp;Contratistas</e>
    

    </div>
   
   
    <div container>
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
          <h4 class="modal-title">Ingrese datos del Contratista</h4>
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
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="6">
            <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-edit" style="color:white"></span>' ControlStyle-CssClass="btn btn-info" SelectText="Editar" />
            <asp:BoundField DataField="Rut" HeaderText="Rut" ItemStyle-Width="130" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Contacto" HeaderText="Contacto" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" ItemStyle-Width="150" ItemStyle-Wrap="false" />
 
            <asp:TemplateField HeaderText="D1" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("D1").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="D2" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("D2").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="D3" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("D3").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="D4" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("D4").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="D5" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("D5").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Estado" HeaderText="Estado" ItemStyle-Width="150" ItemStyle-Wrap="false" />

    </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
 </div>
 
   </div>

    <div class="col-md-3">


     <ul class="nav nav-pills nav-stacked" background="#E9801E">

                   <li><a href="AdmGper.aspx" class="btn btn-info btn-lg btn-block"><span class="glyphicon glyphicon-home" style="color:white"></span>
                       <span class="nuevoEstilo3">&nbsp;Menu Principal</span></a></li>
                   <li><a href="TrabajadoresGper.aspx" class="btn btn-warning btn-lg btn-s"><span class="glyphicon glyphicon-briefcase" style="color:white"></span>
                       <span class="nuevoEstilo6">&nbsp;Trabajadores</span></a></li>
                   <li><a href="EquiposGper.aspx" class="btn btn-warning btn-lg btn-s"><span class="glyphicon glyphicon-scale" style="color:white"></span>
                       <span class="nuevoEstilo6">&nbsp;Equipos</span></a></li>
                   <li><a href="ChecklistsAlc.aspx" class="btn btn-warning btn-lg btn-danger"><span class="glyphicon glyphicon-list" style="color:white"></span>
                       <span class="nuevoEstilo6">&nbsp;Checklists</span></a></li>
                   <li><a href="MantencionesAlc.aspx" class="btn btn-danger btn-lg btn-block"><span class="glyphicon glyphicon-wrench" style="color:white"></span>
                       <span class="nuevoEstilo7">&nbsp;Mantenciones</span></a></li>
                  

               </ul>
				   
    </div>

</asp:Content>
