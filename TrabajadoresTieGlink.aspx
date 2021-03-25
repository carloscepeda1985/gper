<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="TrabajadoresTieGlink.aspx.vb" Inherits="TrabajadoresCon" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<link href="css/sweetalert.css" rel="stylesheet">
 <script src="js/sweetalert.min.js"></script>

    <script type="text/javascript">


        function successalert(rutTienda) {

            swal({
                title: "Los cambios han sido guardados correctamente",
                type: "success",
            },
                function (isConfirm) {
                    if (isConfirm) {
                        location.href = "TrabajadoresTieGlink.aspx"
                    }
                });
        }

        function checkTelefono(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 8) return true;
            patron = /^[0-9-+]+$/;
            te = String.fromCharCode(tecla);
            return patron.test(te);
        }

        function checkTexto(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8) return true;
            // Patron de entrada, en este caso solo acepta numeros y letras
            patron = /^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }

        function checkRutValidacion(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8) return true;
            // Patron de entrada, en este caso solo acepta numeros y letras
            patron = /^[0-9-kK]+$/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }

        function checkCorreo(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8) return true;
            // Patron de entrada, en este caso solo acepta numeros y letras
            patron = /^[a-zA-Z0-9-@_.]+$/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);


        }


        function validar_rut(source, arguments) {
            var rut = arguments.Value; suma = 0; mul = 2; i = 0;

            for (i = rut.length - 3; i >= 0; i--) {
                suma = suma + parseInt(rut.charAt(i)) * mul;
                mul = mul == 7 ? 2 : mul + 1;
            }

            var dvr = '' + (11 - suma % 11);
            if (dvr == '10') dvr = 'K'; else if (dvr == '11') dvr = '0';

            if (rut.charAt(rut.length - 2) != "-" || rut.charAt(rut.length - 1).toUpperCase() != dvr)
                arguments.IsValid = false;
            else
                arguments.IsValid = true;
        }

        function checkRut(rut) {

            var valor = rut.value.replace('.', '');
            valor = valor.replace('-', '');

            cuerpo = valor.slice(0, -1);
            dv = valor.slice(-1).toUpperCase();

            rut.value = cuerpo + '-' + dv

        }

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

    <style>
    a:hover {
        background-color: #286090 !important;
        cursor: pointer;
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

    <div class="col-md-9">
    <div class="bar">

    <e class="letracolor"><span class="glyphicon glyphicon-briefcase" style="color:white"></span>&nbsp;Trabajadores</e>
    

    </div>
   
   
    <div container>
     <div>
     <button style="float: right"; type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">+ Agregar</button>
  
      <div class="input-group">
      <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Width="150" placeholder="Ingrese Nombre" onkeypress="return checkTexto(event);"></asp:TextBox>&nbsp
      <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-primary" CausesValidation="false"/>
     
      </div>
      </div>
        <!-- Modal -->
  <div class="modal fade" data-backdrop="static" data-keyboard="false" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header"style="background:#185189; color: white;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ingrese datos del Trabajador</h4>
        </div>
        <div class="modal-body">
          <p>


    <div class="form-group"> <label>Rut</label>
                     
                        <div class="input-group">
                      
                            <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-align-justify"></i></span>

                            <asp:TextBox type="text" ID="TextBox6" runat="server" CssClass="form-control" maxlength="10"  placeholder="Ingresar rut" onkeypress="return checkRutValidacion(event);" onkeyup="checkRut(this)" ></asp:TextBox> 
                            
                        </div>
                          <asp:RequiredFieldValidator id="reqRut" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Debe ingresar Rut"/>

                          <asp:CustomValidator id="customRut" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="red" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="El rut no es valido" ClientValidationFunction="validar_rut" />

                      </div>

                    <div class="form-group"> <label>Nombre</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-shopping-cart"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox2" runat="server" CssClass="form-control" placeholder="Ingresar nombre" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqTienda" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Debe ingresar nombre"/>
                    </div>

                    <div class="form-group"> <label>Apellido</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-shopping-cart"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox3" runat="server" CssClass="form-control" placeholder="Ingresar apellido" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqApellido" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Debe ingresar apellido"/>
                    </div>

                     <div class="form-group"> <label>Teléfono</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-earphone"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox4" runat="server" CssClass="form-control" placeholder="Ingresar teléfono"  maxlength="12"  onkeypress="return checkTelefono(event);" ></asp:TextBox> 
                        </div>
                          <asp:RequiredFieldValidator id="reqTelefono" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Debe ingresar teléfono"/>
                    </div>
                    <div class="form-group"> <label>Dirección</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon glyphicon-home"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox1" runat="server" CssClass="form-control" placeholder="Ingresar dirección" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Debe ingresar dirección"/>
                    </div>

                    <div class="form-group"> <label>Cargo</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-shopping-cart"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox7" runat="server" CssClass="form-control" placeholder="Ingresar cargo" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqCargo" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Debe ingresar cargo"/>
                    </div>

                    <div class="form-group"> <label>Empresa</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-shopping-cart"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox8" runat="server" CssClass="form-control" placeholder="Ingresar empresa" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqEmpresa" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Debe ingresar empresa"/>
                    </div>



<%--          Rut:<asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox> 
          Nombre:<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox> 
          Apellido:<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox> 
          Teléfono:<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
          Cargo:<asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
          Empresa:<asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>--%>
          <br/>
          </p>
         
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-success" />
        </div>
      </div>
      
    </div>
  </div>

    </div>
      
      <br />
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="10">
            <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-edit" style="color:white"></span>' ControlStyle-CssClass="btn btn-primary" SelectText="Editar" />
            <asp:BoundField DataField="Rut" HeaderText="Rut" ItemStyle-Width="130" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Numero" HeaderText="Teléfono" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Direc" HeaderText="Dirección" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Cargo" HeaderText="Cargo" ItemStyle-Width="150" ItemStyle-Wrap="false" />
 
            <asp:TemplateField HeaderText="CDT" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CDT").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CAFP" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CAFP").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="AFC" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("AFC").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="INP" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("INP").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CCAF" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CCAF").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

    </Columns>
            <HeaderStyle BackColor="#a9a2a6" ForeColor="White" />
        </asp:GridView>
 </div>
 
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