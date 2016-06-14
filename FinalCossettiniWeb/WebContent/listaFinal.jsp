<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lista Final</title>

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
                            Lista final
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                <i class="fa fa-table"></i> Lista Final
                            </li>
                        </ol>
                    </div>
                </div>
                
                <!-- /.row -->
                  <%  try{ 
					    if(codRol == 1 || codRol==2 || codRol==4)
					    { %>
				<div class="row">
				<div class="col-lg-12">
				<div class="form-inline"> 
					<label class="control-label">A�o:</label>
					<input type="number" id="txtAno" required="required" class="form-control" placeholder="Ingrese A�o" /> 
					<button type="button" class="btn btn-info" aria-label="Left Align" onclick="buscarLista()">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				
					</div> 
				</div>
				<!-- /.class -->

				</div>
				
				<!-- /.row -->
                <div class="row">
				<div class="col-lg-12">
				</br>
				</br>
                 <div class="form-group pull-right">
					<input type="text" class="search form-control" placeholder="Filtrar">
				</div>
					<span class="counter pull-right"></span>
					<div class="table-responsive">
				<table id="tabletoPrint" class="table table-hover table-bordered results">
				  <thead>
					<tr>
					  <th>DNI</th>
					  <th>Apellido</th>
					  <th>Nombre</th>
					  <th>Carrera</th>
					  <th>Ingreso directo</th>
					</tr>
					<!--  <tr class="warning no-result">
					  <td colspan="4"><i class="fa fa-warning"></i> No result</td>
					</tr>-->
				  </thead>
					<tbody data-bind="foreach: alumnos">
						<tr>
							<td data-bind=" text: dni" ></td>
							<td data-bind=" text: apellido"></td>
							<td data-bind=" text: nombre" ></td>
							<td data-bind=" text: nombre_carrera" ></td>
							<td data-bind=" text: ingreso_directo"></td>
							
						</tr>
					</tbody>
				</table>
				</div>
				</div>
				<!--/.class -->
                </div>
                <!-- /.row -->
				<div class="row">
				<div class="col-md-12 col-md-offset-5">
				<button type="submit" class="btn-lg btn-info" onclick="imprimirLista()" data-bind="visible: alumnos().length >0">Imprimir</button>
				</div>
				<!-- /.class -->
				</div>
				<!-- /.row -->
				
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

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/tableFilter.js"></script>
<script type="text/javascript">
function editarModal()
{
alert("El modal se tiene que abrir");
}
function confirmaEliminar()
{
alert("Va a eliminarlo");
}
function buscarLista()
{
var anoIngresado= $("#txtAno").val();
//llamada ajax que devuelve el examen y carga el modelo con knockout
if(anoIngresado!= "")
	{
 var ruta= "ServletListaFinal";
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
else alert("Ingrese a�o");


}

function imprimirLista(){
	 var divToPrint=document.getElementById("tabletoPrint");
	   newWin= window.open("");
	   newWin.document.write(divToPrint.outerHTML);
	   newWin.print();
	   newWin.close();
	   window.location='index.jsp';
}
</script>
<script>
$( document ).ready(function() {
    viewModel=
    {
    	examen: ko.observable(),
    	alumnos: ko.observableArray([])
    };
    viewModel.examen({"codigo_examen":"","tipo_examen":""});
    ko.applyBindings(viewModel);
    });
</script>	

</body>

</html>
