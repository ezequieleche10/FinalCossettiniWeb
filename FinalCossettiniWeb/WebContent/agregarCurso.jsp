<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agregar Curso</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/spinner.css" rel="stylesheet">
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
                            Alta Cursos
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Home</a>
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
				<div class="col-md-12">
				<section class="panel panel-info">
                   <header class="panel-heading">
                     Agregar Curso
                   </header>
                 <div class="panel-body">
                    <form class="form-horizontal tasi-form" onSubmit="return agregarCurso();">
                      <div class="form-group">
                           <label class="col-sm-2 control-label col-lg-2" for="inputNombre">Nombre Curso</label>
                              <div class="col-lg-10">
                                <input type="text" name="txtNombre" id="txtNombre" class="form-control" required/>
                      		  </div>
                  	 </div>
					 <div class="form-group">
						  <label class="col-sm-2 control-label col-lg-2">Año</label>
						  <div class="col-lg-10">
							  <div class="input-group spinner">
							  <input id="spAno" type="number" class="form-control" value="2017" required/>
								  <div class="input-group-btn-vertical">
									  <button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>
									  <button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>
								  </div>
			   				  </div>
						 </div>
					 </div>
					 <div class="form-group">
                       <label class="col-sm-2 control-label col-lg-2" for="inputPrecio">Precio</label>
                       <div class="col-lg-10">        
		                    <div class="input-group">
		                       	<div class="input-group-addon">$</div>
		                         <input type="number" name="txtPrecio" id ="txtPrecio" class="form-control" required/>
                       		</div>
                       </div>          
					</div>
					 <div class="form-group">
					  <label class="col-sm-2 control-label col-lg-2">Cupo</label>
					  <div class="col-lg-10">
					  <input id="spCupo" type="number" class="form-control" required/>
					 </div>
					 </div>
					<div class="form-group">
				    <label class="col-sm-2 control-label col-lg-2">Descripción</label>
					<div class="col-lg-10">
					<textarea id="areaDesc" class="form-control" rows="4" required></textarea>
					</div>
					</div>
					<div class="form-group">
					<div class="col-lg-offset-5">
					<button type='submit' name='seach' id='search-btn' class="btn-lg btn-info">Agregar</button>
				    <button name='seach' id='search-btn' class="btn-lg btn-warning" onclick="window.location='index.jsp';">Cancelar</button>
					</div>
				    </div>
				    </form>
				    </div>
				    </section>
				    
                            
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

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/tableFilter.js"></script>
<script>
function agregarCurso()
{
	var nombre = $("#txtNombre").val();
	var spAno = $("#spAno").val();
	var precio = $("#txtPrecio").val();
	var cupo = $("#spCupo").val();
	var desc = $('#areaDesc').val();
	var ruta= "ServletAgregarCurso";
	var resultado="false";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			data: "nombre="+nombre+"&anio="+spAno+"&precio="+precio+"&cupo="+cupo+"&desc="+desc,
			success: function(datos)
			{ 
				if(datos=="OK"){
					alert("Se ha cargado exitosamente el curso");
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
	if (resultado=="OK")
	{
		window.location="index.jsp";
	}
	return false;
}
</script>
</body>

</html>
