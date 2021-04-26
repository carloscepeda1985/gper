<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="SolicitudTieGlink.aspx.vb" Inherits="SolicitudCon" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <style type="text/css">
        table {
            border: solid 1px black;
            border-collapse: collapse;
        }

        td {
            border: solid 1px black;
        }

        th {
            border: solid 1px black;
        }
    </style>

 
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

.input-group
{
        display: inline-table;
    }


</style>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts>
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
		</Scripts>
	</telerik:RadScriptManager>



<div class="bar">
    <e class="letracolor">&nbsp;Solicitud #<asp:Label ID="LabelNumero" runat="server"></asp:Label> </e>
</div>
<div id="alerta" style="font-size=12pt" runat="server">
<p>
		<strong>Atención:</strong> Esta Solicitud se encuentra <strong>
            <asp:Label ID="LabelEstado" runat="server"></asp:Label></strong>
        </p>
    
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

                                     
<center>
<fieldset>


									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Empresa Contratista</label>
										<div class="col-md-9">
											 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
  <asp:TextBox
                                        ID="TextBox10" runat="server" CssClass="form-control"  Font-Size="12pt" ></asp:TextBox>
     </div>
										</div>
									</div>
                              
                        
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Resumen del trabajo</label>
										<div class="col-md-9">
											<div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
  <asp:TextBox 
                                        ID="TextBox11" runat="server" class="form-control" rows="3" TextMode="MultiLine"  Font-Size="12pt"></asp:TextBox>
   </div>
										</div>
									</div>
                          
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Lugar</label>
										<div class="col-md-9">
											 <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-screenshot"></i></span>
  <asp:TextBox 
                                        ID="TextBox12" runat="server" CssClass="form-control" style="width:220px"  Font-Size="12pt" ></asp:TextBox>
   </div>
										</div>
									</div>


                                    									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Fecha Inicio</label>
										<div class="col-md-9">
											 <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
        <telerik:RadDatePicker ID="RadDatePicker2" runat="server" DateInput-Font-Size="12" Skin="Metro" Style="float:left" ></telerik:RadDatePicker>
 
   </div>
										</div>
									</div>

																		<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Fecha Fin</label>
										<div class="col-md-9">
											 <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
        <telerik:RadDatePicker ID="RadDatePicker1" runat="server" DateInput-Font-Size="12" Skin="Metro" Style="float:left" ></telerik:RadDatePicker>
 
   </div>
										</div>
									</div>
                                    <br/>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Hora Entrada</label>
										<div class="col-md-9">
											<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
  <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" style="width:76px"  Font-Size="12pt">
         <asp:ListItem Enabled="true" Text="0" Value="0"></asp:ListItem>
         <asp:ListItem Enabled="true" Text="1" Value="1"></asp:ListItem>     
         <asp:ListItem Enabled="true" Text="2" Value="2"></asp:ListItem>    
         <asp:ListItem Enabled="true" Text="3" Value="3"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="4" Value="4"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="5" Value="5"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="6" Value="6"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="7" Value="7"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="8" Value="8"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="9" Value="9"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="10" Value="10"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="11" Value="11"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="12" Value="12"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="13" Value="13"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="14" Value="14"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="15" Value="15"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="16" Value="16"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="17" Value="17"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="18" Value="18"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="19" Value="19"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="20" Value="20"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="21" Value="21"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="22" Value="22"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="23" Value="23"></asp:ListItem> 
        </asp:DropDownList>
        <div style="border-top: 6px solid transparent; border-left: 4px solid transparent; border-right: 4px solid transparent; float:left;"> <strong>: </strong> 
        </div>
         <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" style="width:76px"  Font-Size="12pt">
         <asp:ListItem Enabled="true" Text="0" Value="0"></asp:ListItem>
         <asp:ListItem Enabled="true" Text="15" Value="15"></asp:ListItem>     
         <asp:ListItem Enabled="true" Text="30" Value="30"></asp:ListItem>    
         <asp:ListItem Enabled="true" Text="45" Value="45"></asp:ListItem> 
        </asp:DropDownList>
   </div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Duración</label>
										<div class="col-md-9">
											<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-hourglass"></i></span>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" style="width:76px"  Font-Size="12pt">
         <asp:ListItem Enabled="true" Text="0" Value="0"></asp:ListItem>
         <asp:ListItem Enabled="true" Text="1" Value="1"></asp:ListItem>     
         <asp:ListItem Enabled="true" Text="2" Value="2"></asp:ListItem>    
         <asp:ListItem Enabled="true" Text="3" Value="3"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="4" Value="4"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="5" Value="5"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="6" Value="6"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="7" Value="7"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="8" Value="8"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="9" Value="9"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="10" Value="10"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="11" Value="11"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="12" Value="12"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="13" Value="13"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="14" Value="14"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="15" Value="15"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="16" Value="16"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="17" Value="17"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="18" Value="18"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="19" Value="19"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="20" Value="20"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="21" Value="21"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="22" Value="22"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="23" Value="23"></asp:ListItem> 
         <asp:ListItem Enabled="true" Text="Todo el Dia" Value="24"></asp:ListItem> 
        </asp:DropDownList>
        <div style="border-top: 6px solid transparent; float:left;">&nbsp Hrs.
        </div>
    </div> 
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Teléfono Empergencia</label>
										<div class="col-md-9">
											<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
  <asp:TextBox  ID="TextBox17" runat="server" CssClass="form-control" style="width:220px"  Font-Size="12pt"></asp:TextBox>
    </div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Email</label>
										<div class="col-md-9">
										<div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <asp:TextBox  ID="TextBox18" runat="server" CssClass="form-control" style="width:220px" Font-Size="12pt"></asp:TextBox>
    </div>
										</div>
									</div>


</fieldset>
</center>
    

                                            

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

                                                                             
<center>
<fieldset>


									<div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Rut</label>
										<div class="col-md-9">
											 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span>
  <asp:TextBox 
                                        ID="TextBox1" runat="server" CssClass="form-control"  Font-Size="12pt" style="width:220px"  ></asp:TextBox>
     </div>
										</div>
									</div>
                              


                              <div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Nombre</label>
										<div class="col-md-9">
											 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox 
                                        ID="TextBox2" runat="server" CssClass="form-control"  Font-Size="12pt" style="width:220px" ></asp:TextBox>
     </div>
										</div>
									</div>
                        

                        <div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Apellido</label>
										<div class="col-md-9">
											 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox 
                                        ID="TextBox3" runat="server" CssClass="form-control"  Font-Size="12pt" style="width:220px"  ></asp:TextBox>
     </div>
										</div>
									</div>


                                    <div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Mutual</label>
										<div class="col-md-9">
											 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-plus-sign"></i></span>

  <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" style="width:220px"  Font-Size="12pt">
                 <asp:ListItem Enabled="true" Text="Seleccione una mutual..." Value=""></asp:ListItem>
                 <asp:ListItem Enabled="true" Text="ACHS" Value="ACHS"></asp:ListItem>     
                 <asp:ListItem Enabled="true" Text="Mutual de Seguridad" Value="Mutual de Seguridad"></asp:ListItem>      
              </asp:DropDownList>
 
     </div>
										</div>
									</div>

                                    <div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Celular</label>
										<div class="col-md-9">
											 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
  <asp:TextBox 
                                        ID="TextBox5" runat="server" CssClass="form-control"  Font-Size="12pt" style="width:220px" ></asp:TextBox>
     </div>
										</div>
									</div>

                                    <div class="form-group">
										<label class="col-md-3 control-label" style="float:left">&nbsp&nbsp&nbsp Email</label>
										<div class="col-md-9">
											 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <asp:TextBox 
                                        ID="TextBox6" runat="server" CssClass="form-control"  Font-Size="12pt" style="width:220px" ></asp:TextBox>
     </div>
										</div>
									</div>




</fieldset>
</center>



											
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
											
     <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="6">
            <Columns>
            <asp:BoundField DataField="Rut" HeaderText="Rut" ItemStyle-Width="130" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Numero" HeaderText="Teléfono" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Cargo" HeaderText="Cargo" ItemStyle-Width="150" ItemStyle-Wrap="false" />
 
            <asp:TemplateField HeaderText="CDT" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CDT").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CAFP" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CAFP").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="AFC" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("AFC").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="INP" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("INP").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CCAF" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CCAF").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

    </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
 </div>
</div>
									</div>
								</div>	
                                <div class="panel panel-default">
									   <a data-toggle="collapse" data-parent="#accordion1" href="#collapse_4">
									<div class="panel-heading"; style="background-color:#185189";>
                              
                                  		<h4 class="panel-title" style="color:white">
		
						                Aprobaciones
										</h4>
									</div>
                                </a>
                                 
									<div id="collapse_4" class="panel-collapse collapse">
										<div class="panel-body">
											
<div class="alert alert-warning" role="alert" id="Div1" style="font-size:12pt; width:70%;" runat="server">

		<small><strong>Enviada por: </strong><asp:Label ID="lbl_enviada" runat="server"></asp:Label></small><br />
        <small><strong>Fecha envío: </strong><asp:Label ID="lbl_fecha" runat="server"></asp:Label></small><br />
        <small><strong>Comentario: </strong><asp:Label ID="lbl_comentario" runat="server"></asp:Label></small>
               
</div>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img alt="flecha" src="Images/flecha_n.png" style=" float:left; margin-left: 33px;"/>

<div role="alert" id="Div2" style="font-size:12pt; float:left; width:70%;" runat="server">

    <p id="p1" runat="server">
        <small><strong>Enviada por: </strong><asp:Label ID="lbl_renviada" runat="server"></asp:Label></small><br />
        <small><strong>Fecha envío: </strong><asp:Label ID="lbl_rfecha" runat="server"></asp:Label></small><br />
        <small><strong>Comentario: </strong><asp:Label ID="lbl_rcomentario" runat="server"></asp:Label></small>
    </p>
    <p id="p2" runat="server">
        <small><strong>&#9432; Información: </strong> Esta solicitud NO ha sido Aprobada o Rechazada por la Administración</small>
       
    </p>
		
       
</div>


</div>
									</div>
								</div>	
                                
      
                                
                                
                                
								<div class="panel panel-default">
									   <a data-toggle="collapse" data-parent="#accordion1" href="#collapse_4">
									<div class="panel-heading"; style="background-color:#185189";>
                              
                                  		<h4 class="panel-title" style="color:white">
		
										Accesos
										</h4>
									</div>
                                </a>
                                 
									<div id="collapse_4" class="panel-collapse collapse">
										<div class="panel-body">


                                          <div class="table-responsive">
        <asp:GridView ID="GridView2" runat="server" Width="100%" 
            CssClass="table table-bordered bs-table"  AllowPaging="True" PageSize="6" >
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" 
                    SelectImageUrl="~/editar.png" ControlStyle-CssClass="btn btn-info" SelectText="Ver"  HeaderText='<span class="glyphicon glyphicon-eye-open" style="color:white"></span>' />
            </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
    </div>


											
                                        </div>
									</div>
								</div>	
                                
                                
                                
                                
                                						
							</div>
						</div>
                     <center> <asp:Button ID="Button2" runat="server"  Text="volver" class="btn btn-info btn-lg btn-block"  width="40%" /> 
                          <asp:Label ID="id_mall" runat="server" Visible="False"></asp:Label>
                         <asp:Label ID="id_contratista" runat="server" Visible="False"></asp:Label>
                     </center>
                        
    <br/>

</asp:Content>

