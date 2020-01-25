<%@ Page Language="VB" MasterPageFile="~/MasterGper.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="SolicitudGper.aspx.vb" Inherits="SolicitudGper" Title="GPER" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

<meta name="google" content="notranslate" />

<style>
    
    
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.bar
{
list-style-type:none;
height:38px;
background-image: -webkit-linear-gradient(top,#185189 0,#112f60 0%);
background-image: linear-gradient(to bottom,#185189 0,#112f60 0%);
font-size:40px;
font: 26px Tahoma, Verdana, Arial, sans-serif;
border-radius:4px;
margin-bottom:11px;
}
e.letracolor{
padding-left:20px;
color: #fff;

}

.input-group
{
        display: inline-table;
    }

</style>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<div class="bar">
    <e class="letracolor">&nbsp;Solicitud #56129873 </e>
</div>
<div class="alert alert-success">
								<strong>Atención</strong> Esta Solicitud se encuentra Aceptada.
							</div>

<div class="portlet-body">

							<div class="panel-group accordion" id="accordion1">
								<div class="panel panel-default" >
									 <a data-toggle="collapse" data-parent="#accordion1" href="#collapse_1">
									<div class="panel-heading"; style="background-color:#185189";>
                              
                                  		<h4 class="panel-title" style="color:white">
		
										Solicitud de Trabajo
										</h4>
									</div>
                                </a>
                                 
									<div id="collapse_1" class="panel-collapse in">
										<div class="panel-body">

                                        <div class="table-responsive">
<center>
<fieldset>


									<div class="form-group">
										<label class="col-md-3 control-label">Empresa Contratista</label>
										<div class="col-md-9">
											 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
  <asp:TextBox 
                                        ID="TextBox10" runat="server" CssClass="form-control" ></asp:TextBox>
     </div>
										</div>
									</div>
                        
									<div class="form-group">
										<label class="col-md-3 control-label">Resumen del trabajo</label>
										<div class="col-md-9">
											<div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
  <asp:TextBox 
                                        ID="TextBox11" runat="server" class="form-control" rows="3" TextMode="MultiLine"></asp:TextBox>
   </div>
										</div>
									</div>
                          
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">Sector</label>
										<div class="col-md-9">
											 <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-screenshot"></i></span>
  <asp:TextBox 
                                        ID="TextBox12" runat="server" CssClass="form-control" style="width:50%" ></asp:TextBox>
   </div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">Fecha Inicio</label>
										<div class="col-md-9">
											 <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  <asp:TextBox 
                                        ID="TextBox13" runat="server" CssClass="form-control" style="width:50%"></asp:TextBox>
   </div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">Fecha Fin</label>
										<div class="col-md-9">
											<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  <asp:TextBox  ID="TextBox14" runat="server" CssClass="form-control" style="width:50%"></asp:TextBox>
    </div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">Hora Entrada</label>
										<div class="col-md-9">
											<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
  <asp:TextBox  ID="TextBox15" runat="server" CssClass="form-control" style="width:50%"></asp:TextBox>
   </div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">Duración</label>
										<div class="col-md-9">
											<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-hourglass"></i></span>
  <asp:TextBox  ID="TextBox16" runat="server" CssClass="form-control" style="width:50%"></asp:TextBox>
    </div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">Teléfono Empergencia</label>
										<div class="col-md-9">
											<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
  <asp:TextBox  ID="TextBox17" runat="server" CssClass="form-control" style="width:50%"></asp:TextBox>
    </div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">Email</label>
										<div class="col-md-9">
										<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <asp:TextBox  ID="TextBox18" runat="server" CssClass="form-control" style="width:50%"></asp:TextBox>
    </div>
										</div>
									</div>

<br/>

<br/>


</fieldset>
</center>
 <br/>
                

</div>
                                            






                                  	    </div>
									</div>
								</div>
								<div class="panel panel-default">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse_2">
									<div class="panel-heading"; style="background-color:#185189";>
                              
                                  		<h4 class="panel-title" style="color:white">
		
										Encargado
										</h4>
									</div>
                                </a>
                                 
									<div id="collapse_2" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												 Duis autem vel eum iriure dolor in hendrerit in vulputate. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut.
											</p>
											<p>
												 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
											</p>
                                            	<class="btn btn-info" data-toggle="collapse" data-parent="#accordion1" href="#collapse_2" >Activate this section via URL
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									   <a data-toggle="collapse" data-parent="#accordion1" href="#collapse_3">
									<div class="panel-heading"; style="background-color:#185189";>
                              
                                  		<h4 class="panel-title" style="color:white">
		
										Trabajadores
										</h4>
									</div>
                                </a>
                                 
									<div id="collapse_3" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												 Duis autem vel eum iriure dolor in hendrerit in vulputate. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut.
											</p>
											<p>
												 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
											</p>
                                            	<class="btn btn-info" data-toggle="collapse" data-parent="#accordion1" href="#collapse_2" >Activate this section via URL
										</div>
									</div>
								</div>							
							</div>
						</div>



</asp:Content>

