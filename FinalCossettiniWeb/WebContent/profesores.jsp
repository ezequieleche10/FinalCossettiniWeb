<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Profesores</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styleTable.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
	<link href="css/spinner.css" rel="stylesheet">
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
	.ui-datepicker-month{color:black;}
	.ui-datepicker-year{color:black;}
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
                            Seccion Profesores
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Profesores
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
					<a data-toggle="modal" data-target="#myModalAgregar" >Click aquí para agregar Profesor</a>
					<div class="form-group pull-right">
					<input type="text" id="filter" class="search form-control" placeholder="Filtrar">
					</div>
					<span class="counter pull-right"></span>
					<div class="table-responsive">
				<table class="table table-hover table-bordered results">
				  <thead>
					<tr>
					  <th class="col-md-4 col-xs-4">Nombre</th>
					  <th class="col-md-3 col-xs-3">Apellido</th>
					  <th class="col-md-3 col-xs-3">Fecha Nacimiento</th>
					  <th class="col-md-2 col-xs-2"></th>
					</tr>
				
				  </thead>
							  <tbody data-bind="foreach: profesores">
								<tr>
								 
								  <td data-bind="text: nombre"></td>
								  <td data-bind="text: apellido"></td>
								  <td data-bind="text: fecha_nac"></td>
								  <td align="center">
								   <button type="button" class="btn-md btn-info glyphicon glyphicon-pencil" aria-label="Left Align" data-bind="click: $parent.setModalEditar" data-toggle="modal"  
								  data-target="#myModalEditar">
								  
								  </button>
								  <button type="button" class="btn-md btn-danger glyphicon glyphicon-remove" data-bind="click: $parent.eliminarProfesor" >
								   
								  </button>
								 </td>
								</tr>
							</tbody>
				</table>
				</div>
				</div>
				<!--/.class -->
                     
                       
                    
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
<div class="modal fade" id="myModalAgregar" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Alta Profesor</h4>
        </div>
        <div class="modal-body">
      <form class="form-horizontal tasi-form">
      <div id="lblClaves" style="display:none" align="center"><label style="color:red"></label></div>
	 <div class="form-group">
      <label class="col-sm-2 control-label col-lg-2" for="inputNombre">Nombre:</label>
      <div class="col-lg-10">
      <input type="text" id="txtNombre" class="form-control"/>
       </div>
       </div>
									   <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="inputApellido">Apellido:</label>
                                          <div class="col-lg-10">
                                            <input type="text" id="txtApellido" class="form-control"/>
                                          </div>
                                      </div>
									
                                      <div class="form-group">
                                        <label class="col-sm-2 control-label col-lg-2" for="inputFechaNac">Fecha Nacimiento:</label>
							            <div class="col-lg-10" >
							                <input type="text" class="form-control" id="datepicker4" readonly />
							            </div>
        								</div>
									  <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="inputUsuario">Usuario:</label>
                                          <div class="col-lg-10">
                                            <input type="text" id="txtUsuario" class="form-control" onblur="validaUsuario()"/>
                                          </div>
                                      </div>
									  <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="inputClave">Clave:</label>
                                          <div class="col-lg-10">
                                            <input type="password" id="txtClave" class="form-control"/>
                                          </div>
                                      </div>
									  <div class="form-group">
                                          <label class="col-sm-2 control-label col-lg-2" for="inputClave">Repetir Clave:</label>
                                          <div class="col-lg-10">
                                            <input type="password" id="txtRepClave" class="form-control"/>
                                           </div>
                                          
                                      </div>
		</form>
		</div>
       <div class="modal-footer">
         
          <button id ="btnEgreso" type="submit" onclick="return altaProfesor();" class="btn btn-primary" >Agregar</button>
        </div>
       
      </div>
    </div>
  </div>
  <div class="modal fade" id="myModalEditar" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Editar Profesor</h4>
        </div>
        <div class="modal-body">
      <form class="form-horizontal tasi-form">
	 <div class="form-group">
      <label class="col-sm-2 control-label col-lg-2" for="inputNombre">Nombre:</label>
      <div class="col-lg-10">
      <input type="text" id="txtNombreE" class="form-control"/>
       </div>
       </div>
	   <div class="form-group">
          <label class="col-sm-2 control-label col-lg-2" for="inputApellido">Apellido:</label>
          <div class="col-lg-10">
            <input type="text" id="txtApellidoE" class="form-control"/>
          </div>
     	 </div>
	
         <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="inputFechaNac">Fecha Nacimiento:</label>
           <div class="col-lg-10" >
               <input type="text" class="form-control" id="datepickerE" readonly />
           </div>
		</div>
	  <div class="form-group">
        <label class="col-sm-2 control-label col-lg-2" for="inputUsuario">Usuario:</label>
        <div class="col-lg-10">
          <input type="text" id="txtUsuarioE" class="form-control" readonly/>
        </div>
       </div>
  	</form>
		</div>
       <div class="modal-footer">
          <button id ="btnEgreso" type="button" onclick=" return editarProfesor();" class="btn btn-primary">Editar</button>
        </div>
       
      </div>
    </div>
  </div>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/tableFilter.js"></script>
	<script src="js/jquery-ui.min.js"></script>
 <script>
  $(function() {
    $( "#datepicker4" ).datepicker({ changeMonth: true,
        changeYear: true,background:"#999",yearRange: '1950:2016', });
  //  $( "#format" ).change(function() {
    //    $( "#datepicker4" ).datepicker( "option", "dateFormat","yyyy-mm-dd" );
     // });
    $( "#datepickerE" ).datepicker({ changeMonth: true,
        changeYear: true,background:"#999",yearRange: '1950:2016', });
  });
  </script>
  <script type="text/javascript">
$( document ).ready(function() {
  $('#panelShow').hide();  
 
		viewModel=
	    {	
	    	profesores: ko.observableArray([]),
	    	selectedProfesor:ko.observable()
	    	
	    	
	    };
		
		
		viewModel.eliminarProfesor= function(profesor)
	    {	
			$('<div></div>').appendTo('body')
			.html("Esta seguro de eliminar el profesor? <br> No se pueden revertir los cambios") 
			.dialog({
			    modal: true,
			    title: 'Eliminar',
			    zIndex: 10000,
			    autoOpen: true,
			    width: 'auto',
			    resizable: false,
			    buttons: {
			        OK: function () {
			        	var ruta= "ServletBorrarProfesor";
				    	$.ajax({
				    			async: false,
				    			url: ruta,
				    			type: "POST",
				    			dataType: "json",
				    			data: "profesor="+JSON.stringify(profesor),
				    			success: function(datos)
				    			{ 
				    				if(datos.respInfo=="OK")
				    					{
				    					
				    					viewModel.profesores.remove(profesor);
				    					
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

			//go to servlet and eliminarlo del modelo
	    	
			
		};
		viewModel.setModalEditar= function(profesor)
	    {	viewModel.selectedProfesor=profesor;
			$('#txtNombreE').val(profesor.nombre);	
			$('#txtApellidoE').val(profesor.apellido);	
			$('#datepickerE').val(profesor.fecha_nac);
			$('#txtUsuarioE').val(profesor.usuario.nombre_usuario);
				
			
			
		};
		 ko.applyBindings(viewModel);
		//llamada ajax que devuelve el examen y carga el modelo con knockout
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
							alert("Ha ocurrido un error cargando socios, reintente logueandose");
							}
						
					},
					error: function(datos) {
				        //AJAX request not completed
				       alert("There was an error");
				    }
				
			});   
	});

function altaProfesor(){
	var apellido=$('#txtApellido').val();
	var nombre=$('#txtNombre').val();
	var fecha_nac=$('#datepicker4').val()
	var usuarioI=$('#txtUsuario').val();
	var clave=$('#txtClave').val();
	var repclave=$('#txtRepClave').val();
	var valu=0;
	if(validacionIngreso()){
		var usuario={"nombre_usuario":usuarioI,"clave":clave}
		var profesor= {"apellido": apellido,"nombre":nombre,"fecha_nac":fecha_nac,"usuario":usuario};
		
		var ruta= "ServletAgregarProfesor";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				data: {"profesor":JSON.stringify(profesor)},
				success: function(datos)
				{ 
					if(datos.respInfo=="OK")
						{
						alert("Profesor Agregado Correctamente");
						viewModel.profesores.push(profesor);
						
						
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
		
	}else{
		
		$('#lblClaves').css({"display": ''}); valu=1;;
	}
if(valu===0){
	
	$('#myModalAgregar').modal('hide');
	limpiarPanel();
	}else {return false;}
}
function validacionIngreso(){
	var apellido=$('#txtApellido').val();
	var nombre=$('#txtNombre').val();
	var fecha_nac=$('#datepicker4').val()
	var usuarioI=$('#txtUsuario').val();
	var clave=$('#txtClave').val();
	var repclave=$('#txtRepClave').val();
	var bandera= true;
	var mensaje="";
	if(clave!== repclave){
		bandera=false;
		mensaje+= "Claves no coinciden ";
	}
	if(apellido===""){
		bandera=false;
		mensaje+= "Apellido no puede ser vacio ";
	}
	if(nombre===""){
		bandera=false;
		mensaje+= "Nombre no puede ser vacio ";
	}
	if(fecha_nac===""){
		bandera=false;
		mensaje+= "Fecha Nacimiento no puede ser vacio ";
	}
	if(usuarioI===""){
		bandera=false;
		mensaje+= "Nombre usuario no puede ser vacio ";
	}
	if(!bandera)
		{$('#lblClaves').text(mensaje)}
	return bandera;
	
}	
function limpiarPanel(){
	$('#txtApellido').val("");
	$('#txtNombre').val("");
	$('#datepicker4').val("")
	$('#txtUsuario').val("");
	$('#txtClave').val("");
	$('#txtRepClave').val("");
}	

function editarProfesor(){
	//recupero elementos y creo el socio con su cargo
	if($('#txtNombreE').val() != "" && $('#txtApellidoE').val()!= "" && $('#datepickerE').val()!= "")
		{
	viewModel.selectedProfesor.nombre= $('#txtNombreE').val();	
	viewModel.selectedProfesor.apellido=$('#txtApellidoE').val();
	viewModel.selectedProfesor.fecha_nac=$('#datepickerE').val();
	
	var ruta= "ServletEditarProfesor";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data: "profesor="+JSON.stringify(viewModel.selectedProfesor),
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert("Profesor Modificado Correctamente");
					window.location.href="profesores.jsp";
					
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
		
	});}
	else {alert("Complete todos los campos");
	return false;}
}
function validaUsuario(){
	var existe;
	
	$.ajax({ 
		async: false,
		type : 'POST',
		data : "inputUsername="+$('#txtUsuario').val(),
		url  : 'existeUsuario.jsp',
		success: function(data){ // Get the result and asign to each cases
			
			if(data==1)
			{
			//Ok
				existe=true;
				alert("Nombre de Usuario existente, ingrese otro");
				$('#txtUsuario').focus();		
			}
			else
			{ 	
				existe=false;;
			}
			
		}
			
		});
	
	return existe;
}
function validaCoincidePass(){
	if($('#txtClave').val()==$('#txtRepClave')){
	alert("las claves no coinciden");
	}
	
}

</script>
</body>

</html>
