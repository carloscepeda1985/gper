<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="HomeCheckGlink.aspx.vb" Inherits="HomeCheck" Title="Glink" %>

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

  <div class="container">
  <center><h3 class="widget-title">Informe de Checklists</h3></center>
        <div class="row">
                    <div class="col-md-3">
              <div class="well" style="background-color: #185189;">
                    <font color="white">
                    <div class="input-group">
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-qrcode"></span>     ID:   <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-calendar"></span>     Fecha :   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>     Rut Usuario    :   <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-stats"></span>     Porcentaje    :   <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-comment"></span>     Comentario Final   :   <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></h5>
                       <br/>
                    </font>
               </div>
               <center><asp:Button ID="Button3" runat="server" Text="Ver Foto Final" CssClass="btn btn-danger" width="80%" /></center>
            </div>

            <hr/>
            </div>
                        <div class="col-lg-9">
                <div class="media">
                    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table">
            <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-eye-open" style="color:white"></span>' ControlStyle-CssClass="btn btn-danger" SelectText="Ver" />
            <asp:TemplateField HeaderText="Respuesta" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("Respuesta").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>       
            <asp:BoundField DataField="Pregunta" HeaderText="Pregunta" ItemStyle-Width="150" ItemStyle-Wrap="false" />


    </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
 </div>
 <hr>
          <center><asp:Button ID="Button1" runat="server" Text="Volver" CssClass="btn btn-danger" width="50%" /></center>
             <br/>
              </div>
           </div>
         </div>



</asp:Content>