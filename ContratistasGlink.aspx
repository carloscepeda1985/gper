<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" AutoEventWireup="false" CodeFile="ContratistasGlink.aspx.vb" Inherits="ContratistasGper" Title="Glink" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
 <link href="css/sweetalert.css" rel="stylesheet">
 <script src="js/sweetalert.min.js"></script>

    	

    <script type="text/javascript">


        function successalert() {
            swal({
                title: "Los cambios han sido guardados correctamente",
                type: "success",
            },
                function (isConfirm) {
                    if (isConfirm) {
                        location.href = "ContratistasGlink.aspx";
                    }
                });
        }

        function successalert2(mensaje, tipoAlerta) {

            swal({
                title: mensaje,
                type: tipoAlerta,
            },
                function (isConfirm) {
                    if (isConfirm) {
                        location.href = "ContratistasGlink.aspx";
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

        function validarEmail(source, arguments) {


            expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

            if (!expr.test(arguments.Value)) {


                arguments.IsValid = false;
            } else {


                arguments.IsValid = true;

            }
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
    a:hover {
        background-color: #286090 !important;
        cursor: pointer;
    }
</style>
	

<style>
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

    e.letracolor {
        padding-left: 20px;
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
        background-color: #0559a2;
        border-color: #0559a2;
    }

    .btn-sample .badge {
        color: #FFFFFF;
        background-color: #0559a2;
        border-color: #0559a2;
    }

    .nuevoEstilo1 {
        color: #FFFFFF;
    }

    .nuevoEstilo2 {
        color: #FFFFFF;
    }

    .nuevoEstilo3 {
        color: #FFFFFF;
    }

    .nuevoEstilo4 {
        color: #FFFFFF;
    }

    .nuevoEstilo5 {
        color: #FFFFFF;
        font-weight: bold;
    }

    .nuevoEstilo6 {
        color: #FFFFFF;
    }

    .nuevoEstilo7 {
        color: #FFFFFF;
    }

    .nuevoEstilo8 {
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



  
    <e class="letracolor"><span class="glyphicon2 glyphicon-hand-right" style="color:white"></span>&nbsp;Contratistas</e>
    

    </div>
   
   
    <div container>
     <div>
     <button style="float: right"; type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">+ Agregar</button>
  
      <div class="input-group">
      <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Width="150" placeholder="Ingrese Nombre" onkeypress="return checkTexto(event);"></asp:TextBox>&nbsp
      <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-primary"  CausesValidation="false" />
     
      </div>
      </div>
     <!-- Modal -->
  <div class="modal fade" data-backdrop="static" data-keyboard="false" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background:#185189; color: white;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ingrese datos del Contratista</h4>
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
       
                           <asp:TextBox type="text" ID="TextBox2" runat="server" CssClass="form-control" placeholder="Ingresar nombre de la tienda" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqTienda" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Debe ingresar nombre de la tienda"/>
                    </div>

                    <div class="form-group"> <label>Contacto</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-user"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox3" runat="server" CssClass="form-control" placeholder="Ingresar contacto" onkeypress="return checkTexto(event);" ></asp:TextBox> 
                        </div>
                          <asp:RequiredFieldValidator id="reqContacto" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Debe ingresar contacto"/>
                    </div>

                    <div class="form-group"> <label>Teléfono</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-earphone"></i></span>

                  
                           <asp:TextBox  type="text" ID="TextBox4" runat="server" ClientIDMode="static" CssClass="form-control" placeholder="Ingresar teléfono"  maxlength="12"  onkeypress="return checkTelefono(event);" ></asp:TextBox>               
                        </div>
 
                          <asp:RequiredFieldValidator id="reqTelefono" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Debe ingresar teléfono"/>
                    </div>

                    <div class="form-group"> <label>Email</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-envelope"></i></span>
       
                           <asp:TextBox type="text"  ID="TextBox7" runat="server" CssClass="form-control" placeholder="Ingresar email" onkeypress="return checkCorreo(event);" ></asp:TextBox> 
                        </div>
                         <asp:RequiredFieldValidator id="reqEmail" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Debe ingresar email"/>
                         <asp:CustomValidator id="customEmail" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="red" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Formato del correo es invalido" ClientValidationFunction="validarEmail" />
                    </div>

                    <div class="form-group"> <label>Contraseña</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-eye-close"></i></span>
       
                           <asp:TextBox type="text"  ID="TextBox8" runat="server" CssClass="form-control" placeholder="Ingresar contraseña" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                         <asp:RequiredFieldValidator id="reqContraseña" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Debe ingresar contraseña"/>
                    </div>



<%--          Rut:<asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox> 
          Nombre:<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox> 
          Contacto:<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox> 
          Teléfono:<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
          Email:<asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
          Contraseña:<asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>--%>
          <br/>
          </p>
         
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <asp:Button ID="Button1" runat="server" Text="Guardar cambios"  CssClass="btn btn-success btn-flat"  />
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
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-edit" style="color:white"></span>' ControlStyle-CssClass="btn btn-primary" SelectText="Ver" />
            <asp:BoundField DataField="Rut" HeaderText="Rut" ItemStyle-Width="130" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Contacto" HeaderText="Contacto" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Contraseña" HeaderText="Contraseña" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
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
