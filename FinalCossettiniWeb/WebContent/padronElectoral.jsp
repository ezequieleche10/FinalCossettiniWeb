<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Padron</title>

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
                            Padrón Electoral
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Administración
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				<hr>
				<div class="row">
				<div class="col-lg-12">
				<div class="col-lg-6">
				<label>Monto mínimo establecido:</label>
				<label id="lblValuePadron">Value</label>
				<button class="btn-xs btn-success" onclick="habilitarCambio();"><i class="fa fa-fw fa-cog fa-xs"></i>Cambiar</button>
				</br>
				</br>
				<label class="col-lg-5" id="claveCambio" style="display:none">Ingrese clave:</label>
				<div class="col-lg-7">
				<input id="txtPassword" type="password" class="form-control input-sm" id="txtPassword" style="display:none">
				</div>
				<label class="col-lg-5" id="lblNuevoMonto" style="display:none">Ingrese nuevo monto:</label>
				<div class="col-lg-7">
				<input type="number" class="form-control input-sm" id="txtNuevoMonto" style="display:none">
				</div>
				</br>
				<button id="btnVistaPreliminar" class="btn-info btn-md col-lg-offset-6" style="display:none" onclick="vistaPreliminar()"><i class="fa fa-fw fa-search-plus fa-lg" style="color:light-blue"></i>Vista Preliminar</button> 
				<button id="btnGuardarNuevoMonto" class="btn-info btn-md" style="display:none" onclick="guardarNuevoMonto()"><i class="fa fa-fw fa-save fa-lg" style="color:light-blue" ></i>Guardar</button>
				</div>
				
				<div class="col-lg-6">
				<p>El padrón se generará en cada año, las personas habilitadas para participar en la realización del mismo deben superar un monto de
				dinero abonado en cooperadora. El mismo solo podrá variar por medio de la persona responsable.
				</div>
				</div>
			   </div>
               <div class="row">
				<hr>
				<div class="col-lg-12">
				<label><div id="lblInfoPadron">*En la presente tabla se muestran los habilitados para el padrÃ³n con el mÃ­nimo actual</div></label>
			    <div class="form-group pull-right">
					<input type="text" class="search form-control" placeholder="Filtrar">
				</div>
					<span class="counter pull-right"></span>
			   <table id="printTable" class="table table-hover results">
				  <thead>
					<tr>
					  <th class="col-md-4 col-xs-4">Nombre y Apellido</th>
					  <th class="col-md-4 col-xs-4">Cargos</th>
					</tr>
					<tr class="warning no-result">
					  <td colspan="3"><i class="fa fa-warning"></i> No hay resultados encontrados</td>
					</tr>
				  </thead>
							  <tbody data-bind="foreach: padron().sociosHab">
								<tr>
								  
								  <td data-bind="text: nya"></td>
								  <td data-bind="text: cargosS"></td>
								
								</tr>
								
							  </tbody>
				</table>
			   </div>
			  
			   </div>
               <div class="row">
			   <div class="col-lg-12">
			   <div align="center">
			   
			   <button class="btn-md btn-success pull-right" onclick="generarPadron()">Generar Padrón</button>
			   <button class="btn-md btn-success pull-right" style="margin-right:2px;" onclick="printData()"><i class="fa fa-fw fa-print fa-lg"></i>Imprimir</button></div>
			   </div>
			   </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<div id="myModalEditar" style="display:none" >
   <table class="table-bordered">
   <thead>
   <tr>
   <th>Apellido y Nombre</th>
   <th>Cargos</th>
   </tr>
   </thead>
   <tbody data-bind="foreach:  sociosHabilitados">
   <tr>
   <td data-bind="text: nya">
   </td>
   <td data-bind="text: cargosS">
   </td>
   </tr>
   </tbody>
   </table>
</div>
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
  <script src="js/jquery-ui.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
   
   <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js"></script>
<script>
$( document ).ready(function() {
	  viewModel=
		    {	
		    	padron: ko.observableArray([]),
		    	sociosHabilitados:ko.observableArray([])
		    	
		    };
ko.applyBindings(viewModel);
//llamada ajax que devuelve el examen y carga el modelo con knockout
 var ruta= "ServletBuscarPadron";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					viewModel.padron(datos.padron);
					$('#lblValuePadron').text('$' + viewModel.padron().montoMinimo);
				
					}
				else
					{
					alert("Ha ocurrido un error, reintente logueandose");
					}
				
			},
			error: function(datos) {
		        //AJAX request not completed
		       alert("There was an error");
		    }
		
	});
});
</script>
<script type="text/javascript">
function habilitarCambio(){
var element=document.getElementById('claveCambio');
element.style.display='';
var element=document.getElementById('lblNuevoMonto');
element.style.display='';
var element=document.getElementById('txtNuevoMonto');
element.style.display='';
var element=document.getElementById('txtPassword');
element.style.display='';
var element=document.getElementById('btnVistaPreliminar');
element.style.display='';
var element=document.getElementById('btnGuardarNuevoMonto');
element.style.display='';
}
function printData()
{
   var divToPrint=document.getElementById("printTable");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML);
   newWin.print();
   newWin.close();
}
function vistaPreliminar(){
//mismaa llamada al servlet del buscar Padron
//ver si llena el monto y la clave correcta el usuario
	var pass= $('#txtPassword').val();
	var nuevoMonto=$('#txtNuevoMonto').val();
	var ruta= "ServletListaPreliminar";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			data: {password: JSON.stringify(pass),valorMinimo:JSON.stringify(nuevoMonto),cod_padron:JSON.stringify(viewModel.padron().cod_padron)} ,
			dataType: "json",
			success: function(datos)
			{ 
				if(datos.passValida=="OK")
				{
					if(datos.respInfo=="OK")
					{
					viewModel.sociosHabilitados(datos.sociosHabilitados);
					muestraModal();
					}
					else
					{
					alert("Ha ocurrido un error, reintente logueandose");
					}
				}else{
					alert("Password incorrecta, reintente nuevamente");
				}
			},
			error: function(datos) {
		        //AJAX request not completed
		       alert("There was an error");
		    }
		
	});
	
}
function muestraModal(){
$('#myModalEditar').css({"display": ''});
$('<div></div>').appendTo('body')
.html($('#myModalEditar')) 
.dialog({
    modal: true,
    title: 'Lista Preliminar',
    zIndex: 10000,
    autoOpen: true,
    width: 'auto',
    resizable: false,
    buttons: {
        OK: function () {
            // $(obj).removeAttr('onclick');                                
            // $(obj).parents('.Parent').remove();
			$('#myModalEditar').css({"display": 'none'});
            $(this).dialog("close");
        },
        CANCEL: function () {
        	$('#myModalEditar').css({"display": 'none'});
            $(this).dialog("close");
        }
    },
    close: function (event, ui) {
        $(this).remove();
    }
});
}
function guardarNuevoMonto(){
	var nuevoMonto= $('#txtNuevoMonto').val();
	var pass= $('#txtPassword').val();
	if(nuevoMonto == "" || pass=="" )
		{
		alert("Chequear password o monto");
		}
	else{
		var ruta= "ServletGuardaNuevoMonto";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				data: {password: JSON.stringify(pass),valorMinimo:JSON.stringify(nuevoMonto),cod_padron:JSON.stringify(viewModel.padron().cod_padron)} ,
				dataType: "json",
				success: function(datos)
				{ 
					if(datos.passValida=="OK")
					{
						if(datos.respInfo=="OK")
						{
						alert("Monto cambiado correctamente!!");
						window.location.href='padronElectoral.jsp';
						}
						else
						{
						alert("Ha ocurrido un error, reintente logueandose");
						}
					}else{
						alert("Password incorrecta, reintente nuevamente");
					}
				},
				error: function(datos) {
			        //AJAX request not completed
			       alert("There was an error");
			    }
			
		});
	}
}
function generarPadron(){
	$('<div></div>').appendTo('body')
	.html($('<div><h5>Está seguro de generar padrón, los cambios no se van a poder deshacer?</h5></div>')) 
	.dialog({
	    modal: true,
	    title: 'Confirmar',
	    zIndex: 10000,
	    autoOpen: true,
	    width: 'auto',
	    resizable: false,
	    buttons: {
	        Generar: function () {
	            // $(obj).removeAttr('onclick');                                
	            // $(obj).parents('.Parent').remove();
				alert("llamada servlet que cambia estado del padron");
	            $(this).dialog("close");
	        },
	        Cancelar: function () {
	        	$('#myModalEditar').css({"display": 'none'});
	            $(this).dialog("close");
	        }
	    },
	    close: function (event, ui) {
	        $(this).remove();
	    }
	});
}
</script>
	<script src="js/tableFilter.js"></script>

</body>

</html>
