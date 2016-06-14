<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Cargar Notas</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
	<script src="js/knockout-3.4.0.js"></script>
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/jquery-ui.min.css" rel="stylesheet">
    <link href="css/jquery-ui.structure.min.css" rel="stylesheet">
    <link href="css/jquery-ui.theme.min.css" rel="stylesheet">
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
                            Cargar Notas
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Carga Notas
                            </li>
                        </ol>
                    </div>
                </div>
                 <%  try{ 
					    if(codRol==2 || codRol==1 | codRol==4)
					    { %>
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
				<div class="table-responsive">
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
					  <td colspan="5"><i class="fa fa-warning"></i> No hay exámenes pendientes</td>
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
				</div>
				<!--/.class -->
                     
                       
                    
                </div>
                <!-- /.row -->
				<div class="row">
				<div class="col-lg-12">
				<section id="myPanel" class="panel panel-primary" style="display:none">
                                <header class="panel-heading">
                                 Panel Carga Notas
                                </header>
                                <div class="panel-body">
                                    <form class="form-horizontal tasi-form" method="get">
                                    <div class="row"><div class="col-lg-12">
                                    <button type="button" class="btn-xs btn-success pull-right" onclick="return modalCerrarNotas();" style="margin-top:5px;">Cerrar Notas</button>
                                      </div></div>
                                      <div class="form-inline">
                                          <label class="col-sm-2 control-label col-lg-2" for="inputNombre">Examen a cargar:</label>
                                          <div class="col-lg-10" style="margin-bottom:12px">
                                             <input type="text" id="codSeleccionado" readonly class="col-lg-2 form-control" placeholder="Codigo Examen"/>
                                             <input type="text" id="tipoSeleccionado" readonly class="col-lg-2 form-control" placeholder="Tipo Examen" />
                                             
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
								  <div class="table-responsive">
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
									<input type="number" name="txtNota" class="form-control" min="0" data-bind="value: resultado "/>
								  </td>
								</tr>
								
							  </tbody>
				</table>
				</div>
				</div>
				
				<div data-bind="if: selectedAlumno()">
				<div class="table-responsive">
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
									<input type="number" min="0" name="txtNota" class="form-control" data-bind="value: resultado, attr: {id: $index()}" onblur="actualizarTabla(id)" />
								  </td>
								</tr>
								
							  </tbody>
				</table>
				</div>
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

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.min.js"></script>
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
							alert("Ha ocurrido un error, diríjase a ayuda");
							}
						
					},
					error: function(datos) {
				        //AJAX request not completed
				       alert("Ha ocurrido un error, diríjase a ayuda");
				    }
				
			});
       
    	
    });
	viewModel.mostrarPaneles= function(examen)
    {
		$('#codSeleccionado').val(examen.cod_examen);
		$('#tipoSeleccionado').val(examen.tipo_examen);
		$('#myPanel').css({"display": ''});

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
						alert("Ha ocurrido un error, diríjase a ayuda");
						}
					
				},
				error: function(datos) {
			        //AJAX request not completed
					alert("Ha ocurrido un error, diríjase a ayuda");
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
							$('#modoBusca').prop("disabled",true);
							$('#alumnoSelect').css({"display": ''});
							$('#lblAl').css({"display": ''});
						}
						else
						{
						viewModel.ejAlumnos(datos.ejAlumnos);
						$('#modoBusca').prop("disabled",true);
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
					alert("Ha ocurrido un error, diríjase a ayuda");
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
    var items= viewModel.selectedEjercicio().cant_items;
    var valueA=0;
    for(i=0; i< viewModel.selectedEjercicio().listaAlumnos.length;++i)
    	{
    	if(items< viewModel.selectedEjercicio().listaAlumnos[i].resultado)
    	{
    		valueA=1;
    		break;
    	}
    	}
	if(valueA==1){
		alert("El resultado no puede superar la cantidad de items");
	}else{
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
					alert("Ha ocurrido un error, diríjase a ayuda");
			    }
			
		});
	}
	}
	if(el.options.selectedIndex == 1)
		{//alumnos
	   var value=0;
		for(i=0;i< viewModel.alumEnEj().length;++i){
			if(viewModel.alumEnEj()[i].ejer.cant_items < viewModel.alumEnEj()[i].resultado){
				value=1;
				break;
			}
		}
		if(value==1)
		{
			alert("El resultado no puede superar la cantidad de items");
		}else {
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
						alert("Ha ocurrido un error, diríjase a ayuda");
				    }
				
			});
		}
		}
}
function cerrarNotas(){
	var codigo=$('#codSeleccionado').val();
	var ruta= "ServletCerrarNota";
	
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
				alert("Ha ocurrido un error, diríjase a ayuda");
		    }
		
	});
}
function modalCerrarNotas(){
	$('<div></div>').appendTo('body')
	.html($('<div><h5>Está seguro de cerrar las notas, los cambios no se van a poder deshacer?</h5></div>')) 
	.dialog({
	    modal: true,
	    title: 'Confirmar',
	    zIndex: 10000,
	    autoOpen: true,
	    width: 'auto',
	    resizable: false,
	    buttons: {
	        Aceptar: function () {
	            // $(obj).removeAttr('onclick');                                
	            // $(obj).parents('.Parent').remove();
				cerrarNotas();
				window.location='index.jsp';
	            $(this).dialog("close");
	            
	        },
	        Cancelar: function () {
	        	
	            $(this).dialog("close");
	        }
	    },
	    close: function (event, ui) {
	        $(this).remove();
	    }
	});
}
</script>
	

</body>

</html>
