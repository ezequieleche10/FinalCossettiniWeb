<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Configuración</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/jquery-ui.min.css" rel="stylesheet">
    <link href="css/jquery-ui.structure.min.css" rel="stylesheet">
    <link href="css/jquery-ui.theme.min.css" rel="stylesheet">
   
	<script src="js/knockout-3.4.0.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
	.cajaClass{ border-style: solid;
    			border-color: gray;
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
                            Configuración
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i><a href="index.jsp">Volver</a> 
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
            <%  try{ 
					    if(codRol == 1 || codRol==4)
					    { %> 
			<div class="row">
			<div class="col-lg-12">
			<hr>
			
			<h3>Alumnos y Profesores</h3>
			<button class="btn-md btn-info" data-toggle="modal" data-target="#myModalUsuario" onclick="recuperarAlumno()">Recuperar Clave Alumno</button>
			<button class="btn-md btn-info" data-toggle="modal" data-target="#myModalProfesor" onclick="recuperarProfesor()">Recuperar Clave Profesor</button>
			<hr>
			<h3>Caja/Ingresos</h3>
			<button class="btn-md btn-success" id="btnAltaI" data-toggle="modal" data-target="#myModalIngresos">Alta tipo ingreso</button>
			<button class="btn-md btn-success" id="btnAltaE" data-toggle="modal" data-target="#myModalEgresos">Alta tipo egreso</button>
			<hr>
				
				 <%  try{ 
					    if(codRol == 1)
					    { %> 
			<h3>Administrador</h3>
			<button class="btn-md btn-danger" onclick="removeAll()">Remover Ciclo</button>
			<button class="btn-md btn-danger" id="btnAltaU" data-toggle="modal" data-target="#myModalU">Alta Usuario</button>
			<button class="btn-md btn-danger" id="btnResp" data-toggle="modal" data-target="#myModalResp" onclick="recuperarResp()">Recuperar clave resp</button>
			<hr>
			<%    }
				 }catch(NullPointerException ex){} %>
			</div>
		
			
		
			
			</div>
			</br>
		
            
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
	
<!-- Modal Ingresos -->

<div class="modal fade" id="myModalIngresos" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Alta Tipo Ingresos</h4>
        </div>
        <div class="modal-body">
		   <div class="row">
            <div class="form-group">
           <label id="lbltipo" class="col-sm-2 control-label col-lg-2" for="inputNombre">Tipo Ingreso</label>
            <div class="col-lg-10">
           	<input type="text" id="txtTipoI" class="form-control" />
            </div>
            </div>
          </div>
          <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Descripcion</label>
           <div class="col-lg-10">
           <textarea id="txtDescI" class="form-control"></textarea>
            </div>
           </div>
           </div>	
        </div>
       <div class="modal-footer">
         
          <button id ="btnEditar" type="button" onclick="return altaTipoIngreso();" class="btn btn-primary">Agregar</button>
        </div>
       
      </div>
    </div>
  </div>
 <!-- Modal Egresos -->

<div class="modal fade" id="myModalEgresos" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Alta Tipo Egresos</h4>
        </div>
        <div class="modal-body">
		   <div class="row">
            <div class="form-group">
           <label id="lbltipo" class="col-sm-2 control-label col-lg-2" for="inputNombre">Tipo Egreso</label>
            <div class="col-lg-10">
           	<input type="text" id="txtTipoE" class="form-control"  required/>
            </div>
            </div>
          </div>
          <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Descripcion</label>
           <div class="col-lg-10">
           <textarea id="txtDescE" class="form-control" required></textarea>
            </div>
           </div>
           </div>	
        </div>
       <div class="modal-footer">
         
          <button id ="btnEgreso" type="button" onclick="return altaTipoEgreso();" class="btn btn-primary">Agregar</button>
        </div>
       
      </div>
    </div>
  </div>
<div class="modal fade" id="myModalUsuario" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Buscar Usuario</h4>
        </div>
        <div class="modal-body">
		   <div class="row">
            <div class="form-group">
           <label id="lbltipo" class="col-sm-2 control-label col-lg-2" for="inputNombre">Alumno</label>
                                          <div class="col-lg-10">
                                            <select id="tipoSelect" class="form-control m-b-10"  data-bind="options: alumnos, 
                        					value: selectedAlumno,
                       						optionsText: function(item) {
                       return item.apellido + ' ' + item.nombre}, 
                       optionsCaption: 'Seleccione un alumno...'"></select> 
                                          </div>
                                      </div>
          </div>
          <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Nombre</label>
           <div class="col-lg-10">
           <input id="txtNombre" class="form-control" data-bind="value: selectedAlumno() ? selectedAlumno().nombre : ''" readonly/>
            </div>
           </div>
           </div>	
           <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Apellido</label>
           <div class="col-lg-10">
           <input id="txtApellido" class="form-control" data-bind="value: selectedAlumno() ? selectedAlumno().apellido : ''" readonly/>
            </div>
           </div>
           </div>	
           <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Ingrese Clave</label>
           <div class="col-lg-10">
           <input type="password" id="txtClave" class="form-control" />
            </div>
           </div>
           </div>	
        </div>
       <div class="modal-footer">
         
          <button id ="btnEgreso" type="button" onclick="return cambiarClave();" class="btn btn-primary" >Cambiar</button>
        </div>
       
      </div>
    </div>
  </div>
<div class="modal fade" id="myModalProfesor" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Buscar Usuario</h4>
        </div>
        <div class="modal-body">
		   <div class="row">
            <div class="form-group">
           <label id="lbltipo" class="col-sm-2 control-label col-lg-2" for="inputNombre">Profesor</label>
                                          <div class="col-lg-10">
                                            <select id="tipoSelect" class="form-control m-b-10"  data-bind="options: profesores, 
                        					value: selectedProfesor,
                       						optionsText: function(item) {
                       return item.apellido + ' ' + item.nombre}, 
                       optionsCaption: 'Seleccione un profesor...'"></select> 
                                          </div>
                                      </div>
          </div>
          <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Nombre</label>
           <div class="col-lg-10">
           <input id="txtNombre" class="form-control" data-bind="value: selectedProfesor() ? selectedProfesor().nombre : ''" readonly/>
            </div>
           </div>
           </div>	
           <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Apellido</label>
           <div class="col-lg-10">
           <input id="txtApellido" class="form-control" data-bind="value: selectedProfesor() ? selectedProfesor().apellido : ''" readonly/>
            </div>
           </div>
           </div>	
           <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Ingrese Clave</label>
           <div class="col-lg-10">
           <input type="password" id="txtClaveP" class="form-control" />
            </div>
           </div>
           </div>	
        </div>
       <div class="modal-footer">
         
          <button id ="btnEgreso" type="button" onclick="return cambiarClaveP();" class="btn btn-primary">Cambiar</button>
        </div>
       
      </div>
    </div>
  </div>
  <div class="modal fade" id="myModalResp" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Buscar Usuario</h4>
        </div>
        <div class="modal-body">
		   <div class="row">
            <div class="form-group">
           <label id="lblRespo" class="col-sm-2 control-label col-lg-2" for="respo">Responsable</label>
                                          <div class="col-lg-10">
                                            <select id="tipoSelect" class="form-control m-b-10"  data-bind="options: resp, 
                        					value: selectedResp,
                       						optionsText: function(item) {
                       return item.apellido + ' ' + item.nombre}, 
                       optionsCaption: 'Seleccione un responsable...'"></select> 
                                          </div>
                                      </div>
          </div>
          <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Ingrese Clave</label>
           <div class="col-lg-10">
           <input type="password" id="txtClaveR" class="form-control" />
            </div>
           </div>
           </div>	
        </div>
       <div class="modal-footer">
         
          <button id ="btnEgresa" type="button" onclick="return cambiarClaveR();" class="btn btn-primary">Modificar</button>
        </div>
       
      </div>
    </div>
  </div>
<div class="modal fade" id="myModalU" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Alta Usuario</h4>
          
        </div>
        <div class="modal-body">
        <div align="center"><label id="valError" style="display:none">Corrija los campos</label></div>
		   <div class="row">
            <div class="form-group">
           <label id="lbltipoU" class="col-sm-2 control-label col-lg-2" for="inputNombre">Tipo Usuario</label>
           
                                          <div class="col-lg-10">
                                            <select class="form-control" id="options">
                                            
                                            <option>Seleccione un tipo</option>
                                            <option>Secretaria</option>
                                            <option>Respons Coop</option>
                                            <option>Respons Cursos</option>
                                            </select>
                                             
                                          </div>
                                      </div>
          </div>
          	
           <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label id="apellidoU" class="col-sm-2 control-label col-lg-2" for="txtApellidoU">Apellido:</label>
           <div class="col-lg-10">
           <input id="txtApellidoU" class="form-control" />
            </div>
           </div>
           </div>
           <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label id="nombreU" class="col-sm-2 control-label col-lg-2" for="txtNombreU">Nombre:</label>
           <div class="col-lg-10">
           <input id="txtNombreU" class="form-control" />
            </div>
           </div>
           </div>
           <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label id="dniU" class="col-sm-2 control-label col-lg-2" for="lblNombreU">DNI:</label>
           <div class="col-lg-10">
           <input id="lblDniU" type="number" class="form-control" onblur="validaUsuario();"/>
            </div>
           </div>
           </div>	
           <div class="row" style="margin-top:15px;">
		  <div class="form-group">
           <label id="claveU" class="col-sm-2 control-label col-lg-2" for="txtClaveU">Ingrese Clave:</label>
           <div class="col-lg-10">
           <input type="password" id="txtClaveU" class="form-control" />
            </div>
           </div>
           </div>	
        </div>
       <div class="modal-footer">
         
          <button id ="btnAltaU" type="submit" onclick="return altaUsuario();" class="btn btn-primary">Registrar</button>
        </div>
       
      </div>
    </div>
  </div>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
	<script src="js/jquery-ui.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script src="js/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

 
<script>


$( document ).ready(function() {
	   
	 	
			viewModel=
		    {	
		    	
		    	selectedAlumno:ko.observable(),
		    	selectedProfesor:ko.observable(),
		    	profesores: ko.observableArray([]),
		    	resp:ko.observableArray([]),
		    	selectedResp:ko.observable(),
		    	alumnos: ko.observableArray([])
		    	
		    };
			
		    
		  
			ko.applyBindings(viewModel);
			//llamada ajax que devuelve el examen y carga el modelo con knockout
			 
	});




function altaTipoIngreso(){
	var tipo=$('#txtTipoI').val();
	var desc=$('#txtDescI').val();
	
	if(tipo=="" || desc==""){
		alert("Tipo y/o descripcion no pueden ser nulos");
		return false;
	}else{
	var ruta= "ServletAgregarIE";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data:{"tipo":JSON.stringify(tipo),"desc":JSON.stringify(desc),"dist":JSON.stringify(1)},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert(" Tipo Ingreso correcto");
					//limpiar
					$('#txtTipoI').val('');
					$('#txtDescI').val('');
					

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
}
function altaTipoEgreso(){
	
	var tipo=$('#txtTipoE').val();
	var desc=$('#txtDescE').val();
	
	if(tipo=="" || desc==""){
		alert("Tipo y/o descripcion no pueden ser nulos");
		return false;
	}else{
	var ruta= "ServletAgregarIE";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			data:{"tipo":JSON.stringify(tipo),"desc":JSON.stringify(desc),"dist":JSON.stringify(0)},
			dataType: "json",
			
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert(" Tipo Egreso correcto");
					//limpiar
					$('#txtTipoI').val('');
					$('#txtDescI').val('');
					

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
}
function recuperarAlumno(){
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
					alert("Ha ocurrido un error en la carga, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
				 alert("Ha ocurrido un error, reintente");
		    }
		
	});
}
function recuperarProfesor(){
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
					alert("Ha ocurrido un error en la carga, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
				 alert("Ha ocurrido un error, reintente");
		    }
		
	});
}
function recuperarResp(){
	var ruta= "ServletBuscarResp";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					viewModel.resp(datos.resp);
					
					}
				else
					{
					alert("Ha ocurrido un error en la carga, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
				 alert("Ha ocurrido un error, reintente");
		    }
		
	});
}
function cambiarClave(){
	if($('#txtClave').val() != "" && viewModel.selectedAlumno() != undefined)
		{
	var ruta= "ServletCambiarClave";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data:{"clave":$('#txtClave').val(),"usu":viewModel.selectedAlumno().usuario,"pv":0},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					$('#txtClave').val('');
					alert("Clave cambiada");
					window.location.href='settings.jsp';
					}
				else
					{
					alert("Ha ocurrido un error en la carga, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
				 alert("Ha ocurrido un error, reintente");
		    }
		
	});
		}else{alert("Corrobore clave o alumno elegido");return false;}
}
function cambiarClaveP(){
	if($('#txtClaveP').val()!= "" && viewModel.selectedProfesor() != undefined)
		{
	var ruta= "ServletCambiarClave";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data:{"clave":$('#txtClaveP').val(),"usu":viewModel.selectedProfesor().usuario.nombre_usuario,"pv":0},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					$('#txtClaveP').val('');
					alert("Clave cambiada");
					window.location.href='settings.jsp';
					}
				else
					{
					alert("Ha ocurrido un error en la carga, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
				 alert("Ha ocurrido un error, reintente");
		    }
		
	});
		}else{alert("Corrobore clave o profesor elegido");return false;}
}
function cambiarClaveR(){
	if($('#txtClaveR').val()!= "" && viewModel.selectedResp() != undefined)
	{
	var ruta= "ServletCambiarClave";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data:{"clave":$('#txtClaveR').val(),"usu":viewModel.selectedResp().u.nombre_usuario,"pv":0},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					$('#txtClaveP').val('');
					alert("Clave cambiada");
					window.location.href='settings.jsp';
					}
				else
					{
					alert("Ha ocurrido un error en la carga, reintente");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
				 alert("Ha ocurrido un error, reintente");
		    }
		
	});
	}else{alert("Corrobore clave o responsable elegido");return false;}
}
function removeAll(){
	$('<div></div>').appendTo('body')
	.html("Esta seguro de reiniciar todo? <br> No se pueden revertir los cambios") 
	.dialog({
	    modal: true,
	    title: 'Eliminar',
	    zIndex: 10000,
	    autoOpen: true,
	    width: 'auto',
	    resizable: false,
	    buttons: {
	        OK: function () {
	        	var ruta= "ServletEliminarCiclo";
	        	$.ajax({
	        			async: false,
	        			url: ruta,
	        			type: "POST",
	        			dataType: "json",
	          			success: function(datos)
	        			{ 
	        				if(datos.respInfo=="OK")
	        					{
	        					alert("Seccion exámenes reiniciada");
	        					}
	        				else
	        					{
	        					alert("Ha ocurrido un error en la carga, reintente");
	        					}
	        				
	        			},
	        			error: function(datos) {
	        		        //AJAX request not completed
	        				 alert("Ha ocurrido un error, reintente");
	        		    }
	        		
	        	});
		    	$(this).dialog("close");
	        },
	        CANCEL: function () {
	        	
	            $(this).dialog("close");
	        }
	    },
	    close: function (event, ui) {
	     //   $(this).remove();
	    }
	});
	
	
	
}
function altaUsuario(){
	var ind= $('#options').prop('selectedIndex');
	var nombre=$('#txtNombreU').val();
	var ape=$('#txtApellidoU').val();
	var dni=$('#lblDniU').val();
	var clave=$('#txtClaveU').val();
	var mje="";
	var valid=true;
	if(ind==0){
		mje= mje+ "Debe seleccionar un responsable- "
		valid=false;
	}
	if(nombre == ""){
		mje= mje + "Nombre no puede ser vacío- "
		valid=false;
	}
	if(ape == ""){
		mje= mje + "Apellido no puede ser vacío- "
		valid=false;
	}
	if(dni == ""){
		mje= mje + "Dni no puede ser vacío- "
		valid=false;
	}
	if(clave == ""){
		mje= mje + "Clave no puede ser vacía."
		valid=false;
	}
	if(!valid){
		$('#valError').text("");
		$('#valError').css({"display": ''});
		$('#valError').css({"color": 'red'});
		$('#valError').text(mje);
	}else{
	var ruta= "ServletAgregarU";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data:{"ind":JSON.stringify(ind),"nombre":JSON.stringify(nombre),"apellido":JSON.stringify(ape),"dni":JSON.stringify(dni),"clave":JSON.stringify(clave)},
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert("Usuario dado de alta");
					//limpiar
					window.location.href='settings.jsp'
					

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
}
function validaUsuario(){
	var existe;
	
	$.ajax({ 
		async: false,
		type : 'POST',
		data : "inputUsername="+$('#lblDniU').val().toString(),
		url  : 'existeUsuario.jsp',
		success: function(data){ // Get the result and asign to each cases
			
			if(data==1)
			{
			//Ok
				existe=true;
				alert("Dni ya existe");
				$('#lblDniU').focus();		
			}
			else
			{ 	
				existe=false;;
			}
			
		}
			
		});
	
	return existe;
}

</script>
	<script src="js/tableFilter.js"></script>

</body>

</html>
