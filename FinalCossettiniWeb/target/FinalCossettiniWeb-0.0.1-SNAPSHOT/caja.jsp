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

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

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
                <a class="navbar-brand" href="index.html">Instituto Olga Cossettini</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
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
                                        <h5 class="media-heading"><strong>Usuario</strong>
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
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
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
              <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
             
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="index.html"><i class="fa fa-fw fa-home fa-lg"></i>Home</a>
                    </li>
					 <li>
                        <a href="cargaAlumnos.html"><i class="fa fa-fw fa-file-excel-o fa-lg" style="color:green"></i>Carga Inicial Sigae</a>
                    </li>
					<li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-file-text fa-lg" style="color:red"></i> Exámenes <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#"><i class="fa fa-fw fa-list fa-lg" style="color:red"></i>Lista de alumnos en condiciones</a>
                            </li>
                            <li>
                                <a href="agregarExamen.html"><i class="fa fa-fw fa-plus fa-lg" style="color:red"></i>Alta Exámen</a>
                            </li>
							<li>
                                <a href="generarExamen.html"><i class="fa fa-fw fa-magic fa-lg" style="color:red"></i>Generar Exámen</a>
                            </li>
							<li>
                                <a href="cargarNotas.html"><i class="fa fa-fw fa-upload fa-lg" style="color:red"></i>Cargar Notas</a>
                            </li>
							<li>
                                <a href="verNotas.html"><i class="fa fa-fw fa-search-plus fa-lg" style="color:red"></i>Ver Notas</a>
                            </li>
                        </ul>
                    </li>
                   
                   
                    <li>
                        <a href="profesores.html"><i class="fa fa-fw fa-user fa-lg" style="color:orange"></i> Profesores</a>
                    </li>
                    <li>
                        <a href="cursos.html"><i class="fa fa-fw fa-book fa-lg" style="color:blue"></i> Cursos</a>
                    </li>
                    <li class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-fw fa-money fa-lg" style="color:green"></i> Cooperadora <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo2" class="collapse">
                            <li>
                                <a href="socios.html"><i class="fa fa-fw fa-dollar fa-lg" style="color:green"></i>Socios</a>
                            </li>
                            <li>
                                <a href="caja.html"><i class="fa fa-fw fa-sort-numeric-asc fa-lg" style="color:green"></i>Caja</a>
                            </li>
							<li>
                                <a href="padronElectoral.html"><i class="fa fa-fw fa-list-alt fa-lg" style="color:green"></i>Padrón Electoral</a>
                            </li>
							
                        </ul>
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
                            Caja <small>Resumen</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Ver
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
			<div class="row">
			<div class="col-lg-6">
			<div class="cajaStyle"><h4>Período actual</h4></div>
			</br>
			<div class="row">
			<div class="col-lg-6">
			<label>Fecha desde:</label><label class="col-lg-offset-1" id="lblFechaDesde">MesInicial</label>
			</div>
			<div class="col-lg-6">
			<label>Fecha hasta:</label><label class="col-lg-offset-1" id="lblFechaHasta">MesFinal</label>
			</div>
			</div>
			<div class="row" align="center">
			<table class="table table-bordered">
				  <thead>
					<tr>
					  <th class="col-md-4 col-xs-4">Fecha</th>
					  <th class="col-md-4 col-xs-4">Monto</th>
					  <th class="col-md-4 col-xs-4">Tipo</th>
					</tr>
					
				  </thead>
							  <tbody>
								<tr>
								  
								  <td>Fecha tal</td>
								  <td>Monto</td>
								  <td class="td-success">Ingreso</td>
								  
								</tr>
								<tr>
								 <td>Fecha tal</td>
								  <td>Monto</td>
								  <td class="td-danger">Egreso</td>
								</tr>
								
								<tr>
								<td align="center" colspan="3">
								<button type="button" class="btn-lg btn-success" aria-label="Left Align" data-toggle="modal" data-target="#myModalIngresos">Ingresos</button>
								<button type="button" class="btn-lg btn-danger" aria-label="Left Align"  data-toggle="modal" data-target="#myModalEgresos">Egresos</button>
								</td>
								</tr>
								</tbody>
			</table>
					</div>
			</div>
			
			<div class="col-lg-6">
	
			<div id="container" style="height: 400px"></div>
			</div>
			
			</div>
			
            
            
             

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
          <h4 class="modal-title">Modificar</h4>
        </div>
        <div class="modal-body">
		<form id="comentario">
		<input id="cod_auto" name="cod_auto" hidden />      
        <div class="form-group">
      
	   <label for="inputUsername" class="sr-only">Nombre de Usuario</label>
        <input type="text" name ="inputUsernameM" id="inputUsernameM" class="form-control" placeholder="Username" autofocus="" readonly>
		 <label for="inputUsername" class="sr-only">Nombre</label>
        <input type="text" name ="inputNombreM" id="inputNombreM" class="form-control" placeholder="Nombre" required="" autofocus="">
        <label for="inputUsername" class="sr-only">Apellido</label>
        <input type="text" name ="inputApellidoM" id="inputApellidoM" class="form-control" placeholder="Apellido" required="" autofocus="">
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="email" name ="inputEmailM" id="inputEmailM" class="form-control" placeholder="Email" required="" autofocus="">
		<label for="inputRol" class="sr-only">Rol</label>
		<select class="form-control" id="inputRolM">
		<option>1</option>
		<option>2</option>
		</select>
		 </div>
		   
         </form> 
        </div>
       <div class="modal-footer">
          <button id ="btnModific" type="button" onclick="validateEmail(inputEmailM.value)" class="btn btn-primary" data-dismiss="modal" >Modificar</button>
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
          <h4 class="modal-title">Elimina el auto seleccionado</h4>
        </div>
        <div class="modal-body">
		<form id="comentario">
		<input id="cod_auto" name="cod_auto" hidden />      
        <div class="form-group">
      
      <label for="EliminaAuto">¿Esta seguro que desea eliminar el usuario seleccionado??</label>
	  <label for="inputUsername" class="sr-only">Nombre de Usuario</label>
        <input type="text" name ="inputUsername" id="inputUsernameE" class="form-control" placeholder="Username" autofocus="" readonly>
		 <label for="inputUsername" class="sr-only">Nombre</label>
        <input type="text" name ="inputNombre" id="inputNombreE" class="form-control" placeholder="Nombre" required="" autofocus="" readonly>
        <label for="inputUsername" class="sr-only">Apellido</label>
        <input type="text" name ="inputApellido" id="inputApellidoE" class="form-control" placeholder="Apellido" required="" autofocus="" readonly>
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="text" name ="inputEmail" id="inputEmailE" class="form-control" placeholder="Email" required="" autofocus="" readonly>
		<label for="inputRol" class="sr-only">Rol</label>
        <input type="text" name ="inputRol" id="inputRolE" class="form-control" placeholder="Rol" required="" autofocus="" readonly>
        </div>
		   
         </form> 
        </div>
       <div class="modal-footer">
         
          <button id ="btnConfirma" type="button" onclick="eliminar()" class="btn btn-primary" data-dismiss="modal" >Confirmar</button>
          <button id ="btnCancela" type="button" onclick="this.close()" class="btn btn-primary" data-dismiss="modal" >Cancelar</button>
        </div>
       
      </div>
    </div>
  </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
   
   
    
<script>
// A $( document ).ready().
$(function () {
    $('#container').highcharts({

        xAxis: {
            categories: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
        },
		title: {
                text: 'Ingresos en el último año'
            },

        series: [{
            data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
        }]
    });


    // the button actions
  

});
</script>
	<script src="js/tableFilter.js"></script>

</body>

</html>
