﻿<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="frm_nuevoConGlink.aspx.vb" Inherits="frm_nuevo" Title="Glink" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

   <%-- <style>
        .bar {
            list-style-type: none;
            height: 38px;
            background-image: -webkit-linear-gradient(top,#2c777a 0,#2c777a 0%);
            background-image: linear-gradient(to bottom,#2c777a 0,#2c777a 0%);
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
            background-color: #72CFBF;
            border-color: #3BBFA5;
        }

        .btn-sample .badge {
            color: #FFFFFF;
            background-color: #72CFBF;
            border-color: #3BBFA5;
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
                        location.href = "ConGlink.aspx";
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
                        location.href = "ConGlink.aspx";
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




    <div class="table-responsive">

        <center>
            <fieldset>

                <!-- Form Name -->
                <legend class="modal-header" style="background: #185189; color: white;">Cuenta de Usuario Glink</legend>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label  text-right">Rut</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Ingresar rut" onkeypress="return checkRutValidacion(event);" onkeyup="checkRut(this)"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                          <asp:RequiredFieldValidator id="reqRut" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Debe ingresar Rut"/>

                          <asp:CustomValidator id="customRut" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="red" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="El rut no es valido" ClientValidationFunction="validar_rut" />
                        </div>
                    </div>
                </div>


                </br>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Nombre Empresa</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Ingresar nombre de la empresa" onkeypress="return checkTexto(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqApellido" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Debe ingresar nombre de la empresa" />
                        </div>
                    </div>
                </div>
                </br>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Contacto</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <asp:TextBox type="text" ID="TextBox3" runat="server" CssClass="form-control" placeholder="Ingresar contacto" onkeypress="return checkTexto(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqContacto" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Debe ingresar contacto" />
                        </div>
                    </div>
                </div>
                </br>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Teléfono</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control placeholder  phonemask" placeholder="Ingresar teléfono" MaxLength="12" onkeypress="return checkTelefono(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqTelefono" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Debe ingresar teléfono" />
                        </div>
                    </div>
                </div>
                </br>
                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Email</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="Ingresar email" onkeypress="return checkCorreo(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                         <asp:RequiredFieldValidator id="reqEmail" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Debe ingresar email"/>
                         <asp:CustomValidator id="customEmail" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="red" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Formato del correo es invalido" ClientValidationFunction="validarEmail" />
                        </div>
                    </div>
                </div>
                </br>
                <div class="form-group">
                    <label class="col-md-4 control-label text-right">Clave*</label>
                    <div class="col-md-5 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="Ingresar contraseña" onkeypress="return checkTexto(event);"></asp:TextBox>
                        </div>
                        <div class="form-group" style="text-align: left">
                            <asp:RequiredFieldValidator ID="reqClave" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Debe ingresar clave" />
                        </div>
                    </div>
                </div>
                </br>
</br>
                <!-- Button -->
                <div class="form-group" runat="server">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-5">
                        <asp:Button ID="Button2" runat="server" Text="Volver" CssClass="btn btn-danger btn-flat" Width="40%" />
                    
                        &nbsp&nbsp&nbsp<asp:Button ID="Button1" runat="server" Text="Guardar Cambios" CssClass="btn btn-success btn-flat" Width="40%" />
                    </div>
                </div>

            </fieldset>
        </center>
        </br>
                

    </div>

</asp:Content>
