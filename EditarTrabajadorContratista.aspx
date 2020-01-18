<%@ Page Language="VB" MasterPageFile="~/MasterGper.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="EditarTrabajadorContratista.aspx.vb" Inherits="EditarTrabajadorContratista" Title="GPER" %>

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
<legend>Editar Trabajador</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Rut</label>  
  <div class="col-md-5 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox 
                                        ID="TextBox8" runat="server" CssClass="form-control" ></asp:TextBox>
     </div>
  </div>
</div>
</br>

<div class="form-group">
  <label class="col-md-4 control-label">Nombre</label>  
  <div class="col-md-5 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox 
                                        ID="TextBox1" runat="server" CssClass="form-control" ></asp:TextBox>
     </div>
  </div>
</div>
</br>
<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Apellido</label> 
    <div class="col-md-5 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox 
                                        ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
   </div>
  </div>
</div>
</br>
<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">Teléfono</label>  
    <div class="col-md-5 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <asp:TextBox 
                                        ID="TextBox3" runat="server" CssClass="form-control" ></asp:TextBox>
   </div>
  </div>
</div>
</br>

<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">Cargo</label>  
    <div class="col-md-5 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <asp:TextBox 
                                        ID="TextBox4" runat="server" CssClass="form-control" ></asp:TextBox>
   </div>
  </div>
</div>
</br>
<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label">Empresa</label>  
    <div class="col-md-5 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <asp:TextBox  ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
  </div>
</div>
<br/>

<br/>
<!-- Button -->
<div id="Div1" class="form-group" runat="server">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
  <asp:Button ID="Button2" runat="server" Text="Volver" cssclass="btn btn-warning" 
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
<legend>Actualizar Documentos</legend>

<div class="form-group">
<label class="col-md-4 control-label">CDT</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File6" name="File1" runat="server" style="float: left" />
     <formaction id="Form1" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit6" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>
<div class="form-group">
<label class="col-md-4 control-label">CAFP</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File7" name="File1" runat="server" style="float: left" />
     <formaction id="Form2" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit7" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>
 <div class="form-group">
<label class="col-md-4 control-label">AFC</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File8" name="File1" runat="server" style="float: left" />
     <formaction id="Form3" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit8" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>
 <div class="form-group">
<label class="col-md-4 control-label">INP</label>  
    <div class="col-md-5 inputGroupContainer">
    <input type="file" id="File9" name="File1" runat="server" style="float: left" />
     <formaction id="Form4" enctype="multipart/form-data"   runat="server" style="float: right">    
            <input type="submit" id="Submit9" value="Subir" runat="server" name="Submit1" style="float: right" cssclass="btn btn-success" />        
    </formaction>
 </div>
 </div>
 <br/>
 <div class="form-group">
<label class="col-md-4 control-label">CCAF</label>  
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
<legend>Documentos del Trabajador</legend>

<div class="form-group">
    <div class="table-responsive">
         <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="6">
            <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-eye-open" style="color:white"></span>' ControlStyle-CssClass="btn btn-info" SelectText="Ver" ItemStyle-Width="130" />
             <asp:TemplateField HeaderText="Estado" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("Estado").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField> 
            <asp:BoundField DataField="Codigo" HeaderText="Código" ItemStyle-Width="130" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Detalle" HeaderText="Detalle" ItemStyle-Width="500" ItemStyle-Wrap="false" />
 
           
    </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
 </div>
</div>
</fieldset>
</center>



                

</div>

</asp:Content>

