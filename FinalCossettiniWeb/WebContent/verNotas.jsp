<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ver Notas</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">
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
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-file-text fa-lg" style="color:red"></i> Ex�menes <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="agregarExamen.jsp"><i class="fa fa-fw fa-plus fa-lg" style="color:red"></i>Alta Ex�men</a>
                            </li>
                            <li>
                                <a href="listaRendir.jsp"><i class="fa fa-fw fa-list fa-lg" style="color:red"></i>Lista de alumnos en condiciones</a>
                            </li>
                           	<li>
                                <a href="generarExamen.jsp"><i class="fa fa-fw fa-magic fa-lg" style="color:red"></i>Generar Ex�men</a>
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
                                <a href="padronElectoral.jsp"><i class="fa fa-fw fa-list-alt fa-lg" style="color:green"></i>Padr�n Electoral</a>
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
                            Ver Notas <small>Estad�sticas</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Ver Notas
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                  <%  try{ 
					    if(codRol == 1 || codRol==2 || codRol==4)
					    { %>
				<div class="row">
								  <div class="col-lg-7">
								  </br>
                                  <form class="form-horizontal" role="form">
										 <div class="form-group">
                                          <label class="col-lg-3 col-sm-3 control-label">Tipo Ex�men:</label>
                                          <div class="col-lg-4">
                                               <select id="selectTipoExamen" class="form-control">
												<option>Seleccionar tipo</option>
												<option>A</option>
                                                <option>B</option>
                                                <option>C</option>
                                              </select>
                                          </div>
										  <label class="col-lg-1 col-sm-1 control-label">A�o:</label>
                                          <div class="col-lg-2">
                                              <input type="number" class="form-control" id="txtAnio" placeholder="a�o">
                                          </div>
										  <div class="col-lg-1">
										  <button type="button" class="btn btn-success" aria-label="Left Align" onclick="buscarNotas()">
										  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
										   </button>
										   </div>
										   <div class="col-lg-1">
										   <button type="button" class="btn btn-danger" aria-label="Left Align" onclick="recargar()">
										  <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										   </button>
										   </div>
										  </div>
										 
										  <div class="form-group">
										  <label class="col-lg-3 col-sm-3 control-label" style="display:none">Cod Ex�men:</label>
                                          <div class="col-lg-9">
											<input type="hidden" class="form-control" id="txtCodExamen" placeholder="codigo" readonly>
										</div>
										  </div>
										  <div class="form-group">
										  <label class="col-lg-3 col-sm-3 control-label">Estado:</label>
                                          <div class="col-lg-9">
											<input type="text" class="form-control" id="txtEstado" placeholder="estado" readonly>
										</div>
										  </div>
                                         
										 <div class="form-group">
										 <label class="col-lg-3 col-sm-3 control-label">Descripcion:</label>
                                          <div class="col-lg-9">
                                          <textarea class="form-control" rows="3" id="txtDescripcion" readonly></textarea>
											</div>
										 </div>
						        </form>
								  </div>
								  	<!-- /.class col lg6 -->
				<div class="col-lg-5">
                <div id="container" style=" height: 300px; max-width: 500px; margin: 0 auto"></div>
				</div>
               </div>
               <div class="row">
			  
			  
			   <div class="col-lg-12">
			    <div class="form-group pull-left">
					<input type="text" class="search form-control" placeholder="Filtrar">
					<button class="btn-sm btn-danger" id="btnLimite" onclick="verCasoLimite()" style="display:none">Ver caso l�mite</button>
				</div>
					<span class="counter pull-right"></span>
					<div class="table-responsive">
			   <table class="table table-hover table-bordered results">
				  <thead>
					<tr>
					  
					  <th class="col-md-4 col-xs-4">DNI</th>
					  <th class="col-md-4 col-xs-4">Apellido</th>
					  <th class="col-md-3 col-xs-3">Nombre</th>
					  <th class="col-md-1 col-xs-1">Nota</th>
					</tr>
					<tr class="warning no-result">
					  <td colspan="5"><i class="fa fa-warning"></i> No result</td>
					</tr>
				  </thead>
							  <tbody data-bind="foreach: alumExams">
								<tr>
								  <td data-bind="text: alumno.dni"></td>
								  <td data-bind="text: alumno.apellido"></td>
								  <td data-bind="text: alumno.nombre"></td>
								  <td data-bind="text: nota"></td>
								</tr>
								
							  </tbody>
				</table>
				</div>
			   </div>
			   </div>
                 <% }
					    else{ 
					%>    	
				<div class="row">
				<div class="col-12">
				No tiene permiso para acceder a esta p�gina</div>
				</div>
					<%    }
				 }catch(NullPointerException ex){} %>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
<!-- Modal Editar -->

<div class="modal fade" id="myModalEditar" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Prueba alumno</h4>
        </div>
        <div class="modal-body">
		   <div class="form-group">
           <label id="lblAl" class="col-sm-2 control-label col-lg-2" for="inputNombre">Seleccionar Alumno</label>
           <div class="col-lg-10">
          <select id="alumnoSelect" class="form-control m-b-10"  data-bind="options: alumnos, 
                        					value: selectedAlumno,
                       						optionsText: 'nombre', 
                       optionsCaption: 'Seleccione un alumno...'"></select> 
                                          </div>
           </div>
           <div class="col-lg-12">
           <div data-bind="if: selectedAlumno()">
								  <div class="table-responsive col-md-12">
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
           
        </div>
        </div>
       <div class="modal-footer">
         
          <button id ="btnEditar" type="button" onclick="return modificarNota();" class="btn btn-primary" data-dismiss="modal" >Modificar</button>
        </div>
       
      </div>
    </div>
  </div>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script src="js/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
   
   <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js"></script>
<script>
$(function () {

    $(document).ready(function () {
    	viewModel=
        {	
        	alumExams: ko.observableArray([]),
        	alumnos: ko.observableArray([]),
        	alumEnEj:ko.observableArray([]),
        	selectedAlumno:ko.observable(),
        	exams:ko.observableArray()
        	
        };
    	viewModel.selectedAlumno.subscribe(function () {
   		 var codigo=$('#txtCodExamen').val();
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
   					 alert("Ha ocurrido un error, reintente");
   				    }
   				
   			});
          
       	
       });
    	 ko.applyBindings(viewModel);

    });
});
</script>
<script>
function buscarNotas(){
	var tipoExamen= document.getElementById("selectTipoExamen").value;
	
	if(tipoExamen!="Seleccionar tipo" && $('#txtAnio').val() != "" ){
	//llamada ajax que devuelve el examen y carga el modelo con knockout
	 var ruta= "ServletBuscarNotas";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				data: {tipoExamen: JSON.stringify(tipoExamen), anio: JSON.stringify($('#txtAnio').val())},
				success: function(datos)
				{ 
					if(datos.respInfo=="OK")
						{
						
							viewModel.alumExams(datos.notaExams);
							$('#txtCodExamen').val(datos.examen.cod_examen);
							$('#txtDescripcion').val(datos.examen.descripcion);
							$('#txtEstado').val(datos.examen.estado);
							validarBotonLimite();
							var aprob=(datos.suma/datos.cant)*100;
							var desap=100-aprob;
							//carga highcharts
					        // Build the chart
					        $('#container').highcharts({
					            chart: {
					                plotBackgroundColor: null,
					                plotBorderWidth: null,
					                plotShadow: false,
					                type: 'pie'
					            },
					            title: {
					                text: 'Estad�sticas del ex�men'
					            },
					            tooltip: {
					                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
					            },
					            plotOptions: {
					                pie: {
					                    allowPointSelect: true,
					                    cursor: 'pointer',
					                    dataLabels: {
					                        enabled: false
					                    },
					                    showInLegend: true
					                }
					            },
					            series: [{
					                name: 'Brands',
					                colorByPoint: true,
					                data: [{
					                    name: 'Desaprobados',
										
					                    y: desap, color:'red'
					                },  {
					                    name: 'Aprobados',
										
					                    y: aprob, color:'green'
					                }]
					            }]
					        });
							
							
						}
					else
						{
						alert(datos.respInfo);
						}
					
				},
				error: function(datos) {
			        //AJAX request not completed
					 alert("Ha ocurrido un error, reintente");
			    }
			
		});
	}else {alert("Tipo de examen y/o a�o no ingresados");}
}
function validarBotonLimite(){
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
				 alert("Ha ocurrido un error, reintente");
		    }
		
	});
var resp= false;
for(i=0;i<viewModel.exams().length;++i){
	if(viewModel.exams()[i].cod_examen==$('#txtCodExamen').val()){
		resp=true;
		break;
	}
}
if(resp && ($('#txtEstado').val()=='generado'))
	{
	$('#btnLimite').css({"display": ''});
	}

}
function verCasoLimite(){
	//ver lo del estado para habilitar o no boton en primer lugar y luego ver si el profesor tiene ese examen asignado
	buscarCarga();
	$("#myModalEditar").modal('show');
	}
function buscarCarga()
{	
	var el= 1;
	var codigo=$('#txtCodExamen').val();;
	//llamada ajax que devuelve el examen y carga el modelo con knockout
	 var ruta= "ServletCargaModo";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				data: {mydata: JSON.stringify(el), codigo: JSON.stringify(codigo)},
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
					 alert("Ha ocurrido un error, reintente");
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
function recargar(){
	window.location.href='verNotas.jsp'
}
function modificarNota(){
	
	var codigo=$('#txtCodExamen').val();
	
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
							alert("Notas modificada exitosamente");
							window.location.href='verNotas.jsp'
							
							}
						else
							{
							alert("No se pudo cargar nota, reintente");
							}
						
					},
					error: function(datos) {
				        //AJAX request not completed
						 alert("Ha ocurrido un error, reintente");
				    }
				
			});
		}
		}
	return false;
}
</script>
	<script src="js/tableFilter.js"></script>

</body>

</html>
