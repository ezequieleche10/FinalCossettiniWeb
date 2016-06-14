<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Socios</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
	<link href="css/build.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/jquery-ui.min.css" rel="stylesheet">
    <link href="css/jquery-ui.structure.min.css" rel="stylesheet">
    <link href="css/jquery-ui.theme.min.css" rel="stylesheet">
   
	<script src="js/knockout-3.4.0.js"></script>
	
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
	@media screen {
  #printSection {
      display: none;
  }
}

@media print {
  body * {
    visibility:hidden;
  }
  #printSection, #printSection * {
    visibility:visible;
  }
  #printSection {
    position:absolute;
    left:0;
    top:0;
    text-align: justify;
  }
}
	
	</style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Instituto Olga Cossettini</a>
            </div>
            <!-- Top Menu Items -->
  
            <ul class="nav navbar-right top-nav">
              <% 
   String usuario =""; 
   int codRol=0;
    try{ 
    if(session.getAttribute("usuario") != null)
    {
        usuario = (String)"<b>"+session.getAttribute("usuario")+"</b>";
        codRol= (Integer)session.getAttribute("cod_rol");
  	%>
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><%= usuario %><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="ServletLogOut"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
                <%  
                }
   				 else
   					 { 
					%>    	
					<a class="navbar-brand" href="nuevologin.jsp">Login</a>
					<% 
    }
    }catch(NullPointerException ex){} 
%>       
            </ul>
                      <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index.jsp"><i class="fa fa-fw fa-home fa-lg"></i>Home</a>
                    </li>
				   <%  try{ 
					    if(codRol == 1 || codRol==4)
					    { %>
					 <li>
                        <a href="cargaAlumnos.jsp"><i class="fa fa-fw fa-file-excel-o fa-lg" style="color:green"></i>Carga Inicial Sigae</a>
                    </li>
                    <% }}catch(NullPointerException ex){} %>
                    <%  try{ 
					    if(codRol == 1 || codRol==2 || codRol==4)
					    { %>
					<li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-file-text fa-lg" style="color:red"></i> Exámenes <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="agregarExamen.jsp"><i class="fa fa-fw fa-plus fa-lg" style="color:red"></i>Alta Exámen</a>
                            </li>
                            <li>
                                <a href="listaRendir.jsp"><i class="fa fa-fw fa-list fa-lg" style="color:red"></i>Lista de alumnos en condiciones</a>
                            </li>
                           	<li>
                                <a href="generarExamen.jsp"><i class="fa fa-fw fa-magic fa-lg" style="color:red"></i>Generar Exámen</a>
                            </li>
							<li>
                                <a href="cargarNotas.jsp"><i class="fa fa-fw fa-upload fa-lg" style="color:red"></i>Cargar Notas</a>
                            </li>
							<li>
                                <a href="verNotas.jsp"><i class="fa fa-fw fa-search-plus fa-lg" style="color:red"></i>Ver Notas</a>
                            </li>
                            <li>
                             <a href="listaFinal.jsp"><i class="fa fa-fw fa-check fa-lg" style="color:red"></i>ListaFinal</a>
                             </li>
                        </ul>
                    </li>
                    <% }}catch(NullPointerException ex){} %>
                   <%  try{ 
					    if(codRol == 1 || codRol==4)
					    { %>
                    <li>
                        <a href="profesores.jsp"><i class="fa fa-fw fa-user fa-lg" style="color:orange"></i> Profesores</a>
                    </li>
                     <% }}catch(NullPointerException ex){} %>
                     <%  try{ 
					    if(codRol == 1 || codRol==4 || codRol==6)
					    { %>
                     <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-fw fa-book fa-lg" style="color:blue"></i> Cursos <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo1" class="collapse">
                            <li>
                                <a href="agregarCurso.jsp"><i class="fa fa-fw fa-plus fa-lg" style="color:blue"></i>Agregar Curso</a>
                            </li>
                            <li>
                                <a href="cursos.jsp"><i class="fa fa-fw fa-list fa-lg" style="color:blue"></i>Inscripcion Alumnos a Curso</a>
                            </li>
							<li>
                                <a href="cambiarEstadoCurso.jsp"><i class="fa fa-fw fa-list-alt fa-lg" style="color:blue"></i>Cerrar Curso</a>
                            </li>
							
                        </ul>
                    </li>
                    <% }}catch(NullPointerException ex){} %>
                    <%  try{ 
					    if(codRol == 1 || codRol==4 || codRol==5)
					    { %>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-fw fa-money fa-lg" style="color:green"></i> Cooperadora <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo2" class="collapse">
                            <li>
                                <a href="socios.jsp"><i class="fa fa-fw fa-dollar fa-lg" style="color:green"></i>Socios</a>
                            </li>
                            <li>
                                <a href="caja.jsp"><i class="fa fa-fw fa-sort-numeric-asc fa-lg" style="color:green"></i>Caja</a>
                            </li>
							<li>
                                <a href="padronElectoral.jsp"><i class="fa fa-fw fa-list-alt fa-lg" style="color:green"></i>Padrón Electoral</a>
                            </li>
							
                        </ul>
                    </li>
                        <% }}catch(NullPointerException ex){} %>
                  <%  try{ 
					    if(codRol == 3)
					    { %>
					 <li>
                        <a href="secAlumnos.jsp"><i class="fa fa-fw fa-users fa-lg" style="color:yellow"></i> Alumnos</a>
                    </li>
                        <% }}catch(NullPointerException ex){} %>
                     <%  try{ 
					    if(codRol == 1 || codRol==4)
					    { %>
					 <li>
                        <a href="settings.jsp"><i class="fa fa-fw fa-key fa-lg" style="color:blue"></i> Settings</a>
                    </li>
                        <% }}catch(NullPointerException ex){} %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Gestión socios
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table">Socios</i> 
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				  <%  try{ 
					    if(codRol == 1 || codRol==4 || codRol==5)
					    { %>
                <div class="row">
				<div class="col-lg-12">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel1" onclick="showPanel();">Click aquí para agregar Socio</a>
					<div class="form-group pull-right">
					<input type="text" id="filter" class="search form-control" placeholder="Filtrar">
					</div>
					<span class="counter pull-right"></span>
					<div class="table-responsive">
				<table class="table table-hover table-bordered results">
				  <thead>
					<tr>
					  <th class="col-md-4 col-xs-4">Dni</th>
					  <th class="col-md-3 col-xs-3">Apellido</th>
					  <th class="col-md-3 col-xs-3">Nombre</th>
					  <th class="col-md-2 col-xs-2"></th>
					</tr>
					<tr class="warning no-result">
					  <td colspan="4"><i class="fa fa-warning"></i> No result</td>
					</tr>
				  </thead>
							  <tbody data-bind="foreach: socios">
								<tr>
								 
								  <td data-bind="text: dni"></td>
								  <td data-bind="text: apellido"></td>
								  <td data-bind="text: nombre"></td>
								  <td align="center">
								  <button type="button" class="btn-md btn-success glyphicon glyphicon-usd" aria-label="Left Align" data-bind="click: $parent.setModalPago" data-toggle="modal"
								  data-target="#myModalPago">
								  </button>
								  <button type="button" class="btn-md btn-info glyphicon glyphicon-pencil" aria-label="Left Align" data-bind="click: $parent.setModalEditar" data-toggle="modal"  
								  data-target="#myModalEditar">
								  
								  </button>
								  <button type="button" class="btn-md btn-danger glyphicon glyphicon-remove" data-bind="click: $parent.eliminarSocio" >
								   
								  </button>
								 </td>
								</tr>
							</tbody>
				</table>
				</div>
				</div>
				<!--/.class -->
                     
                       
                    
                </div>
                <!-- /.row -->
				<div class="row">
				<div class="col-md-12">
				<div class="panel-group" id="accordion">
				
						<div id="panel1" class="panel-collapse collapse">
						<div class="panel-body">
							<section class="panel panel-info">
                                <header class="panel-heading">
                                 Datos socio
                                </header>
                                <div class="panel-body">
                                <form action="#" onsubmit=" return agregarSocio();">
                                    <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="txtDni">Dni</label>
                                          <div class="col-lg-10">
                                             <input type="number" name="txtNombre" id="txtDni" class="form-control" required/>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="txtNombreSocio">Nombre</label>
                                          <div class="col-lg-10">
                                             <input type="text" name="txtNombre" id="txtNombre" required class="form-control"/>
                                          </div>
                                      </div>
									  <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="txtApellido">Apellido</label>
                                          <div class="col-lg-10">
                                             <input type="text" name="txtApellido" id="txtApellido" required class="form-control"/>
                                          </div>
                                      </div>
									 <div class="form-group">
										<label class="col-sm-2 control-label col-lg-2">Cargos Socio</label>
										<div class="col-lg-10 checkbox-circle">
										   <fieldset id="checkCargo">
											<div class="checkbox-inline checkbox-circle">
											<input id="checkP" type="checkbox" class="groupi">Profesor
											</div>
											<div class="checkbox-inline checkbox-circle">
											<input id="checkS" type="checkbox" class="groupi">Secretaria
											</div>
											<div class="checkbox-inline checkbox-success checkbox-circle">
											<input id="checkA" type="checkbox" class="groupi">Alumno
											</div>
											<div class="checkbox-inline checkbox-success checkbox-circle">
											<input id="checkO" type="checkbox" class="groupi">Otro
											</div>
											</fieldset>
										</div>
									</div>
									 <div class="form-group">
									 <div class="col-lg-offset-6">
										<button id='search-btn' class="btn-md btn-info" type="submit">Agregar</button>
									</div>
									</div>

									</form>
									</div>

                                     </section> 
                              </div>
                        
						</div>
						</div>
				
				</div>
		
				</div>
				<!-- /.class -->
				</div>
				<!-- /.row -->
				
			 <% }
					    else{ 
					%>    	
				<div class="row">
				<div class="col-12">
				No tiene permiso para acceder a esta página</div>
				</div>
					<%    }
				 }catch(NullPointerException ex){} %>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
<!-- Modal Pago -->

<div class="modal fade" id="myModalPago" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Registrar Pago</h4>
        </div>
        <div class="modal-body" id="printThis">
		<form id="registroPago">
		
		<div class="row" style="margin-bottom:20px;">
			<div class="col-md-3">
                <a href="#">
                    <img class="img-responsive" src="img/socioPago.jpg" alt="">
                </a>
            </div>
			<div class="col-md-9 textoSocioPago">
               <p><b><i>Instituto  de educación superior N° 28 Olga Cossettini</b></i></p>
            </div>
         </div>
       		<table class="col-md-offset-3">
			<tr class="row">
			<td class="col-md-offset-2 col-md-3 compr" style="margin-bottom:20px;">
             <p>Comprobante</p>
			</td>
			 <td class="col-md-offset-5">
			 <input type="text" value="N°001"/>
			 </td>
			</tr>
			<tr class="row">
			<td class="col-md-offset-2 col-md-3 compr">
			<p>Fecha de emisión:</p>
			</td>
			<td class="col-md-offset-5">
			<input type="text" id="fechaActual" readonly/>
			</td>
			</tr>
			<tr class="row">
			<td class="col-md-offset-2 col-md-3 compr">
			<p>Recibí de:</p>
			<input type="hidden" id="cod_socio"/>
			</td>
			<td class="col-md-offset-5">
			<input id="lblNombreApe" readonly/>
			</td>
			</tr>
			<tr class="row">
			<td class="col-md-offset-2 col-md-3 compr">
			<p>En concepto por:</p>
			</td>
			<td class="col-md-offset-5">
			<input type="text" value="COOPERADORA" readonly />
			</td>
			</td>
			<tr class="row">
			<td class="col-md-offset-2 col-md-3 compr">
			<p>La suma de: $</p>
			</td>
			<td class="col-md-offset-5">
			<input type="number" id="importe" required="required" />
			</td>
			</tr>
			<tr class="row">
			<td class="col-md-offset-2 col-md-3 compr">
			<p>Firma:</p>
			</td>
			<td class="col-md-offset-5">
			<input type="text" id="firma" readonly />
			</td>
			</tr>
			
			</table>
       	</form> 
        </div>
       <div class="modal-footer">
          <button id="btnRegistrar" type="submit" onclick="return registrarPago();" class="btn btn-primary"  >Registrar Pago</button>
        </div>
       
      </div>
    </div>
  </div>
<!-- Modal Editar -->

<div class="modal fade" id="myModalEditar" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Editar Socio</h4>
        </div>
        <div class="modal-body">
		   <div class="form-group">
             <label class="col-sm-2 control-label col-lg-2" for="txtDni">Dni</label>
             <div class="col-lg-10">
             <input type="number" name="txtNombre" class="form-control" id="txtDniE" />
             </div>
            </div>
            <div class="form-group">
            <label class="col-sm-2 control-label col-lg-2" for="txtNombreSocio">Nombre</label>
            <div class="col-lg-10">
            <input type="text" name="txtNombre" class="form-control" id="txtNombreE"/>
            </div>
          </div>
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtApellido">Apellido</label>
           <div class="col-lg-10">
           <input type="text" name="txtApellido" class="form-control" id="txtApellidoE"/>
            </div>
           </div>
			<div class="form-group">
			<label class="col-sm-2 control-label col-lg-2">Cargos Socio</label>
			<div class="col-lg-10 checkbox-circle">
			<fieldset id="checkCargo">
			<div class="checkbox-inline checkbox-circle">
			<input id="checkPE" type="checkbox" class="group">Profesor
			</div>
			<div class="checkbox-inline checkbox-circle">
			<input id="checkSE" type="checkbox" class="group">Secretaria
			</div>
			<div class="checkbox-inline checkbox-success checkbox-circle">
			<input id="checkAE" type="checkbox" class="group">Alumno
			</div>
			<div class="checkbox-inline checkbox-success checkbox-circle">
			<input id="checkOE" type="checkbox" class="group">Otro
			</div>
			</fieldset>
			</div>
			</div>
        </div>
       <div class="modal-footer">
         
          <button id ="btnEditar" type="button" onclick="return editarSocio();" class="btn btn-primary"  >Editar</button>
        </div>
       
      </div>
    </div>
  </div>
  	

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/tableFilter.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
  $('#panelShow').hide();  
 
		viewModel=
	    {	
	    	socios: ko.observableArray([]),
	    	selectedSocio:ko.observable(),
	    	cargos:ko.observableArray([]),
	    	cargosI:ko.observableArray([])
	    	
	    };
		viewModel.setModalPago= function(socio)
	    {	var nya= socio.apellido + ' ' + socio.nombre;
	         $('#importe').val('');
	    	var today= new Date();
	    	$('#cod_socio').val(socio.cod_socio);
			$('#lblNombreApe').val(nya);	
			$('#fechaActual').val(today);	
		};
		
		viewModel.eliminarSocio= function(socioe)
	    {	
			//go to servlet and eliminarlo del modelo
	    	var ruta= "ServletEliminarSocio";
	    	$.ajax({
	    			async: false,
	    			url: ruta,
	    			type: "POST",
	    			dataType: "json",
	    			data: "socio="+JSON.stringify(socioe),
	    			success: function(datos)
	    			{ 
	    				if(datos.respInfo=="OK")
	    					{
	    					alert("Socio Eliminado Correctamente");
	    					viewModel.socios.remove(socioe);
	    					
	    					}
	    				else
	    					{
	    					alert("Ha ocurrido un error, reintente");
	    					}
	    				
	    			},
	    			error: function(datos) {
	    		        //AJAX request not completed
	    		       alert("There was an error");
	    		    }
	    		
	    	});

			
		};
		viewModel.setModalEditar= function(socio)
	    {	viewModel.selectedSocio=socio;
			$('#txtDniE').val(socio.dni);	
			$('#txtNombreE').val(socio.nombre);	
			$('#txtApellidoE').val(socio.apellido);	
			var longi =socio.cargos.length;
			for(var i=0; i< longi;i++){
				switch(socio.cargos[i].cod_cargo){
				case 1: 
					//check select;
					$('#checkPE').prop("checked",true);
					break;
				case 2: 
					$('#checkAE').prop("checked",true);
					break;
				case 3: 
					$('#checkPE').prop("checked",true);
					break;
				default : 
					$('#checkOE').prop("checked",true);
					
				}
			}
		};
		 ko.applyBindings(viewModel);
		//llamada ajax que devuelve el examen y carga el modelo con knockout
		 var ruta= "ServletBuscarSocios";
			$.ajax({
					async: false,
					url: ruta,
					type: "POST",
					dataType: "json",
					success: function(datos)
					{ 
						if(datos.respInfo=="OK")
							{
							viewModel.socios(datos.socios);
						
							}
						else
							{
							alert("Ha ocurrido un error cargando socios, reintente logueandose");
							}
						
					},
					error: function(datos) {
				        //AJAX request not completed
				       alert("There was an error");
				    }
				
			});

	  
	  
	    
	   
	    
	});


function showPanel(){
$('#panelShow').show();
 $('html,body').animate({
        scrollTop: $("#accordion").offset().top},
        'slow');
}

function confirmaEliminar()
{
alert("Va a eliminarlo");
}
function agregarSocio(){
	var dniI=$('#txtDni').val();
	var nombreI=$('#txtNombre').val();
	var apellidoI=$('#txtApellido').val();
	var socio= {"dni": dniI,"nombre":nombreI,"apellido":apellidoI};
	//Manejo los cargos
	var ids= $('input:checkbox:checked.groupi').map(function(){return this.id;}).get()
	for(i=0;i<ids.length;++i){
		switch(ids[i]){
		case 'checkPE': 
			var cargo={cod_cargo:1,tipo_cargo:'Profesor'};
				break;
		case 'checkAE':
			var cargo={cod_cargo:2,tipo_cargo:'Alumno'};
			break;
		case 'checkSE': 
			var cargo={cod_cargo:3,tipo_cargo:'Secretaria'};
			break;
		default : 
			var cargo={cod_cargo:4,tipo_cargo:'Otro'};
			
		}
		viewModel.cargosI.push(cargo);
	}
	var ruta= "ServletAgregarSocio";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data: {"socio":JSON.stringify(socio),"cargos":JSON.stringify(viewModel.cargosI())},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert("Socio Agregado Correctamente");
					//viewModel.socios.push(socio);
					
					}
				else
					{
					alert("Ha ocurrido un error, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
		       alert("There was an error");
		    }
		
	});
	
	return true;
}
function editarSocio(){
	//recupero elementos y creo el socio con su cargo
	if($('#txtDniE').val() != "" && $('#txtNombreE').val()!= "" && $('#txtApellidoE').val()!= "" )
		{
	viewModel.selectedSocio.dni= $('#txtDniE').val();	
	viewModel.selectedSocio.nombre=$('#txtNombreE').val();
	viewModel.selectedSocio.apellido=$('#txtApellidoE').val();
	//Manejo los cargos
	var ids= $('input:checkbox:checked.group').map(function(){return this.id;}).get()
	for(i=0;i<ids.length;++i){
		switch(ids[i]){
		case 'checkPE': 
			var cargo={cod_cargo:1,tipo_cargo:'Profesor'};
				break;
		case 'checkAE':
			var cargo={cod_cargo:2,tipo_cargo:'Alumno'};
			break;
		case 'checkSE': 
			var cargo={cod_cargo:3,tipo_cargo:'Secretaria'};
			break;
		default : 
			var cargo={cod_cargo:4,tipo_cargo:'Otro'};
			
		}
		viewModel.cargos.push(cargo);
		
	
	
	}
	viewModel.selectedSocio.cargos=viewModel.cargos();
	var ruta= "ServletEditarSocio";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data: "socios="+JSON.stringify(viewModel.selectedSocio),
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert("Socio Modificado Correctamente");
					window.location.href="socios.jsp";
					
					}
				else
					{
					alert("Ha ocurrido un error, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
		       alert("There was an error");
		    }
		
	});
		}else {alert("Complete todos los campos");return false;}
}
function registrarPago(){
	var importe= $('#importe').val();
	var cod_socio=$('#cod_socio').val();
	if(importe!= "")
		{
	var ruta= "ServletRegistrarPago";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data: {"importe":JSON.stringify(importe),"cod_socio":JSON.stringify(cod_socio)},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					$('#myModalPago').modal('hide');
					imprimirPago();
					
					}
				else
					{
					alert("Ha ocurrido un error, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
		       alert("There was an error");
		    }
		
	});

		}
	else{alert("Importe no ingresado");}
	
}
function imprimirPago(){
	$('<div></div>').appendTo('body')
    .html('<div><h5>Pago registrado.Desea imprimir comprobante?</h5></div>')
    .dialog({
        modal: true,
        title: 'Imprimir',
        zIndex: 10000,
        autoOpen: true,
        width: 'auto',
        resizable: false,
        buttons: {
            SI: function () {
                // $(obj).removeAttr('onclick');                                
                // $(obj).parents('.Parent').remove();
				 printElement(document.getElementById("printThis"));
    			 window.print();
    			 $('#importe').val('');
                $(this).dialog("close");
            },
            No: function () {
                $(this).dialog("close");
            }
        },
        close: function (event, ui) {
            $(this).remove();
        }
    });
}
function printElement(elem) {
    var domClone = elem.cloneNode(true);
    
    var $printSection = document.getElementById("printSection");
    
    if (!$printSection) {
        var $printSection = document.createElement("div");
        $printSection.id = "printSection";
        document.body.appendChild($printSection);
    }
    
    $printSection.innerHTML = "";
    
    $printSection.appendChild(domClone);
}

</script>
<script type="text/javascript">
function justNumbers(e)
{
var keynum = window.event ? window.event.keyCode : e.which;
if ((keynum == 8) || (keynum == 46))
return true;
 
return /\d/.test(String.fromCharCode(keynum));
} </script>
	

</body>

</html>
