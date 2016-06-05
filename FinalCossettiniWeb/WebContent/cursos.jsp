<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Inscripcion Cursos</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
	<script src="js/knockout-3.4.0.js"></script>
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                                <a href="padronElectoral.jsp"><i class="fa fa-fw fa-list-alt fa-lg" style="color:green"></i>PadrÃ³n Electoral</a>
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
                            Seccion Cursos
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Cursos
                            </li>
                        </ol>
                    </div>
                </div>
                 <%  try{ 
					    if(codRol == 1 || codRol==2 || codRol==6)
					    { %>
                <!-- /.row -->
				
				<div class="row">
					<div class="col-lg-5">
						<section class="panel panel-info">
                                <header class="panel-heading">
                                 Listado de Cursos
                                </header>
                                <div class="panel-body">
									<div class="table-responsive">
					                            <table class="table table-bordered table-hover table-striped">
					                                <thead>
					                                    <tr>
					                                    	<th>Id</th>
					                                        <th>Nombre</th>
					                                        <th>Año</th>
					                                        <th>Estado</th>
					                                        <th>Precio</th>
					                                        <th>Acción</th>
					                                    </tr>
					                                    <tr class="warning no-result" id="noResult">
														  <td colspan="5"><i class="fa fa-warning"></i> No hay cursos disponibles</td>
														</tr>
					                                </thead>
					                                <tbody data-bind="foreach: cursos">
					                                    <tr>
					                                      <td data-bind="text: cod_curso"></td>
														  <td data-bind="text: nombre"></td>
														  <td data-bind="text: anio"></td>
														  <td data-bind="text: estado"></td>
														  <td data-bind="text: precio"></td>
														  <td>
														  <!--<button type="button" class="btn-xs btn-info" aria-label="Left Align">
															<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
														  </button>-->
														  <button type="button" class="btn-xs btn-info" aria-label="Left Align" data-bind="click: $parent.mostrarPanelCarga">Inscribir</button>
														  <!-- <button type="button" class="btn-xs btn-info" aria-label="Left Align">Admin</button> -->
														 </td>
														</tr>
					                                </tbody>
					                            </table>
					                          </div>  
									</div>
									<button type="button" class="btn-xs btn-success" aria-label="Left Align" onclick="cupoCurso();" >Cambiar Cupo Curso</button>
						</section>
					</div>
				
				<!-- /.class -->
				<div class="col-lg-6" id="formInscripcion" style="display: none">
				<section class="panel panel-info">
                                <header class="panel-heading">
                                 Inscripción al curso
                                </header>
                                <div class="panel-body">
                                    <form class="form-horizontal tasi-form" onSubmit="return agregarAlumnoACurso();">
                                     <div class="form-group">
                                     		<label class="col-sm-2 control-label col-lg-3" for="inputNombre">Id Curso:</label>
                                          <div class="col-lg-2">
                                             <input type="text" id="codSeleccionado" readonly class="col-lg-2 form-control"/>
                                           </div>
                                           <label class="col-sm-2 control-label col-lg-3" for="inputNombre">Precio Curso:</label>
                                           <div class="col-lg-4">
                                             <input type="text" id="precioSeleccionado" readonly class="col-lg-2 form-control" />
                                      	   </div>
                                      </div>
                                      <div class="form-group">
                                           <label class="col-sm-2 control-label col-lg-3" for="inputNombre">Nombre Curso:</label>
                                           <div class="col-lg-4">
                                             <input type="text" id="nombreSeleccionado" readonly class="col-lg-2 form-control" />
                                      	   </div>
                                      </div>
                                      <div class="form-group">
	                                          <label class="col-sm-2 control-label col-lg-4" for="inputSuccess">Seleccione un alumno:</label>
	                                          <div class="col-lg-8">
				                         
                                            <select id="alumnoSelect" class="form-control m-b-10"  data-bind="options: alumnos, 
                        					value: selectedAlumno,
                       						 optionsText: function(item) {
							                       return item.dni + ' - ' + item.apellido + ', ' + item.nombre
							                   },  
                       						optionsCaption: 'Seleccione un alumno...'" required></select> 
                                         	 </div>
	                                  </div>
									  <div class="form-group">
										<label class="col-sm-2 control-label col-lg-4">Observaciones</label>
										<div class="col-lg-8">
										<textarea id="txtObservaciones" class="form-control" rows="4" required></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-lg-2 col-lg-offset-5">
											<button type='submit' name='search' id='search-btn' class="btn-lg btn-info" data-bind="click: setModalPago()" data-toggle="modal" data-target="#myModalPago">Inscribir</button>
											<!-- data-bind="click: setModalPago" data-toggle="modal" data-target="#myModalPago" -->
										</div> 
									</div>
									</form>
									
                              </div>
                              </section>                             
				</div>
				<div class="col-lg-6" id="formCambiarCupo" style="display: none">
					<section class="panel panel-info">
						<header class="panel-heading">
						 Cambiar Cupo Curso
						</header>
						<div class="panel-body">
							<form class="form-horizontal tasi-form" onSubmit="return cambiarCupoCurso();">
							<div class="form-group">
								<label class="col-sm-2 control-label col-lg-3" for="inputNombre"> Curso:</label>
								  <div class="col-lg-8">
									<select id="curso_Select" class="form-control m-b-10"  data-bind="options: cursosTotales, 
									value: selectedCurso,
									 optionsText: function(item) {
										   return item.cod_curso + ' - ' + item.nombre
									   },  
									optionsCaption: 'Seleccione un curso...'" required></select> 
								  </div>
								  </div>
								  <div class="form-group">
								   <label class="col-sm-2 control-label col-lg-3" for="inputNombre">Nuevo Cupo:</label>
								   <div class="col-lg-4">
									 <input type="number" id="txtCupo" required min=0 class="col-lg-2 form-control" />
								   </div>
							</div>
							 <div class="form-group">
							 <div class="col-lg-offset-4">
								<button type='submit' name='seach' id='search-btn' class="btn-lg btn-info">Cambiar Cupo Curso</button>
								
							</div>
							</div>
				
						  </form>
					  </div>
					</section>
				</div>	
				
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
			 <input type="text" value="N°001" readonly/>
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
			<input id="lblNombreApe" data-bind="value: selectedAlumno() ?  selectedAlumno().apellido + ', ' + selectedAlumno().nombre : ''" readonly/>
			</td>
			</tr>
			<tr class="row">
			<td class="col-md-offset-2 col-md-3 compr">
			<p>En concepto por el curso:</p>
			</td>
			<td class="col-md-offset-5">
			<input id="lblCurso" readonly/>
			</td>
			</td>
			<tr class="row">
			<td class="col-md-offset-2 col-md-3 compr">
			<p>La suma de: $</p>
			</td>
			<td class="col-md-offset-5">
			<input type="text" id="importe" readonly />
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
       		<button class="btn-md btn-success pull-right" style="margin-right:2px;" onclick="printData()"><i class="fa fa-fw fa-print fa-lg"></i>Imprimir</button>
        </div>
       
      </div>
    </div>
  </div>
  
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/tableFilter.js"></script>
	
	<script>
	function printData()
	{
	   var divToPrint=document.getElementById("myModalPago");
	   newWin= window.open("");
	   newWin.document.write(divToPrint.outerHTML);
	   newWin.print();
	   newWin.close();
	}
	
	function agregarAlumnoACurso()
	{
		var codSeleccionado= $("#codSeleccionado").val();
		var observaciones=$("#txtObservaciones").val();
		var ruta= "ServletAlumnoEnCurso";
		var resultado="false";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				data: {alumno: JSON.stringify(viewModel.selectedAlumno()), codSeleccionado: JSON.stringify(codSeleccionado), observaciones: JSON.stringify(observaciones)},
				success: function(datos)
				{ 
					if(datos.respInfo=="OK"){
						//setModalPago(JSON.stringify(viewModel.selectedAlumno()));
						//alert("Se ha agregado el alumno al curso exitosamente");
						resultado="OK";
					}
					else{
						alert("Ha ocurrido un error, reintente");
					}
				},
				error: function(datos) {
			        //AJAX request not completed
			       alert("There was an error");
			    }
			
		});
		return false;
	}
	
	
	function cambiarCupoCurso()
	{
		var cupo=$("#txtCupo").val();
		var ruta= "ServletCambiarCupoCurso";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				data: {curso: JSON.stringify(viewModel.selectedCurso()),cupo: JSON.stringify(cupo)},
				success: function(datos)
				{ 
					if(datos.respInfo=="OK"){
						alert("Se ha cambiado el cupo del curso correctamente");
						resultado="OK";
					}
					else{
						alert("Ha ocurrido un error, reintente");
					}
				},
				error: function(datos) {
			        //AJAX request not completed
			       alert("There was an error");
			    }
			
		});
	}
	
$(document).ready(function() {
	viewModel=
    {	
    	cursos: ko.observableArray([]),
    	selectedCurso:ko.observable(),
    	cursosTotales: ko.observableArray([]),
    	alumnos: ko.observableArray([]),
    	selectedAlumno:ko.observable(),
    	
    };

	
	viewModel.setModalPago= function()
    {	
		///var nya= alumno.apellido + alumno.nombre;
    	var today= new Date();
    	///$('#cod_socio').val(alumno.dni);
		///$('#lblNombreApe').val(nya);	
		$('#fechaActual').val(today);	
	};  
    	
	viewModel.mostrarPanelCarga= function(curso)
    {
		$('#lblCurso').val(curso.nombre);
		$('#importe').val(curso.precio);
		$('#formInscripcion').css({display: 'inline'});
		$('#codSeleccionado').val(curso.cod_curso);
		$('#precioSeleccionado').val(curso.precio);
		$('#nombreSeleccionado').val(curso.nombre);
	};
	
	 ko.applyBindings(viewModel);
		//llamada ajax que devuelve los cursos y carga el modelo con knockout
		 var ruta= "ServletBuscarCursosAbiertos";
			$.ajax({
					async: false,
					url: ruta,
					type: "POST",
					dataType: "json",
					success: function(datos)
					{ 
						if(datos.respInfo=="OK")
							{
							if (datos.cursos.length > 0)
								{
									viewModel.cursos(datos.cursos);
								}
							else
							{
								$('#noResult').css({display: ''});
							}
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
			
			function cerrarModal(){
				$('#formInscripcion').css({display: ''});
			}
			
			var ruta= "ServletBuscarAlumnos";
			$.ajax({
					async: false,
					url: ruta,
					type: "POST",
					dataType: "json",
					success: function(datos)
					{ 
						if(datos.respInfo=="OK")
							{
									viewModel.alumnos(datos.alumnos);
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
			
	});
	
function cupoCurso()
{
	$('#formCambiarCupo').css({display: ''});
	var ruta= "ServletBuscarCursos";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					viewModel.cursosTotales(datos.cursos);

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
	</script>

</body>

</html>
