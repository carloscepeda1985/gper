<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="frm_nuevoGlink.aspx.vb" Inherits="frm_nuevo" Title="Glink" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

  <style>
.bar
{
list-style-type:none;
height:38px;
background-image: -webkit-linear-gradient(top,#2c777a 0,#2c777a 0%);
background-image: linear-gradient(to bottom,#2c777a 0,#2c777a 0%);
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

        <!-- sweetalert -->
    <link href="css/sweetalert.css" rel="stylesheet" />
    <script  src="js/sweetalert.min.js"></script>

    <script type="text/javascript">

        function successalert() {
            swal({
                title: "Los cambios han sido guardados correctamente",
                type: "success",
            },
                function (isConfirm) {
                    if (isConfirm) {
                        location.href = "AdmGlink.aspx";
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
        function checkCorreo(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8) return true;
            // Patron de entrada, en este caso solo acepta numeros y letras
            patron = /^[a-zA-Z0-9-@_.]+$/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }
    </script>



<div class="table-responsive">

<center>
<fieldset>

<!-- Form Name -->
<legend class="modal-header" style="background:#185189; color: white;">Cuenta de Usuario Glink</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label  text-right">Nombres</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Ingresar nombres" onkeypress="return checkTexto(event);"  required = "required" ></asp:TextBox>
     </div>
  </div>
</div>
</br>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label text-right" >Apellidos</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Ingresar apellidos" onkeypress="return checkTexto(event);"  required = "required"></asp:TextBox>
   </div>
  </div>
</div>
</br>
<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label text-right">Email</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <asp:TextBox type="email" ID="TextBox3" runat="server" CssClass="form-control" placeholder="Ingresar email" onkeypress="return checkCorreo(event);"  required = "required" ></asp:TextBox>
   </div>
  </div>
</div>
</br>

<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label text-right">Teléfono</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control placeholder  phonemask" placeholder="Ingresar teléfono" minlength="8" maxlength="12" onkeypress="return checkTelefono(event);"  required="required" ></asp:TextBox>
   </div>
  </div>
</div>
</br>
<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label text-right">Cargo</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <asp:TextBox  ID="TextBox5" runat="server" CssClass="form-control" placeholder="Ingresar cargo" onkeypress="return checkTexto(event);"  required = "required"></asp:TextBox>
    </div>
  </div>
</div>
</br>

<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label text-right">Empresa</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <asp:TextBox  ID="TextBox6" runat="server" CssClass="form-control" placeholder="Ingresar empresa" onkeypress="return checkTexto(event);"  required = "required"></asp:TextBox>
   </div>
  </div>
</div>
</br>
<div class="form-group">
  <label class="col-md-4 control-label text-right">Clave*</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
  <asp:TextBox  ID="TextBox7" runat="server" CssClass="form-control" placeholder="Ingresar contraseña" onkeypress="return checkTexto(event);" required = "required"></asp:TextBox>
    </div>
  </div>
</div>
</br>
</br>
<!-- Button -->
<div class="form-group" runat="server">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
  &nbsp&nbsp&nbsp<asp:Button ID="Button1" runat="server" Text="Enviar Datos" cssclass="btn btn-primary btn-flat" width="40%"/>
  </div>
</div>

</fieldset>
</center>
 </br>
                

</div>

</asp:Content>
