<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="ChecklistGlink.aspx.vb" Inherits="ChecklistGper" Title="Glink" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script language="javascript" type="text/javascript">
// <![CDATA[

        function File1_onclick() {
          
        }

// ]]>
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<style type="text/css">
    
    .checkbox
        {
            padding-left: 20px;
        }
        .checkbox label
        {
            display: inline-block;
            vertical-align: middle;
            position: relative;
            padding-left: 5px;
        }
        .checkbox label::before
        {
            content: "";
            display: inline-block;
            position: absolute;
            width: 17px;
            height: 17px;
            left: 0;
            margin-left: -20px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            background-color: #fff;
            -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
        }
        .checkbox label::after
        {
            display: inline-block;
            position: absolute;
            width: 16px;
            height: 16px;
            left: 0;
            top: 0;
            margin-left: -20px;
            padding-left: 3px;
            padding-top: 1px;
            font-size: 11px;
            color: #555555;
        }
        .checkbox input[type="checkbox"]
        {
            opacity: 0;
            z-index: 1;
        }
     
      
        .checkbox-primary input[type="checkbox"]:checked + label::before
        {
            background-color: #00C851;
            border-color: #00C851;
        }
        .checkbox-primary input[type="checkbox"]:checked + label::after
        {
            color: #fff;
        }
    
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
  border-color: #0559a2
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
     
     .state-icon {
    left: -5px;
}
.list-group-item-primary {
    color: rgb(255, 255, 255);
    background-color: rgb(66, 139, 202);
}

/* DEMO ONLY - REMOVES UNWANTED MARGIN */
.well .list-group {
    margin-bottom: 0px;
}
     
 </style>

<!-- Page Content -->
<div class="container">

<div class="table-responsive">

<fieldset>
<legend><center>Responda la afirmación</center></legend>
    <center>
    <strong>
    <asp:Label ID="Label3" runat="server" Font-Size="Medium"></asp:Label>
    </strong>
    </center>
    <br/>
    <center>
     <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" GroupName="check" Text ="SI" CssClass="custom-control-input" oncheckedchanged="RadioButton1_CheckedChanged" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
     <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" GroupName="check" Text ="NO" CssClass="custom-control-input" oncheckedchanged="RadioButton2_CheckedChanged" />
    </center>
    <br/>
    <asp:Panel ID="Panel1" runat="server" Visible = "false">
    <strong><asp:Label ID="Label6" runat="server" Font-Size="Medium">&nbsp&nbsp Ingrese Comentario*</asp:Label></strong>
    &nbsp&nbsp <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" TextMode="MultiLine" CssClass="form-control" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
  
           <br/>
            <strong><asp:Label ID="Label7" runat="server" AutoPostBack="True" Font-Size="Medium" >&nbsp&nbsp Ingrese Foto</asp:Label></strong>
      <center><input type="file" id="File1" name="File1" runat="server" onclick="return File1_onclick()" /></center>

    
    </asp:Panel>
    <br/>
    <br/>


  <div id="Div1" class="form-group" runat="server">
  <center>
  <asp:Button ID="Button2" runat="server" Text="Cancelar" Width="107px" cssclass="btn btn-success"/>
  &nbsp&nbsp&nbsp<asp:Button ID="Button1" runat="server" Text="Enviar Datos" Width="107px" cssclass="btn btn-success"/>
 </center>
</div>


</fieldset>

</div>
<strong>ID Equipo:
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;- Usuario:
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;- ID:
    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
&nbsp;- Tipo:
    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
&nbsp;- Porcentaje:
    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="Label5" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="Label11" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="Label12" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="Label13" runat="server" Text="Label" Visible="false"></asp:Label>
</strong>
</div>
    
</asp:Content>

