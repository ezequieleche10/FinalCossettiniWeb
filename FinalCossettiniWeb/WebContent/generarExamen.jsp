<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Generar Examen</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
	<link href="css/spinner.css" rel="stylesheet">
	<link href="css/wizard.css" rel="stylesheet">
	<link href="css/jquery-ui.min.css" rel="stylesheet">
    <link href="css/jquery-ui.structure.min.css" rel="stylesheet">
    <link href="css/jquery-ui.theme.min.css" rel="stylesheet">
    
   
	<script src="js/knockout-3.4.0.js"></script>

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    
    #myselect{
    height:30px;
    }
    #myselect option {
    font-size:16px;}
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
					    if(codRol == 1 || codRol==4)
					    { %>
                    <li>
                        <a href="cursos.jsp"><i class="fa fa-fw fa-book fa-lg" style="color:blue"></i> Cursos</a>
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
                            Seccion Exámenes
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Exámenes
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				  <%  try{ 
					    if(codRol == 1 || codRol==2 || codRol==4)
					    { %>
				<div class="row">
				<div class="col-md-12">
				<div class="container-fluid"> 
				<div class="stepwizard"> 
				<div class="stepwizard-row setup-panel"> 
					<div class="stepwizard-step"> 
				<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a> <p>Lista Alumnos</p> 
					</div> 
					<div class="stepwizard-step"> 
				<a href="#step-2" type="button" class="btn btn-default btn-circle disabled" >2</a> <p>Comisión y Profesores</p> 
					</div> 
					<div class="stepwizard-step"> 
				<a href="#step-3" type="button" class="btn btn-default btn-circle disabled" >3</a> <p>Ejercicios</p>
					</div> 
				</div> 
				</div> 
				<form role="form"> 
				<div class="row setup-content" id="step-1"> 
				<div class="col-xs-12"> 
				<div class="col-md-12"> 
				<h3>Lista Alumnos</h3>
				
				<hr>
					<div class="form-inline"> 
					
					<label class="control-label">Año:</label>
					<input type="number" id="txtAno" required="required" class="form-control" placeholder="Ingrese Año" /> 
					<button type="button" class="btn btn-info" aria-label="Left Align" onclick="buscarExamen()">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					
					</button>
				<input type="text"  readonly class="form-control" placeholder="Tipo Examen" data-bind="value: viewModel.examen().tipo_examen" />
				<input type="text" id="lblEstado"  readonly class="form-control" placeholder="Estado" data-bind="value: viewModel.examen().estado"/>
				<input type="text" hidden id="lblPaso2" value="0"/>
					</div> 
				<div class="col-lg-12">
                        <h3>Lista de alumnos en condiciones</h3>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Apellido</th>
                                        <th>Nombre</th>
                                        <th>Carrera</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: alumnos">
						<tr>
							<td data-bind=" text: dni" ></td>
							<td data-bind=" text: apellido"></td>
							<td data-bind=" text: nombre" ></td>
							<td data-bind=" text: nombre_carrera" ></td>
					   </tr>
						
					</tbody>
                            </table>
                        </div>
                    </div>
				<button type="button" class="btn btn-primary nextBtn btn-lg pull-right"  onclick="return buscarProfesores();" >Next</button> 
				</div> 
				</div> 
				</div> 
				<div class="row setup-content" id="step-2"> 
				<div class="col-xs-12"> 
				<div class="col-md-12"> <h3>Comisión y profesores</h3> 
				<div class="form-group"> 
					
					<label class="control-label">Nombre</label>
					<input type="text" id="txtNombreComision" required="required" class="form-control" placeholder="Nombre Comision" /> 
					</br>
					<label class="control-label">Descripción</label>
					<textarea id="txtDescripcionComision" class="form-control" rows="2"></textarea>
				</div>
				<div>
                        <h3>Profesores asignados a la comisión</h3>
                        <div class="row">
                        <div class="col-md-12">
                        Agregar:<select id="myselect" data-bind="options: profesores, 
                        value: selectedProfesor,
                       optionsText: function(item) {
                       return item.apellido + ' ' + item.nombre
                   }, 
                       optionsCaption: 'Seleccione un profesor...'"></select> 
                        </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Apellido</th>
                                        <th>Nombre</th>
                                        <th class="col-lg-1"></th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: profesoresComision">
                                    <tr>
                                        <td data-bind="text: cod_profesor"></td>
                                        <td data-bind="text: nombre"></td>
                                        <td data-bind="text: apellido"></td>
                                      <td>
                                  			<button class="btn-xs btn-warning glyphicon glyphicon-remove" data-bind="click: $parent.eliminarProfesor">
										   
										  </button>
										  
										  </td>
                                    </tr>
                                     </tbody>
                            </table>
                        </div>
                    </div>
				<div class="col-md-12">
				<div class="col-md-5 col-md-offset-7">
				<button class="btn btn-primary nextBtn btn-lg pull-right" type="button" data-bind="visible: profesoresComision().length >0" >Next</button> 
				</div>
				</div>
				 </div> </div></div> 
				<div class="row setup-content" id="step-3">
				<div class="col-xs-12"> 
				<div class="col-md-12"> 
				                          <section class="panel panel-info">
                              <header class="panel-heading">
                                Ejercicios
                              </header>
                              <div class="panel-body">
                              
							  <div class="col-lg-5">
                                  
										 <div class="form-group">
                                          <label class="col-lg-3 col-sm-3 control-label">Nombre:</label>
                                          <div class="col-lg-9">
                                              <input type="Nombre" class="form-control" id="inputNombre" placeholder="Nombre">
                                          </div>
										  </div>
										  </br>
										  </br>
										  <div class="form-group">
										  <label class="col-lg-3 col-sm-3 control-label">Items:</label>
                                          <div class="col-lg-9">
                                              <input type="number" class="form-control" id="inputItems" placeholder="Items">
                                          </div>
										  </div>
										  </br>
										  </br>
										  <div class="form-group">
										  <label class="col-lg-3 col-sm-3 control-label">Porcentaje:</label>
                                          <div class="col-lg-9">
										  <div class="input-group">
											<input type="number" class="form-control" id="inputPorcentaje" placeholder="Porcentaje">
											<div class="input-group-addon">%</div>
											</div>
                                             
                                          </div>
										  </div>
                                         </br>
										  </br>
										 
										 <div class="form-group">
										 <label class="col-lg-3 col-sm-3 control-label">Descripcion:</label>
                                          <div class="col-lg-9">
                                          <textarea id="inputDescripcion" class="form-control" rows="2"></textarea>
                                          
										  </div>
										 </div>
										
                                      
                                     
                                     
                                 
								  </div>
								  	<!-- /.class col lg5 -->
								<div class="col-lg-1">
								</br>
								</br>
								</br>
								</br>
								<button type="button" class="btn-lg btn-danger glyphicon glyphicon-chevron-right" aria-label="Left Align" onclick="agregarEjercicio();">
								
								</button>
								</div>
                              
							  	<!-- /.class col lg1 -->
							
								<div class="col-lg-6 col-xs-12">
								<div class="table-responsive">
								<table id="myTable" class="table table-hover table-bordered results" >
						  <thead>
							<tr>
							  <th>Nombre</th>
							  <th>Items</th>
							  <th>Porcent</th>
							  <th>Desc</th>
							  <th></th>
							</tr>
							</thead>
									 <tbody data-bind="foreach: ejercicios">
										<tr>
                                        <td><input data-bind="value: nombre" type="text" class="form-control"/></td>
                                        <td><input data-bind="value: cant_items" type="text" class="form-control"/></td>
                                        <td><input data-bind="value: porcentaje" type="text" class="form-control"/></td>
                                        <td><input data-bind="value: descripcion" type="text" class="form-control"/>
								  		</td>
                                        <td>
                                  			<button class="btn-xs btn-warning glyphicon glyphicon-remove " data-bind="click: $parent.eliminarEjercicio">
										 
										  </button>
										  
										  </td>
                                    </tr>
                                    
										
									  </tbody>
									  
						</table>
							</div>
								</div>
								</div>
                          </section>
				<button type="button" class="btn btn-success btn-lg pull-right" onclick="return generarExamen();">Generar Examen</button> 
				</div> 
				</div> 
				</div> 
				</form>
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
    	examen: ko.observable(),
    	alumnos: ko.observableArray([]),
    	profesores: ko.observableArray([]),
    	selectedProfesor:ko.observable(),
    	profesoresComision:ko.observableArray([]),
		ejercicios:ko.observableArray([]),
		
    	
    };

    viewModel.examen({"codigo_examen":"","tipo_examen":""});
    viewModel.selectedProfesor.subscribe(function () {
    
        viewModel.profesoresComision.push(viewModel.selectedProfesor())
    	
    });
    viewModel.agregarEjercicio= function(ejercicio)
    {
        viewModel.ejercicios.push(ejercicio)	
    };
    viewModel.eliminarProfesor= function(profesor)
    {viewModel.profesoresComision.remove(profesor)};
    viewModel.eliminarEjercicio= function(ejercicio)
    {viewModel.ejercicios.remove(ejercicio)};
    ko.applyBindings(viewModel);
//code
  	var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }
		//my code
		if($('#lblPaso2').val()== 1)
		{
			isValid= false;
		}
        if (isValid)
           nextStepWizard.removeClass('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');
  	//
});
	</script>
	<script type="text/javascript">
	function buscarExamen()
	{
	var anoIngresado= $("#txtAno").val();
	//llamada ajax que devuelve el examen y carga el modelo con knockout
	 var ruta= "ServletBuscarGenerarExamen";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				data: "mydata="+JSON.stringify(anoIngresado),
				success: function(datos)
				{ 
					if(datos.respInfo=="OK")
						{
						viewModel.examen(datos.examen);
						viewModel.alumnos(datos.alumnos);
						}
					else
						{
						alert(datos.respInfo);
						}
					
				},
				error: function(datos) {
			        //AJAX request not completed
			       alert("There was an error");
			    }
			
		});



	}
	function buscarProfesores()
	{
		//$('.inputDisabled').prop("disabled", false);
		if($('#lblEstado').val()  == 'alumnos cargados')
			{
		 var ruta= "ServletBuscarProfesores";
			$.ajax({
					async: false,
					url: ruta,
					type: "POST",
					dataType: "json",
					success: function(datos)
					{ 
						if(datos.respInfo=="OK")
							{
							viewModel.profesores(datos.profesores);
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
		else {alert("No puede generar examen, lista y/o examen no cargadas, dirígase a ayuda"); 
			  $('#lblPaso2').val(1);}
	}
function agregarEjercicio(){
	var ejercicio={nombre:$('#inputNombre').val(),cant_items:$('#inputItems').val(),porcentaje:$('#inputPorcentaje').val(),descripcion:$('#inputDescripcion').val()};
	if(ejercicio.nombre =="" || ejercicio.cant_items=="" || ejercicio.porcentaje =="" || ejercicio.descripcion==""){
		alert("No puede agregar el ejercicio, complete todos los campos");
	} else {
	viewModel.ejercicios.push(ejercicio);
	$('#inputNombre').val("");
	$('#inputItems').val("");
	$('#inputPorcentaje').val("");
	$('#inputDescripcion').val("");
	}
}

	
function generarExamen(){
var total = 0;
for(i=0; i < viewModel.ejercicios().length;++i){
	total=total + parseInt(viewModel.ejercicios()[i].porcentaje);
}
if( total!==100){
	alert("La suma debe ser de 100%");
	
		
	
}
else{
var ruta= "ServletGenerarExamen";
var comision={nombre:$('#txtNombreComision').val(),descripcion:$('#txtDescripcionComision').val()};
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data: {comision: JSON.stringify(comision), examen: JSON.stringify(viewModel.examen()),profComisiones:JSON.stringify(viewModel.profesoresComision()),ejercicios:JSON.stringify(viewModel.ejercicios())},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert("Examen Generado exitosamente");
					window.location="index.jsp";
					//redireccionar página
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
	return false;
}
}

</script>

</body>

</html>
