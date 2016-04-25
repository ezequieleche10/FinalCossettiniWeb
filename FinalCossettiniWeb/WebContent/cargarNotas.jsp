<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

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
    try{ 
    if(session.getAttribute("usuario") != null)
    {
        usuario = (String)"<b>"+session.getAttribute("usuario")+"</b>";
  	%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong><%=usuario %></strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong><%=usuario %></strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><%= usuario %><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
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
					 <li>
                        <a href="cargaAlumnos.jsp"><i class="fa fa-fw fa-file-excel-o fa-lg" style="color:green"></i>Carga Inicial Sigae</a>
                    </li>
					<li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-file-text fa-lg" style="color:red"></i> Ex·menes <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="agregarExamen.jsp"><i class="fa fa-fw fa-plus fa-lg" style="color:red"></i>Alta Ex·men</a>
                            </li>
                            <li>
                                <a href="listaRendir.jsp"><i class="fa fa-fw fa-list fa-lg" style="color:red"></i>Lista de alumnos en condiciones</a>
                            </li>
                           	<li>
                                <a href="generarExamen.jsp"><i class="fa fa-fw fa-magic fa-lg" style="color:red"></i>Generar Ex·men</a>
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
                   
                   
                    <li>
                        <a href="profesores.jsp"><i class="fa fa-fw fa-user fa-lg" style="color:orange"></i> Profesores</a>
                    </li>
                    <li>
                        <a href="cursos.jsp"><i class="fa fa-fw fa-book fa-lg" style="color:blue"></i> Cursos</a>
                    </li>
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
                                <a href="padronElectoral.jsp"><i class="fa fa-fw fa-list-alt fa-lg" style="color:green"></i>Padr√≥n Electoral</a>
                            </li>
							
                        </ul>
                    </li>
					 <li>
                        <a href="secAlumnos.jsp"><i class="fa fa-fw fa-users fa-lg" style="color:yellow"></i> Alumnos</a>
                    </li>
                    
                    
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
                            Cargar Notas
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Carga Sigae
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				<div class="row">
				<div class="col-lg-12">
				<div class="col-lg-4 col-lg-offset-4 styleEze">
				Examenes pendientes de notas
				</div>
				</div>
				<!-- /.class -->

				</div>
				
				<!-- /.row -->
                <div class="row">
				<div class="col-lg-12">
				<span class="counter pull-right"></span>
				<table class="table table-hover table-bordered results">
				  <thead>
					<tr>
					  <th>Cod</th>
					  <th>Tipo_examen</th>
					  <th>Estado</th>
					  <th>Descripcion</th>
					  <th class="col-lg-1"></th>
					</tr>
					<tr class="warning no-result">
					  <td colspan="5"><i class="fa fa-warning"></i> No hay ex·menes pendientes</td>
					</tr>
				  </thead>
							  <tbody data-bind="foreach: exams">
								<tr>
								  <td data-bind="text: cod_examen"></td>
								  <td data-bind="text: tipo_examen"></td>
								  <td data-bind="text: estado"></td>
								  <td data-bind="text: descripcion"></td>
								  <td>
								  <button type="button" class="btn-md btn-success" aria-label="Left Align" data-bind="click: $parent.mostrarPaneles">Cargar</button>
								 </td>
								</tr>
							 </tbody>
				</table>
				</div>
				<!--/.class -->
                     
                       
                    
                </div>
                <!-- /.row -->
				<div class="row">
				<div class="col-lg-12">
				<section class="panel panel-primary">
                                <header class="panel-heading">
                                 Panel Carga Notas
                                </header>
                                <div class="panel-body">
                                    <form class="form-horizontal tasi-form" method="get">
                                      <div class="form-inline">
                                          <label class="col-sm-2 control-label col-lg-2" for="inputNombre">Examen a cargar:</label>
                                          <div class="col-lg-10" style="margin-bottom:12px">
                                             <input type="text" id="codSeleccionado" readonly class="col-lg-2 form-control" placeholder="Codigo Examen"/>
                                             <input type="text" id="tipoSeleccionado" readonly class="col-lg-2 form-control" placeholder="Tipo Examen" />
                                             <button type="button" class="btn-xs btn-success" onclick="cerrarNotas()" style="margin-top:5px;margin-left:5px;">Cerrar Notas</button>
                                             </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="inputNombre">Modo:</label>
                                          <div class="col-lg-10">
                                             <select id="modoBusca" class="form-control m-b-10" onchange="buscarCarga();">
                                             	<option>Seleccione una opcion...</option>
												<option>Por alumno</option>
												<option>Por ejercicio</option>
                                                
                                              </select>
                                          </div>
                                      </div>
                                       <div class="form-group">
                                          <label id="lblEj" class="col-sm-2 control-label col-lg-2" for="inputNombre" style="display:none">Seleccionar Ejercicio</label>
                                          <div class="col-lg-10">
                                            <select id="ejercicioSelect" class="form-control m-b-10"  data-bind="options: ejAlumnos, 
                        					value: selectedEjercicio,
                       						optionsText: 'nombre', 
                       optionsCaption: 'Seleccione un ejercicio...'" style="display:none"></select> 
                                          </div>
                                      </div>
                                         <div class="form-group">
                                          <label id="lblAl" class="col-sm-2 control-label col-lg-2" for="inputNombre" style="display:none">Seleccionar Alumno</label>
                                          <div class="col-lg-10">
                                            <select id="alumnoSelect" class="form-control m-b-10"  data-bind="options: alumnos, 
                        					value: selectedAlumno,
                       						optionsText: 'nombre', 
                       optionsCaption: 'Seleccione un alumno...'" style="display:none"></select> 
                                          </div>
                                      </div>
									 <div class="row">
									 <div class="col-lg-12">
									  <div id="divOptions" class="form-inline" style="display:none">
                                    <input type="text" id="txtCantItems" readonly class="col-lg-2 form-control" placeholder="Cant Items" data-bind="value: selectedEjercicio() ? selectedEjercicio().cant_items : ''" style="display:none"/>
									<input type="text" id="txtPorcentaje" readonly class="col-lg-2 form-control" placeholder="Porcentaje" data-bind="value: selectedEjercicio() ? selectedEjercicio().porcentaje : ''" style="display:none"/>  
                                      </div>
									</div>
                                             
									<div class="col-lg-12">
								  <div data-bind="if: selectedEjercicio()">
								  <table id="tablexEjercicios" class="table table-hover table-bordered results" >
								  <thead>
									<tr>
					
					 				 <th class="col-md-4 col-xs-4">DNI</th>
							    	 <th class="col-md-4 col-xs-4">Apellido</th>
					 				 <th class="col-md-3 col-xs-3">Nombre</th>
								     <th class="col-md-1 col-xs-1">Resultado</th>
									</tr>
								 </thead>
							  <tbody data-bind=" foreach: selectedEjercicio().listaAlumnos   ">
								<tr>
								  <td data-bind="text: alumno.dni"></td>
								  <td data-bind="text: alumno.apellido"></td>
								  <td data-bind="text: alumno.nombre"></td>
								  <td>
									<input type="text" name="txtNota" class="form-control" data-bind="value: resultado "/>
								  </td>
								</tr>
								
							  </tbody>
				</table>
				</div>
				
				<div data-bind="if: selectedAlumno()">
								  <table id="tablexAlumno" class="table table-hover table-bordered results" >
								  <thead>
									<tr>
					
					 				 <th class="col-md-4 col-xs-4">Codigo</th>
							    	 <th class="col-md-4 col-xs-4">Nombre</th>
					 				 <th class="col-md-3 col-xs-3">Nota Parcial</th>
								     <th class="col-md-1 col-xs-1">Porcentaje</th>
					 				 <th class="col-md-3 col-xs-3">Cant Items</th>
								     <th class="col-md-1 col-xs-1">Resultado</th>
									</tr>
								 </thead>
							  <tbody data-bind="foreach: alumEnEj">
								<tr>
								
								  <td data-bind="text: ejer.cod_ejercicio"></td>
								  <td data-bind="text: ejer.nombre"></td>
								  <td data-bind="text: nota_parcial, attr: { id: 'prefix_' + $index()}"></td>
								  <td data-bind="text: ejer.porcentaje, attr: { id: 'porcent_' + $index()}"></td>
								  <td data-bind="text: ejer.cant_items, attr: { id: 'item_' + $index()}"></td>
								  <td>
									<input type="text" name="txtNota" class="form-control" data-bind="value: resultado, attr: {id: $index()}" onblur="actualizarTabla(id)" />
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
				<div  class="col-lg-12">
				<button type="button" class="btn-md btn-primary pull-right" aria-label="Left Align" onclick="guardarCarga()">&nbsp;&nbsp;Guardar&nbsp;</button>
				</div>
				</div>
							
                                  </form>
                              </div>
                            </section>
							</div>
				</div>
				<!-- /.row -->
			

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/tableFilter.js"></script>
<script>
$(document).ready(function() {
	viewModel=
    {	
    	exams: ko.observableArray([]),
    	ejAlumnos:ko.observableArray([]),
    	alumnos:ko.observableArray([]),
    	selectedEjercicio:ko.observable(),
    	selectedAlumno:ko.observable(),
    	alumEnEj:ko.observableArray([]),
    	
    };
	
	/// viewModel.selectedEjercicio({"cant_items":"","porcentaje":""});
	
	viewModel.selectedAlumno.subscribe(function () {
		 var codigo=$('#codSeleccionado').val();
		 var ruta= "ServletAlumnoEnEjercicio";
			$.ajax({
					async: false,
					url: ruta,
					type: "POST",
					dataType: "json",
					data: {mydata: JSON.stringify(viewModel.selectedAlumno()),codigo: JSON.stringify(codigo)},
					success: function(datos)
					{ 
						if(datos.respInfo=="OK")
							{
							viewModel.alumEnEj(datos.alumEnEj);
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
	viewModel.mostrarPaneles= function(examen)
    {
		$('#codSeleccionado').val(examen.cod_examen);
		$('#tipoSeleccionado').val(examen.tipo_examen);
	};
	
		
	 ko.applyBindings(viewModel);
	//llamada ajax que devuelve el examen y carga el modelo con knockout
	 var ruta= "ServletBuscarExams";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				success: function(datos)
				{ 
					if(datos.respInfo=="OK")
						{
						viewModel.exams(datos.exams);
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
</script>
<script type="text/javascript">
function editarModal()
{
alert("El modal se tiene que abrir");
}
function confirmaEliminar()
{
alert("Va a eliminarlo");
}
function buscarCarga()
{	
	var el= document.getElementById("modoBusca");
	var codigo=$('#codSeleccionado').val();
	//llamada ajax que devuelve el examen y carga el modelo con knockout
	 var ruta= "ServletCargaModo";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				data: {mydata: JSON.stringify(el.options.selectedIndex), codigo: JSON.stringify(codigo)},
				success: function(datos)
				{ 
					if(datos.respInfo=="OK")
						{
						if(el.options.selectedIndex == 1)
						{
							viewModel.alumnos(datos.alumnos);
							$('#alumnoSelect').css({"display": ''});
							$('#lblAl').css({"display": ''});
						}
						else
						{
						viewModel.ejAlumnos(datos.ejAlumnos);
						$('#ejercicioSelect').css({"display": ''});
						$('#lblEj').css({"display": ''});
						$('#txtCantItems').css({"display": ''});
						$('#txtPorcentaje').css({"display": ''});
						$('#divOptions').css({"display": ''});
						//$('#tablexEjercicios').css({"display": 'block'});
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
	
}
function actualizarTabla(index)
{
	var elem= "prefix_" + index;
	//var element =document.getElementById(elem)
	var indexres= index;
	var cantItems= "item_" + index;
	var porcentaje= "porcent_"+ index;
	
	var result= document.getElementById(indexres).value;
	var porcen=document.getElementById(porcentaje).innerHTML;
	var cantI = document.getElementById(cantItems).innerHTML;
	
	document.getElementById(elem).innerHTML= (result*porcen)/(cantI *10);
}
function guardarCarga(){
	var el= document.getElementById("modoBusca");
	var codigo=$('#codSeleccionado').val();
	if(el.options.selectedIndex == 2)
	{
	var ruta= "ServletCargarNotaxEj";

		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				data: {ejercicio: JSON.stringify(viewModel.selectedEjercicio())},
				success: function(datos)
				{ 
					if(datos.respInfo=="OK")
						{
						alert("Notas cargadas exitosamente");
						
						}
					else
						{
						alert("No se pudo cargar nota, reintente");
						}
					
				},
				error: function(datos) {
			        //AJAX request not completed
			       alert("There was an error");
			    }
			
		});
	}
	if(el.options.selectedIndex == 1)
		{//alumnos
		var ruta= "ServletCargarNotaxAl";
	
			$.ajax({
					async: false,
					url: ruta,
					type: "POST",
					dataType: "json",
					data: {alenj: JSON.stringify(viewModel.alumEnEj()),codigo: JSON.stringify(codigo)},
					success: function(datos)
					{ 
						if(datos.respInfo=="OK")
							{
							alert("Notas cargadas exitosamente");
							
							}
						else
							{
							alert("No se pudo cargar nota, reintente");
							}
						
					},
					error: function(datos) {
				        //AJAX request not completed
				       alert("There was an error");
				    }
				
			});
		}
}
function cerrarNotas(){
	var codigo=$('#codSeleccionado').val();
	var ruta= "ServletCerrarNota";
	alert("esta seguro de cerrar las notas? s/n");
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data: {codigo: JSON.stringify(codigo)},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert("Notas cerradas");
					
					}
				else
					{
					alert("No se pudo cerrar nota, reintente");
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
