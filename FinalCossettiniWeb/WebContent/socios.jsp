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
	<link href="css/build.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.css"/>
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
                <a class="navbar-brand" href="index.jsp">Home</a>
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
                    <li>
                        <a href="index.jsp"><i class="fa fa-fw fa-home fa-lg"></i>Home</a>
                    </li>
					 <li>
                        <a href="cargaAlumnos.jsp"><i class="fa fa-fw fa-file-excel-o fa-lg" style="color:green"></i>Carga Inicial Sigae</a>
                    </li>
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
                   
                   
                    <li>
                        <a href="profesores.jsp"><i class="fa fa-fw fa-user fa-lg" style="color:orange"></i> Profesores</a>
                    </li>
                    <li>
                        <a href="cursos.jsp"><i class="fa fa-fw fa-book fa-lg" style="color:blue"></i> Cursos</a>
                    </li>
                    <li class="active">
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
                            Gesti�n socios
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> 
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
				<div class="col-lg-12">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel1" onclick="showPanel();">Click aquí para agregar Socio</a>
					<div class="form-group pull-right">
					<input type="text" id="filter" class="search form-control" placeholder="Filtrar">
					</div>
					<span class="counter pull-right"></span>
				<table class="table table-hover table-bordered results">
				  <thead>
					<tr>
					  <th>#</th>
					  <th class="col-md-4 col-xs-4">Name / Surname</th>
					  <th class="col-md-3 col-xs-3">Job</th>
					  <th class="col-md-3 col-xs-3">City</th>
					  <th class="col-md-2 col-xs-2"></th>
					</tr>
					<tr class="warning no-result">
					  <td colspan="5"><i class="fa fa-warning"></i> No result</td>
					</tr>
				  </thead>
							  <tbody>
								<tr>
								  <th scope="row">1</th>
								  <td>Vatanay Özbeyli</td>
								  <td>UI & UX</td>
								  <td>Istanbul</td>
								  <td align="center">
								  <button type="button" class="btn-md btn-success" aria-label="Left Align" onclick="setModalPago()" data-toggle="modal"
								  data-target="#myModalPago">
									<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
								   </button>
								  <button type="submit" class="btn-md btn-info" onclick="editarModal()" >
								   <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								  </button>
								  <button type="submit" class="btn-md btn-danger" onclick="confirmaEliminar()">
								   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								  </button>
								 </td>
								</tr>
								
								<tr>
								  <th scope="row">2</th>
								  <td>Burak Özkan</td>
								  <td>Software Developer</td>
								  <td>Istanbul</td>
								  <td align="center">
								  <button type="button" class="btn-md btn-success" aria-label="Left Align" onclick="setModalPago()" data-toggle="modal"
								  data-target="#myModalPago">
									<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
								   </button>
								  <button type="submit" class="btn-md btn-info" onclick="editarModal()" >
								   <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								  </button>
								  <button type="submit" class="btn-md btn-danger" onclick="confirmaEliminar()">
								   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								  </button>
								 </td>
								</tr>
								<tr>
								  <th scope="row">3</th>
								  <td>Egemen Özbeyli</td>
								  <td>Purchasing</td>
								  <td>Kocaeli</td>
								   <td align="center">
								  <button type="button" class="btn-md btn-success" aria-label="Left Align" onclick="setModalPago()" data-toggle="modal"
								  data-target="#myModalPago">
									<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
								   </button>
								  <button type="submit" class="btn-md btn-info" onclick="editarModal()" >
								   <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								  </button>
								  <button type="submit" class="btn-md btn-danger" onclick="confirmaEliminar()">
								   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								  </button>
								 </td>
								</tr>
								<tr>
								  <th scope="row">4</th>
								  <td>Engin Kızıl</td>
								  <td>Sales</td>
								  <td>Bozuyük</td>
								 <td align="center">
								  <button type="button" class="btn-md btn-success" aria-label="Left Align" onclick="setModalPago()" data-toggle="modal"
								  data-target="#myModalPago">
									<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
								   </button>
								  <button type="submit" class="btn-md btn-info" onclick="editarModal()" >
								   <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								  </button>
								  <button type="submit" class="btn-md btn-danger" onclick="confirmaEliminar()">
								   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								  </button>
								 </td>
								</tr>
							  </tbody>
				</table>
				</div>
				<!--/.class -->
                     
                       
                    
                </div>
                <!-- /.row -->
				<div class="row">
				<div class="col-md-12">
				<div class="panel-group" id="accordion">
				
						<div id="panel1" class="panel-collapse collapse">
						<div class="panel-body">
							<section class="panel panel-info">
                                <header class="panel-heading">
                                 Datos socio
                                </header>
                                <div class="panel-body">
                                    <form class="form-horizontal tasi-form" method="get">
                                      <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="txtNombreSocio">Nombre</label>
                                          <div class="col-lg-10">
                                             <input type="text" name="txtNombre" id="txtNombreSocio" class="form-control"/>
                                          </div>
                                      </div>
									  <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="txtApellido">Apellido</label>
                                          <div class="col-lg-10">
                                             <input type="text" name="txtApellido" id="txtApellido" class="form-control"/>
                                          </div>
                                      </div>
									 <div class="form-group">
										<label class="col-sm-2 control-label col-lg-2">Cargos Socio</label>
										<div class="col-lg-10 checkbox-circle">
										   
											<div class="checkbox-inline checkbox-circle">
											<input type="checkbox">Profesor/a
											</div>
											<div class="checkbox-inline checkbox-circle">
											<input type="checkbox">Secretaria
											</div>
											<div class="checkbox-inline checkbox-success checkbox-circle">
											<input type="checkbox">Alumno
											</div>
										</div>
									</div>
									 <div class="form-group">
									 <div class="col-lg-offset-6">
										<button type='submit' name='seach' id='search-btn' class="btn-md btn-info">Agregar</button>
									</div>
									</div>

									
									</div>

                                  </form>
                              </div>
                            </section>
						</div>
						</div>
				
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
<!-- Modal Modificar -->


<div class="modal fade" id="myModalPago" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Registrar Pago</h4>
        </div>
        <div class="modal-body">
		<form id="registroPago">
		<div class="row">
			<div class="col-md-3">
                <a href="#">
                    <img class="img-responsive" src="img/socioPago.jpg" alt="">
                </a>
            </div>
			<div class="col-md-7 textoSocioPago">
               <p><b><i>Instituto  de educación superior N° 28 Olga Cossetini</b></i></p>
            </div>
			<div class="col-md-2">
             <i>Comprobante</i>
			 </br>
			 N°XXXXXX
			</div>
		</div>
		<div class="row">
		<div class="col-md-offset-2 col-md-3 compr">
		<p>Fecha de emisión:</p>
		</div>
		<div class="col-md-offset-5">
		FECHA ACTUAL
		</div>
		</div>
		<div class="row">
		<div class="col-md-offset-2 col-md-3 compr">
		<p>Recibí de:</p>
		</div>
		<div class="col-md-offset-5">
		NOMBRE + APELLIDO SOCIO
		</div>
		</div>
		<div class="row">
		<div class="col-md-offset-2 col-md-3 compr">
		<p>En concepto por:</p>
		</div>
		<div class="col-md-offset-5">
		COOPERADORA
		</div>
		</div>
		<div class="row">
		<div class="col-md-offset-2 col-md-3 compr">
		<p>La suma de:</p>
		</div>
		<div class="col-md-offset-5">
		Importe en pesos
		</div>
		</div>
		<div class="row">
		<div class="col-md-offset-2 col-md-2 compr">
		<p>Firma:</p>
		</div>
		<div class="col-md-2">
		<div class="ezeq">
		<hr style="border:1px dotted black;" />
		</div>
		</div>
		</div>
       </form> 
        </div>
       <div class="modal-footer">
         
          <button id ="btnModific" type="button" onclick="registrarPago()" class="btn btn-primary" data-dismiss="modal" >Registrar Pago</button>
        </div>
       
      </div>
    </div>
  </div>
  	

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/tableFilter.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
  $('#panelShow').hide();  
});

function showPanel(){
$('#panelShow').show();
 $('html,body').animate({
        scrollTop: $("#accordion").offset().top},
        'slow');
}
function setModalPago()
{///datos al modal;
}
function regirtrarPago()
{
alert("se tiene que preguntar si quiere imprimir comprobante");
}
function editarModal()
{
alert("El modal editar se tiene que abrir");
}
function confirmaEliminar()
{
alert("Va a eliminarlo");
}
</script>
<script type="text/javascript">
function justNumbers(e)
{
var keynum = window.event ? window.event.keyCode : e.which;
if ((keynum == 8) || (keynum == 46))
return true;
 
return /\d/.test(String.fromCharCode(keynum));
} </script>
	

</body>

</html>
