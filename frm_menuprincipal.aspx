<%@ Page Language="VB" MasterPageFile="~/Site_residente.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="frm_menuprincipal.aspx.vb" Inherits="frm_menuprincipal" Title="YouSoft" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<style type="text/css">
    .btn-sample {
 color: #FFFFFF;
  background-color: #558551;
  border-color: #558551;
}


.btn-sample:focus,
.btn-sample:active,
.btn-sample.active,
.open .dropdown-toggle.btn-sample {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #123740;
}

 .btn-info {
 color: #FFFFFF;
  background-color: #2c777a;
  border-color: #2c777a;
}


.btn-info:focus,
.btn-info:active,
.btn-info.active,
.open .dropdown-toggle.btn-info {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #2c777a;
}



 .btn-primary {
 color: #FFFFFF;
  background-color: #3ca3a0;
  border-color: #3ca3a0;
}


.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open .dropdown-toggle.btn-primary {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #3ca3a0;
}



 .btn-warning {
 color: #FFFFFF;
  background-color: #1f3a4d;
  border-color: #1f3a4d;
}


.btn-warning:focus,
.btn-warning:active,
.btn-warning.active,
.open .dropdown-toggle.btn-warning {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #ff8029;
}



 .btn-danger {
 color: #FFFFFF;
  background-color: #3e7e7e;
  border-color: #3e7e7e;
}


.btn-danger:focus,
.btn-danger:active,
.btn-danger.active,
.open .dropdown-toggle.btn-danger {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #f94007;
}




 .btn-success {
 color: #FFFFFF;
  background-color: #a02c15;
  border-color: #a02c15;
}


.btn-success:focus,
.btn-successr:active,
.btn-success.active,
.open .dropdown-toggle.btn-success {
  color: #FFFFFF;
  background-color: #72CFBF;
  border-color: #a02c15;
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


    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <!-- Blog Post Content Column -->
            <div class="col-lg-8">

              
               <!-- Comments Form -->
                <div class="well">
                    <center><h4><asp:Label ID="Label1" runat="server" Text="Condominio"></asp:Label></h4></center>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>   Admin.:   <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-earphone"></span>   Teléfono :   <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-envelope"></span>   Email    :   <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-link"></span>   Rut    :   <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-usd"></span>   Cuenta Cte.    :   <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></h5>
                    
                    <form role="form">
                        
                    </form>
                </div>
               
                <hr>

                <!-- Posted Comments -->

                <!-- Comment -->
                <div class="media">
                <ul class="nav nav-pills nav-stacked" background="#E9801E">

                   <li><asp:Button ID="Button1" runat="server" Text="Permitir Accesos" class="btn btn-warning btn-lg btn-block"/></li> 
                   <li><asp:Button ID="Button2" runat="server" Text="Ver Accesos"  class="btn btn-danger btn-lg btn-block"/></li> 
                   <li><asp:Button ID="Button4" runat="server" Text="Abrir Entrada" class="btn btn-sample btn-lg btn-block"/></li> 
                   <li><asp:Button ID="Button5" runat="server" Text="Abrir Salida"  class="btn btn-success btn-lg btn-block"/></li> 
                   <li><asp:Button ID="Button6" runat="server" Text="Botón de Pánico"  class="btn btn-success btn-lg btn-block"/></li> 
                       
                </ul>               
    
              </div>

                <hr>

            </div>

            <!-- Blog Sidebar Widgets Column -->
            <div class="col-md-4">

                <!-- Blog Search Well -->
                <div class="well">
                    <center><h4>Tu Perfil</h4></center>
                    <div class="input-group">
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>   Nombres:   <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-user"></span>   Apellidos :   <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-envelope"></span>   Email    :   <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-earphone"></span>   Teléfono    :   <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-home"></span>   Sitio/Torre   :   <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></h5>
                    <h5>&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-home"></span>   Casa/Depto.   :   <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></h5>
                       <br>
                    
                     </div>
                      <center><asp:Button ID="Button3" runat="server" Text="Editar Cuenta" CssClass="btn btn-info" width="80%" /></center>
                    <!-- /.input-group -->
                </div>

                <!-- Blog Categories Well 
                <div class="well">
                    <h4>Blog Categories</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    /.row -->
                </div>

               

            </div>

        </div>
        <!-- /.row -->


    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


</asp:Content>
