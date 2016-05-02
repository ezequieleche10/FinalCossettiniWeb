<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Alumnos</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">
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
					    if(codRol == 1)
					    { %>
					 <li>
                        <a href="cargaAlumnos.jsp"><i class="fa fa-fw fa-file-excel-o fa-lg" style="color:green"></i>Carga Inicial Sigae</a>
                    </li>
                    <% }}catch(NullPointerException ex){} %>
                    <%  try{ 
					    if(codRol == 1 || codRol==2)
					    { %>
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
                    <% }}catch(NullPointerException ex){} %>
                   <%  try{ 
					    if(codRol == 1)
					    { %>
                    <li>
                        <a href="profesores.jsp"><i class="fa fa-fw fa-user fa-lg" style="color:orange"></i> Profesores</a>
                    </li>
                     <% }}catch(NullPointerException ex){} %>
                      <%  try{ 
					    if(codRol == 1)
					    { %>
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
                        <% }}catch(NullPointerException ex){} %>
                  <%  try{ 
					    if(codRol == 3)
					    { %>
					 <li>
                        <a href="secAlumnos.jsp"><i class="fa fa-fw fa-users fa-lg" style="color:yellow"></i> Alumnos</a>
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
                            Seccion Alumnos <small>Informaci√≥n</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Secci√≥n Alumnos
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                  <%  try{ 
					    if(codRol == 1 || codRol==3)
					    { %>
				<div class="row">
						<div class="col-md-12">
						NOTAS EX√ÅMENES IMPORTANTE!!!
						<div class="row">
						<div class="col-xs-10">
                             <table class="table table-responsive">
                                  <thead>
                                    <tr>
                                      <th>Tipo Examen</th>
                                      <th>Estado</th>
                                      <th>Condicion Acta</th>
                                      <!-- <th>Price</th> -->
                                      <th>Nota</th>
                                      <th>Condicion Alumno</th>
                                  </tr>
                              </thead>
                              <tbody data-bind="foreach: notas">
                                <tr>
                                 
                                  <td data-bind="text: ex.tipo_examen"></td>
                                  <td data-bind="text: ex.estado"></td>
                                  <td data-bind="text: condicion"></td>
                                  <td data-bind="text: nota"><span class="label label-danger"></span></td>
                                  <td data-bind="text: nota>=6 ? 'Aprobado' : '' "></td>
                               </tr>
                               </tbody>
                      </table>
							</div>
							<div class="col-xs-2">
							</br>
							<b>&nbsp;&nbsp;Promedio</b>
							</br>
							</br>
							<span class="badge badgeTam" id="mySpan"></span>
							<br>
							</div>
			</div> 
			<!--end row en col-8 -->
			</br>
			<div class="row">
			<div class="col-md-12">
			<div class="franja-Cursos"><b>CURSOS</b></div>
			</br>
		 <!-- Project One -->
        <div class="row">
            <div class="col-md-4">
                <a href="#">
                    <img class="img-responsive" src="img/eng-1.png" alt="">
                </a>
            </div>
            <div class="col-md-8">
                <h3>Project One</h3>
                <h4>Subheading</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                <a class="btn btn-primary" href="#">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
        <!-- /.row -->
		<div class="row">
		<div class="col-md-12 col-md-offset-4">
	
		<ul class="pagination pagination-lg">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
        </ul>
		
		</div>
		
		</div>
        

        

        <hr>

 

			</div>
			</div>
          </div><!--end col-8 -->
				                   
               </div>
             <% }
					    else{ 
					%>    	
				<div class="row">
				<div class="col-12">
				No tiene permiso para acceder a esta p·gina</div>
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
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

   <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js"></script>
<script>
$(document).ready(function () {
	  viewModel=
	    {
	    notas: ko.observableArray([])
	    };
	   
	    
	var ruta= "ServletAlumnoEnExamen";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					//manejar data
					viewModel.notas(datos.notas);
					calculaProm();
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
	 ko.applyBindings(viewModel);
     
});
function calculaProm(){
	notaTotal= 0;
	cant= 0;
	for(i=0; i< viewModel.notas().length;++i)
		{
		if(viewModel.notas()[i].ex.estado == 'sin generar' || viewModel.notas()[i].condicion == 'sin cargar')
			{
			//no hago nada
			}else{
		notaTotal= viewModel.notas()[i].nota + notaTotal;
		cant= cant+1;
			}
		}
	prom= notaTotal/cant;
	$('#mySpan').text(prom.toFixed(2));
}
</script>
	<script src="js/tableFilter.js"></script>

</body>

</html>
