<%@ Page Language="VB" MasterPageFile="~/MasterSolicitud.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="CrearSolicitudGper.aspx.vb" Inherits="CrearSolicitudGper" Title="GPER" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div class="page">   
        <div class="row">
				<div class="col-md-12" style="width:98%; margin:18px auto; margin-left:12px;">  
					<div class="portlet" id="form_wizard_1">
                        <div class="portlet-body form">
		
                            <asp:Button ID="myBtn" runat="server" OnClick="myBtn_Click" useSubmitBehavior="false" style="display:none;" />
                           
								<div class="form-wizard">
									<div class="form-body">
										<ul class="nav nav-pills nav-justified steps">
											<li>
												<a href="#tab1" data-toggle="tab" class="step">
												<span class="number">
													 1
												</span>
												<span class="desc">
													<i class="fa fa-check"></i> Solicitud
												</span>
												</a>
											</li>
											<li>
												<a href="#tab2" data-toggle="tab" class="step">
												<span class="number">
													 2
												</span>
												<span class="desc">
													<i class="fa fa-check"></i> Encargado
												</span>
												</a>
											</li>
											<li>
												<a href="#tab3" data-toggle="tab" class="step active">
												<span class="number">
													 3
												</span>
												<span class="desc">
													<i class="fa fa-check"></i> Trabajadores
												</span>
												</a>
											</li>
											<li>
												<a href="#tab4" data-toggle="tab" class="step">
												<span class="number">
													 4
												</span>
												<span class="desc">
													<i class="fa fa-check"></i> Confirmar 
												</span>
												</a>
											</li>
										</ul>
										<div id="bar" class="progress progress-striped" role="progressbar">
											<div class="progress-bar progress-bar-success">
											</div>
										</div>
										<div class="tab-content">
											<div class="alert alert-danger display-none">
												<button class="close" runat="server" data-close="alert" ></button>
												Tienes algunos errores en el formulario. Por favor verifique.
											</div>
											<div class="alert alert-success display-none">
												<button class="close" data-close="alert"></button>
												¡La validación de su formulario fue exitosa!
											</div>
											<div class="tab-pane active" id="tab1">
												<h3 class="block">Ingrese los datos de la solicitud</h3>


												<div class="form-group">
													<label class="control-label col-md-3">Empresa Contratista
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="empcon" id="empcon" />
														<span class="help-block">
															 Ingrese nombre de empresa contratista
														</span>
													</div>
												</div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Resumen del trabajo</label>
													<div class="col-md-4">
														<textarea class="form-control" rows="3" name="restra" id="restra"></textarea>
													</div>
												</div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Lugar
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="lug" id="lug"/>
														<span class="help-block">
															 Ingrese el lugar del trabajo 
														</span>
													</div>
												</div>

                                                <div class="form-group">
										            <label class="control-label col-md-3">Fecha Inicio</label>
										            <div class="col-md-3">
											        <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy" data-date-start-date="+0d">
												    <input type="text" class="form-control" readonly  name="fecini" id="fecini"/>
												    <span class="input-group-btn">
													<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
												    </span>
											        </div>
											
											        <span class="help-block">
												    Seleccione fecha inicio del trabajo
											        </span>
										            </div>
									            </div>

                                                <div class="form-group">
										            <label class="control-label col-md-3">Fecha Fin</label>
										            <div class="col-md-3">
											        <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy" data-date-start-date="+0d" >
												    <input type="text" class="form-control" readonly name="fecfin" id="fecfin" />
												    <span class="input-group-btn">
													<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
												    </span>
											        </div>
											
											        <span class="help-block">
												    Seleccione fecha fin del trabajo
											        </span>
										            </div>
									            </div>

                                                <div class="form-group">
										            <label class="control-label col-md-3">Hora Entrada</label>
										            <div class="col-md-3">
											        <div class="input-group bootstrap-timepicker">
												    <input type="text" class="form-control timepicker-24" name="horent" id="horent"/>
												    <span class="input-group-btn">
													<button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button>
												    </span>
											        </div>
										            </div>
									            </div>

                                                <div class="form-group">
										            <label class="control-label col-md-3">Duración</label>
										            <div class="col-md-9">
											        <div id="spinner3">
												    <div class="input-group" style="width:130px;">
													<input type="text" class="spinner-input form-control" maxlength="3" name="dur" id="dur" />
													<div class="spinner-buttons input-group-btn">
														<button type="button" class="btn btn-default spinner-up">
														<i class="fa fa-angle-up"></i>
														</button>
														<button type="button" class="btn btn-default spinner-down">
														<i class="fa fa-angle-down"></i>
														</button>
													</div>
												    </div>
											        </div>
											        <span class="help-block">
												     Máximo 10 hrs.
											        </span>
										            </div>
									            </div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Teléfono Emergencia
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="teleme" id="teleme"/>
														<span class="help-block">
															 Ingrese el teléfono de emergancia
														</span>
													</div>
												</div>


												<div class="form-group">
													<label class="control-label col-md-3">Email
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="ema" id="ema"/>
														<span class="help-block">
															 Ingrese su email
														</span>
													</div>
												</div>
											</div>


											<div class="tab-pane" id="tab2">
												<h3 class="block">Ingrese datos del Encargado</h3>

												<div class="form-group">
													<label class="control-label col-md-3">RUT
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="rutenc" id="rutenc"/>
														<span class="help-block">
															 Ingrese RUT del encargado
														</span>
													</div>
												</div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Nombre
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="nomenc" id="nomenc"/>
														<span class="help-block">
															 Ingrese nombre del encargado
														</span>
													</div>
												</div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Apellido
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="apeenc" id="apeenc"/>
														<span class="help-block">
															 Ingrese apellido del encargado
														</span>
													</div>
												</div>


                                                <div class="form-group">
													<label class="control-label col-md-3">Mutual
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<select class="form-control" name="mutenc" id="mutenc">
											            <option>ACHS</option>
											            <option>Mutual de Seguridad</option>
										                </select>
														<span class="help-block">
															 Seleccione mutual de encargado
														</span>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-md-3">N° Celular
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="celenc" id="celenc"/>
														<span class="help-block">
															 Ingrese n° celular del encargado
														</span>
													</div>
												</div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Email
													<span class="required">
														 *
													</span>
													</label>
													<div class="col-md-4">
														<input type="text" class="form-control" name="emaenc" id="emaenc"/>
														<span class="help-block">
															 Ingrese email del encargado
														</span>
													</div>
												</div>
											</div>


											<div class="tab-pane" id="tab3">
												<h3 class="block">Ingrese Trabajadores</h3>

                                                     <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="6">
            <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-edit" style="color:white"></span>' ControlStyle-CssClass="btn btn-info" SelectText="Editar" />
            <asp:BoundField DataField="Rut" HeaderText="Rut" ItemStyle-Width="130" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Numero" HeaderText="Teléfono" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Cargo" HeaderText="Cargo" ItemStyle-Width="150" ItemStyle-Wrap="false" />
 
            <asp:TemplateField HeaderText="CDT" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CDT").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CAFP" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CAFP").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="AFC" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("AFC").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="INP" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("INP").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CCAF" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CCAF").ToString() = "P", "P.png", "A.png")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

    </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
 </div>								
										
											</div>
											<div class="tab-pane" id="tab4">
												<h3 class="block">Confirme su Solicitud</h3>
												<h4 class="form-section">Detalle de la Solicitud</h4>
												<div class="form-group">
													<label class="control-label col-md-3">Empresa Contratista:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="empcon">
														</p>
                                                        <asp:Label ID="Label1" runat="server"></asp:Label>
													</div>
												</div>
                                                <div class="form-group">
													<label class="control-label col-md-3">Resumen del trabajo:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="restra">
														</p>
                                                        <asp:Label ID="Label2" runat="server"></asp:Label>
													</div>
												</div>
                                                <div class="form-group">
													<label class="control-label col-md-3">Lugar:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="lug">
														</p>
                                                        <asp:Label ID="Label3" runat="server"></asp:Label>
													</div>
												</div>
                                                <div class="form-group">
													<label class="control-label col-md-3">Fecha Inicio:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="fecini">
														</p>
                                                        <asp:Label ID="Label4" runat="server"></asp:Label>
													</div>
												</div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Fecha Fin:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="fecfin">
														</p>
                                                        <asp:Label ID="Label5" runat="server"></asp:Label>
													</div>
												</div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Hora Entrada:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="horent">
														</p>
                                                        <asp:Label ID="Label6" runat="server"></asp:Label>
													</div>
												</div>
                                                <div class="form-group">
													<label class="control-label col-md-3">Duración:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="dur">&nbsp Hrs.
														</p>
                                                        <asp:Label ID="Label7" runat="server"></asp:Label>
													</div>
												</div>

                                                <div class="form-group">
													<label class="control-label col-md-3">Teléfono Emergencia:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="teleme">
														</p>
                                                        <asp:Label ID="Label8" runat="server"></asp:Label>
													</div>
												</div>
                                                
												<div class="form-group">
													<label class="control-label col-md-3">Email:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="ema">
														</p>
													</div>
												</div>

												<h4 class="form-section">Datos del Encargado</h4>
												<div class="form-group">
													<label class="control-label col-md-3">Rut:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="rutenc">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Nombre:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="nomenc">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Apellido:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="apeenc">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Mutual:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="mutenc">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Celular:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="celenc">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Email:</label>
													<div class="col-md-4">
														<p class="form-control-static" data-display="emaenc">
														</p>
													</div>
												</div>

												<h4 class="form-section">Trabajadores</h4>
												<div class="form-group">
													<label class="control-label col-md-3">Listado de Trabajadores:</label>
													<div class="col-md-4">
                                                        <asp:HiddenField ID="Hempcon" runat="server" />	
                                                        <asp:HiddenField ID="Hrestra" runat="server" />		
                                                        <asp:HiddenField ID="Hlug" runat="server" />	
                                                        <asp:HiddenField ID="Hfecini" runat="server" />	
                                                        <asp:HiddenField ID="Hfecfin" runat="server" />	
                                                        <asp:HiddenField ID="Hhorent" runat="server" />	
                                                        <asp:HiddenField ID="Hdur" runat="server" />	
                                                        <asp:HiddenField ID="Hteleme" runat="server" />	
                                                        <asp:HiddenField ID="Hema" runat="server" />	
                                                        <asp:HiddenField ID="Hrutenc" runat="server" />	
                                                        <asp:HiddenField ID="Hnomenc" runat="server" />	
                                                        <asp:HiddenField ID="Hapeenc" runat="server" />	
                                                        <asp:HiddenField ID="Hmutenc" runat="server" />	
                                                        <asp:HiddenField ID="Hcelenc" runat="server" />	
                                                        <asp:HiddenField ID="Hemaenc" runat="server" />	
                                                  										
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="form-actions fluid">
										<div class="row">
											<div class="col-md-12">
												<div class="col-md-offset-3 col-md-9" style="margin:0px auto;">
													&nbsp&nbsp<a href="javascript:;" class="btn btn-default button-previous">
													<i class="m-icon-swapleft"></i> Volver </a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
													<a href="javascript:;" class="btn btn-info button-next">
													Continuar <i class="m-icon-swapright m-icon-white"></i>
													</a>
													<a href="javascript:;" class="btn btn-success button-submit">
													Enviar <i class="m-icon-swapright m-icon-white"></i>
													</a>&nbsp
                                         

												</div>
											</div>
										</div>
									</div>
								</div>
							
						</div>
                </div>
            </div>
          </div>
        </div>

       <script type="text/javascript">

           var FormWizard = function () {


               return {
                   //main function to initiate the module
                   init: function () {
                       if (!jQuery().bootstrapWizard) {
                           return;
                       }

                       function format(state) {
                           if (!state.id) return state.text; // optgroup
                           return "<img class='flag' src='assets/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
                       }

                       $("#country_list").select2({
                           placeholder: "Select",
                           allowClear: true,
                           formatResult: format,
                           formatSelection: format,
                           escapeMarkup: function (m) {
                               return m;
                           }
                       });

                       var form = $('#submit_form');
                       var error = $('.alert-danger', form);
                       var success = $('.alert-success', form);

                       form.validate({
                           doNotHideMessage: true, //this option enables to show the error/success messages on tab switch.
                           errorElement: 'span', //default input error message container
                           errorClass: 'help-block', // default input error message class
                           focusInvalid: false, // do not focus the last invalid input
                           rules: {
                               //account
                               username: {
                                   minlength: 5,
                                   required: false
                               },
                               password: {
                                   minlength: 5,
                                   required: false
                               },
                               rpassword: {
                                   minlength: 5,
                                   required: false,
                                   equalTo: "#submit_form_password"
                               },
                               //profile
                               fullname: {
                                   required: false
                               },
                               email: {
                                   required: false,
                                   email: true
                               },
                               phone: {
                                   required: false
                               },
                               gender: {
                                   required: false
                               },
                               address: {
                                   required: false
                               },
                               city: {
                                   required: false
                               },
                               country: {
                                   required: false
                               },
                               //payment
                               card_name: {
                                   required: false
                               },
                               card_number: {
                                   minlength: 16,
                                   maxlength: 16,
                                   required: false
                               },
                               card_cvc: {
                                   digits: true,
                                   required: false,
                                   minlength: 3,
                                   maxlength: 4
                               },
                               card_expiry_date: {
                                   required: false
                               },
                               'payment[]': {
                                   required: false,
                                   minlength: 1
                               }
                           },

                           messages: { // custom messages for radio buttons and checkboxes
                               'payment[]': {
                                   required: "Please select at least one option",
                                   minlength: jQuery.format("Please select at least one option")
                               }
                           },

                           errorPlacement: function (error, element) { // render error placement for each input type
                               if (element.attr("name") == "gender") { // for uniform radio buttons, insert the after the given container
                                   error.insertAfter("#form_gender_error");
                               } else if (element.attr("name") == "payment[]") { // for uniform radio buttons, insert the after the given container
                                   error.insertAfter("#form_payment_error");
                               } else {
                                   error.insertAfter(element); // for other inputs, just perform default behavior
                               }
                           },

                           invalidHandler: function (event, validator) { //display error alert on form submit   
                               success.hide();
                               error.show();
                               App.scrollTo(error, -200);
                           },

                           highlight: function (element) { // hightlight error inputs
                               $(element)
                        .closest('.form-group').removeClass('has-success').addClass('has-error'); // set error class to the control group
                           },

                           unhighlight: function (element) { // revert the change done by hightlight
                               $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                           },

                           success: function (label) {
                               if (label.attr("for") == "gender" || label.attr("for") == "payment[]") { // for checkboxes and radio buttons, no need to show OK icon
                                   label
                            .closest('.form-group').removeClass('has-error').addClass('has-success');
                                   label.remove(); // remove error label here
                               } else { // display success icon for other inputs
                                   label
                            .addClass('valid') // mark the current input as valid and display OK icon
                        .closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                               }
                           },

                           submitHandler: function (form) {
                               success.show();
                               error.hide();
                               //add here some ajax code to submit your form or just call form.submit() if you want to submit the form without ajax

                           }

                       });

                       var displayConfirm = function () {
                           $('#tab4 .form-control-static', form).each(function () {
                               var input = $('[name="' + $(this).attr("data-display") + '"]', form);
                               if (input.is(":text") || input.is("textarea")) {
                                   $(this).html(input.val());
                               } else if (input.is("select")) {
                                   $(this).html(input.find('option:selected').text());
                               } else if (input.is(":radio") && input.is(":checked")) {
                                   $(this).html(input.attr("data-title"));
                               } else if ($(this).attr("data-display") == 'payment') {
                                   var payment = [];
                                   $('[name="payment[]"]').each(function () {
                                       payment.push($(this).attr('data-title'));
                                   });
                                   $(this).html(payment.join("<br>"));
                               }
                           });
                       }

                       var handleTitle = function (tab, navigation, index) {
                           var total = navigation.find('li').length;
                           var current = index + 1;
                           // set wizard title
                           $('.step-title', $('#form_wizard_1')).text('Step ' + (index + 1) + ' of ' + total);
                           // set done steps
                           jQuery('li', $('#form_wizard_1')).removeClass("done");
                           var li_list = navigation.find('li');
                           for (var i = 0; i < index; i++) {
                               jQuery(li_list[i]).addClass("done");
                           }

                           if (current == 1) {
                               $('#form_wizard_1').find('.button-previous').hide();
                           } else {
                               $('#form_wizard_1').find('.button-previous').show();
                           }

                           if (current >= total) {
                               $('#form_wizard_1').find('.button-next').hide();
                               $('#form_wizard_1').find('.button-submit').show();
                               displayConfirm();
                           } else {
                          //     this.Function
                          //     document.getElementById('myuserlabel').innerHTML = 'your tip has been submitted!';

                               $('#form_wizard_1').find('.button-next').show();
                               $('#form_wizard_1').find('.button-submit').hide();
                           }
                           App.scrollTo($('.page-title'));
                       }

                       // default form wizard
                       $('#form_wizard_1').bootstrapWizard({
                           'nextSelector': '.button-next',
                           'previousSelector': '.button-previous',
                           onTabClick: function (tab, navigation, index, clickedIndex) {
                               success.hide();
                               error.hide();
                               if (form.valid() == false) {
                                   return false;
                               }
                               handleTitle(tab, navigation, clickedIndex);
                           },
                           onNext: function (tab, navigation, index) {
                               success.hide();
                               error.hide();

                               if (form.valid() == false) {
                                   return false;
                               }

                               handleTitle(tab, navigation, index);
                           },
                           onPrevious: function (tab, navigation, index) {
                               success.hide();
                               error.hide();

                               handleTitle(tab, navigation, index);
                           },
                           onTabShow: function (tab, navigation, index) {
                               var total = navigation.find('li').length;
                               var current = index + 1;
                               var $percent = (current / total) * 100;
                               $('#form_wizard_1').find('.progress-bar').css({
                                   width: $percent + '%'
                               });
                           }
                       });

                       $('#form_wizard_1').find('.button-previous').hide();
                       $('#form_wizard_1 .button-submit').click(function () {
                           this.Function
                           document.getElementById('<%= Hempcon.ClientID %>').value = document.getElementById("empcon").value;
                           document.getElementById('<%= Hrestra.ClientID %>').value = document.getElementById("restra").value;
                           document.getElementById('<%= Hlug.ClientID %>').value = document.getElementById("lug").value;
                           document.getElementById('<%= Hfecini.ClientID %>').value = document.getElementById("fecini").value;
                           document.getElementById('<%= Hfecfin.ClientID %>').value = document.getElementById("fecfin").value;
                           document.getElementById('<%= Hhorent.ClientID %>').value = document.getElementById("horent").value;
                           document.getElementById('<%= Hdur.ClientID %>').value = document.getElementById("dur").value;
                           document.getElementById('<%= Hteleme.ClientID %>').value = document.getElementById("teleme").value;
                           document.getElementById('<%= Hema.ClientID %>').value = document.getElementById("ema").value;
                           document.getElementById('<%= Hrutenc.ClientID %>').value = document.getElementById("rutenc").value;
                           document.getElementById('<%= Hnomenc.ClientID %>').value = document.getElementById("nomenc").value;
                           document.getElementById('<%= Hapeenc.ClientID %>').value = document.getElementById("apeenc").value;
                           document.getElementById('<%= Hmutenc.ClientID %>').value = document.getElementById("mutenc").value;
                           document.getElementById('<%= Hcelenc.ClientID %>').value = document.getElementById("celenc").value;
                           document.getElementById('<%= Hemaenc.ClientID %>').value = document.getElementById("emaenc").value;

                           document.getElementById('MainContent_myBtn').click();
                           return false;
                       }).hide();
                   }

               };

           } ();
   </script>



</asp:Content>