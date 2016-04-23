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
	<link href="css/spinner.css" rel="stylesheet">
	<link href="css/wizard.css" rel="stylesheet">


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
                <a class="navbar-brand" href="index.html">SB Admin</a>
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
					<li class="active">
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
                    <li>
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
				
				<div class="row">
				<div class="col-md-12">
				<div class="container-fluid"> 
				<div class="stepwizard"> 
				<div class="stepwizard-row setup-panel"> 
					<div class="stepwizard-step"> 
				<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a> <p>Lista Alumnos</p> 
					</div> 
					<div class="stepwizard-step"> 
				<a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a> <p>Comisión y Profesores</p> 
					</div> 
					<div class="stepwizard-step"> 
				<a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a> <p>Ejercicios</p>
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
					<input type="text" name="txtano" required="required" class="form-control" placeholder="Ingrese Año" /> 
					<button type="button" class="btn btn-info" aria-label="Left Align">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					
					</button>
				<input type="text" name="txtTipoExamen" readonly class="form-control" placeholder="Tipo Examen" />
					</div> 
				<div class="col-lg-12">
                        <h2>Alumnos en lista</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Page</th>
                                        <th>Visits</th>
                                        <th>% New Visits</th>
                                        <th>Revenue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="active">
                                        <td>/index.html</td>
                                        <td>1265</td>
                                        <td>32.3%</td>
                                        <td>$321.33</td>
                                    </tr>
                                    <tr class="success">
                                        <td>/about.html</td>
                                        <td>261</td>
                                        <td>33.3%</td>
                                        <td>$234.12</td>
                                    </tr>
                                    <tr class="warning">
                                        <td>/sales.html</td>
                                        <td>665</td>
                                        <td>21.3%</td>
                                        <td>$16.34</td>
                                    </tr>
                                    <tr class="danger">
                                        <td>/blog.html</td>
                                        <td>9516</td>
                                        <td>89.3%</td>
                                        <td>$1644.43</td>
                                    </tr>
                                    
                                   
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
				<button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button> 
				</div> 
				</div> 
				</div> 
				<div class="row setup-content" id="step-2"> 
				<div class="col-xs-12"> 
				<div class="col-md-12"> <h3>Comisión y profesores</h3> 
				<div class="form-group"> 
					
					<label class="control-label">Nombre</label>
					<input type="text" name="txtNombre" required="required" class="form-control" placeholder="Nombre Comision" /> 
					</br>
					<label class="control-label">Descripción</label>
					<textarea class="form-control" rows="2"></textarea>
				</div>
				<div class="col-lg-12">
                        <h2>Profesores asignados a la comisión</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Page</th>
                                        <th>Visits</th>
                                        <th>% New Visits</th>
                                        <th>Revenue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="active">
                                        <td>/index.html</td>
                                        <td>1265</td>
                                        <td>32.3%</td>
                                        <td>$321.33</td>
                                    </tr>
                                    <tr class="success">
                                        <td>/about.html</td>
                                        <td>261</td>
                                        <td>33.3%</td>
                                        <td>$234.12</td>
                                    </tr>
                                    <tr class="warning">
                                        <td>/sales.html</td>
                                        <td>665</td>
                                        <td>21.3%</td>
                                        <td>$16.34</td>
                                    </tr>
                                    <tr class="danger">
                                        <td>/blog.html</td>
                                        <td>9516</td>
                                        <td>89.3%</td>
                                        <td>$1644.43</td>
                                    </tr>
                                    
                                   
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
				<div class="col-md-12">
				<div class="col-md-3 col-md-offset-4">
				<button type="button" class="btn-lg btn-info" aria-label="Left Align">Generar Comisión</button>
				</div>
				<div class="col-md-5">
				<button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button> 
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
                                  <form class="form-horizontal" role="form">
										 <div class="form-group">
                                          <label class="col-lg-3 col-sm-3 control-label">Nombre:</label>
                                          <div class="col-lg-9">
                                              <input type="Nombre" class="form-control" id="inputEmail1" placeholder="Nombre">
                                          </div>
										  </div>
										  </br>
										  </br>
										  <div class="form-group">
										  <label class="col-lg-3 col-sm-3 control-label">Items:</label>
                                          <div class="col-lg-9">
                                              <input type="Items" class="form-control" id="inputItems" placeholder="Items">
                                          </div>
										  </div>
										  </br>
										  </br>
										  <div class="form-group">
										  <label class="col-lg-3 col-sm-3 control-label">Porcentaje:</label>
                                          <div class="col-lg-9">
										  <div class="input-group">
											<input type="text" class="form-control" id="txtPorcentaje" placeholder="Porcentaje">
											<div class="input-group-addon">%</div>
											</div>
                                             
                                          </div>
										  </div>
                                         </br>
										  </br>
										 
										 <div class="form-group">
										 <label class="col-lg-3 col-sm-3 control-label">Descripcion:</label>
                                          <div class="col-lg-9">
                                          <textarea class="form-control" rows="2"></textarea>
                                          
										  </div>
										 </div>
										
                                      
                                     
                                     
                                  </form>
								  </div>
								  	<!-- /.class col lg5 -->
								<div class="col-lg-1">
								</br>
								</br>
								</br>
								</br>
								<button type="button" class="btn-lg btn-danger" aria-label="Left Align">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								</button>
								</div>
                              
							  	<!-- /.class col lg1 -->
								<div class="col-lg-6 col-xs-12">
								<table class="table table-hover table-bordered results">
						  <thead>
							<tr>
							  <th>#</th>
							  <th class="col-md-4 col-xs-4">Name</th>
							  <th class="col-md-4 col-xs-4">Job</th>
							  <th class="col-md-3 col-xs-3">City</th>
							  <th class="col-md-1 col-xs-1"></th>
							</tr>
							</thead>
									  <tbody>
										<tr>
										  <th scope="row">1</th>
										  <td>Vatanay Özbeyli</td>
										  <td>UI & UX</td>
										  <td>Istanbul</td>
										  <td>
										  <button type="submit" class="btn-xs btn-info" onclick="editarModal()" >
										   <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										  </button>
										  <button type="submit" class="btn-xs btn-warning" onclick="confirmaEliminar()">
										   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										  </button>
										  </td>
										</tr>
										<tr>
										  <th scope="row">2</th>
										  <td>Burak Özkan</td>
										  <td>Software Developer</td>
										  <td>Istanbul</td>
										  <td>
										  <button type="submit" class="btn-xs btn-info">
										   <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										  </button>
										  <button type="submit" class="btn-xs btn-warning">
										   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										  </button>
										  </td>
										</tr>
										<tr>
										  <th scope="row">3</th>
										  <td>Egemen Özbeyli</td>
										  <td>Purchasing</td>
										  <td>Kocaeli</td>
										  <td>
										  <button type="submit" class="btn-xs btn-info">
										   <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										  </button>
										  <button type="submit" class="btn-xs btn-warning">
										   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										  </button>
										  </td>
										</tr>
										
									  </tbody>
						</table>
								</div>
								</div>
                          </section>
				<button class="btn btn-success btn-lg pull-right" type="submit">Generar Examen</button> 
				</div> 
				</div> 
				</div> 
				</form> 
				</div>
				</div>
				<!-- /.class -->
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
  	$('#rootwizard').bootstrapWizard();
});
	</script>

</body>

</html>
