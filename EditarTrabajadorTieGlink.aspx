<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="EditarTrabajadorTieGlink.aspx.vb" Inherits="EditarTrabajadorContratista" Title="Glink" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <link href="css/sweetalert.css" rel="stylesheet">
    <script src="js/sweetalert.min.js"></script>

    <script type="text/javascript">

        function successalert() {

            swal('Advertencia', 'Seleccione un archivo para subir.', 'warning')

        }

        function successalert2(rutaTrabajador, mensaje) {

            swal({
                title: mensaje,
                type: "success",
            },
                function (isConfirm) {
                    if (isConfirm) {
                        location.href = "EditarTrabajadorTieGlink.aspx?dato=" + rutaTrabajador;
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


 <style>
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
 </style>


<div class="table-responsive">
<center>
<fieldset>

<!-- Form Name -->
<legend style="background: #185189; color: white;">Editar Trabajador</legend>

<!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Rut</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" MaxLength="10" placeholder="Ingresar rut" onkeypress="return checkRutValidacion(event);" onkeyup="checkRut(this)"></asp:TextBox>

                        </div>

                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqRut" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Debe ingresar Rut" />
                            <asp:CustomValidator ID="customRut" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="red" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="El rut no es valido" ClientValidationFunction="validar_rut" />

                        </div>
                    </div>
                </div>
                </br>

                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Nombre</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox
                                ID="TextBox1" runat="server" CssClass="form-control" placeholder="Ingresar nombre" onkeypress="return checkTexto(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqNombre" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Debe ingresar Nombre" />
                        </div>
                    </div>
                </div>
                </br>
                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Apellido</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox
                                ID="TextBox2" runat="server" CssClass="form-control" placeholder="Ingresar apellido" onkeypress="return checkTexto(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqApellido" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Debe ingresar Apellido" />

                        </div>
                    </div>
                </div>
                </br>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Teléfono</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <asp:TextBox
                                ID="TextBox3" runat="server" CssClass="form-control" placeholder="Ingresar teléfono"  maxlength="12"  onkeypress="return checkTelefono(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqTelefono" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Debe ingresar Teléfono" />

                        </div>
                    </div>
                </div>
                </br>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Cargo</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <asp:TextBox
                                ID="TextBox4" runat="server" CssClass="form-control" placeholder="Ingresar cargo" onkeypress="return checkTexto(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqCargo" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Debe ingresar Cargo" />

                        </div>
                    </div>
                </div>
                </br>
                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Empresa</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="Ingresar empresa" onkeypress="return checkTexto(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqEmpresa" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Debe ingresar Empresa" />

                        </div>
                    </div>
                </div>
<br/>

<br/>
<!-- Button -->
<div id="Div1" class="form-group" runat="server">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
  <asp:Button ID="Button2" runat="server" Text="Volver" cssclass="btn btn-danger"  CausesValidation="False"
          width="40%"/>
  &nbsp&nbsp&nbsp<asp:Button ID="Button1" runat="server" Text="Enviar Datos" cssclass="btn btn-success" width="40%"/>
  </div>
</div>

</fieldset>
</center>
<br/>




<center>
<fieldset>

<!-- Form Name -->
<legend style="background: #185189; color: white;">Actualizar Documentos</legend>

<div class="form-group">
<label class="col-md-4 control-label text-right">CDT</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File6" name="File1" runat="server" style="float: left" />
     <formaction id="Form1" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit6" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>
<div class="form-group">
<label class="col-md-4 control-label text-right">CAFP</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File7" name="File1" runat="server" style="float: left" />
     <formaction id="Form2" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit7" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>
 <div class="form-group">
<label class="col-md-4 control-label text-right">AFC</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File8" name="File1" runat="server" style="float: left" />
     <formaction id="Form3" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit8" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>
 <div class="form-group">
<label class="col-md-4 control-label text-right">INP</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File9" name="File1" runat="server" style="float: left" />
     <formaction id="Form4" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit9" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>
 <div class="form-group">
<label class="col-md-4 control-label text-right">CCAF</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File10" name="File1" runat="server" style="float: left" />
     <formaction id="Form5" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit10" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>


<br/>

</fieldset>
</center>





<center>
<fieldset>

<!-- Form Name -->
<legend style="background: #185189; color: white;">Documentos del Trabajador</legend>

<div class="form-group">
    <div class="table-responsive">
         <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="6">
            <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-eye-open" style="color:white"></span>' ControlStyle-CssClass="btn btn-success" SelectText="Ver" ItemStyle-Width="130" />
             <asp:TemplateField HeaderText="Estado" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("Estado").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField> 
            <asp:BoundField DataField="Codigo" HeaderText="Código" ItemStyle-Width="130" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Detalle" HeaderText="Detalle" ItemStyle-Width="500" ItemStyle-Wrap="false" />
 
           
    </Columns>
            <HeaderStyle BackColor="#a9a2a6" ForeColor="White" />
        </asp:GridView>
 </div>
</div>
</fieldset>
</center>



                

</div>

</asp:Content>

