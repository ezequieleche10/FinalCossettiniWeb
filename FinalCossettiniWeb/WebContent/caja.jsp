<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Caja</title>

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
              <%  try{ 
					    if(codRol == 1 || codRol==4 || codRol==5)
					    { %>    
			<div class="row">
			<div class="col-lg-6">
			<div class="cajaStyle"><h4>Período actual</h4></div>
			</br>
			<div class="row">
			<div class="col-lg-6">
			
			</div>
			</div>
			<div class="row" align="center">
			<div class="table-responsive">
			<table class="table table-bordered">
				  <thead><tr><th colspan="3">Ultimos ingresos</th></tr></thead>
						<tbody data-bind='template: { name: "fieldTemplate", foreach: pagedRows }'></tbody>
					</table>
					</div>
					<ul class="pagination">
					<li><a href="#" data-bind="click: previousPage, visible: pageIndex() > 0">&laquo;</a></li>
					<li><a href="#" data-bind="click: nextPage, visible: pageIndex() < maxPageIndex()">&raquo;</a></li>
					</ul>
					<div class="table-responsive">
					<table class="table table-bordered">
					<thead><tr><th colspan="3">Ultimos egresos</th></tr></thead>
						<tbody data-bind='template: { name: "fieldTemplate2", foreach: pagedRows2 }'></tbody>
							
					</table>
					</div>
					<ul class="pagination">
					<li><a href="#" data-bind="click: previousPage2, visible: pageIndex2() > 0">&laquo;</a></li>
					<li><a href="#" data-bind="click: nextPage2, visible: pageIndex2() < maxPageIndex2()">&raquo;</a></li>
					</ul>
					<br>
			<button type="button" class="btn-lg btn-success" aria-label="Left Align" data-toggle="modal" data-target="#myModalIngresos" onclick="setModalIngresos()">Ingresos</button>
			<button type="button" class="btn-lg btn-danger" aria-label="Left Align"  data-toggle="modal" data-target="#myModalEgresos" onclick="setModalEgresos()">Egresos</button>
					</div>
			</div>
			
			<div class="col-lg-6">
	
			<div id="container" style="height: 400px"></div>
			</div>
			
			</div>
			</br>
			<div class="row">
			<div class="col-lg-6">
			<div class="row">
			<div align="center" class="col-lg-12" style="font-size:12px;">Caja Actual= Ingresos(Generales + Cursos + Cooperadora)-Egresos</div>
			</div>
            <div align="center" class="col-lg-12">
            <button class="btn-sm btn-default" onclick="hacerCaja()">Hacer caja</button>
            </div>
            <div align="center" class="col-lg-12 cajaClass">
            <label id="cajaValor">El valor sera indicado aquí</label>
            </div>
            </div>
           </div>
            
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
          <h4 class="modal-title">Alta Ingresos</h4>
        </div>
        <div class="modal-body">
		   
            <div class="form-group">
           <label id="lbltipo" class="col-sm-2 control-label col-lg-2" for="inputNombre">Tipo Ingreso</label>
                                          <div class="col-lg-10">
                                            <select id="tipoSelect" class="form-control m-b-10"  data-bind="options: tipos, 
                        					value: selectedTipoI,
                       						optionsText: 'tipo_codigo', 
                       optionsCaption: 'Seleccione un tipo...'"></select> 
                                          </div>
                                      </div>
          <div style="margin-top:15px">
          <div class="form-group">
          <label class="col-sm-2 control-label col-lg-2" for="txtCantidad">Monto</label>
          <div class="col-lg-10">
          <div class="input-group">
  		  <span class="input-group-addon">$</span>
 		   <input type="number" id="txtMontoI" class="form-control" aria-label="monto">
  		   
		</div>
		</div>
		</div>
		</div>
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Observaciones</label>
           <div class="col-lg-10">
           <input type="text" name="txtApellido" class="form-control" id="txtObservacionesI"/>
            </div>
           </div>
	
        </div>
       <div class="modal-footer">
         
          <button id ="btnEditar" type="button" onclick=" return altaIngreso();" class="btn btn-primary" data-dismiss="modal" >Agregar</button>
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
          <h4 class="modal-title">Alta Egresos</h4>
        </div>
        <div class="modal-body">
		   
            <div class="form-group">
           <label id="lbltipo" class="col-sm-2 control-label col-lg-2" for="inputNombre">Tipo Egreso</label>
                                          <div class="col-lg-10">
                                            <select id="tipoSelect" class="form-control m-b-10"  data-bind="options: tipos, 
                        					value: selectedTipoE,
                       						optionsText: 'tipo_codigo', 
                       optionsCaption: 'Seleccione un tipo...'"></select> 
                                          </div>
                                      </div>
           <!--   <div class="form-group">
            <label class="col-sm-2 control-label col-lg-2" for="txtCantidad">Monto</label>
            <div class="col-lg-10">
            <input type="text" name="txtNombre" class="form-control" id="txtMontoE"/>
            </div>
          </div>-->
          <div class="form-group">
          <label class="col-sm-2 control-label col-lg-2" for="txtCantidad">Monto</label>
          <div class="col-lg-10">
          <div class="input-group">
  		  <span class="input-group-addon">$</span>
 		   <input type="number" id="txtMontoE" class="form-control" aria-label="monto">
  		   
		</div>
		</div>
		</div>
		  <div class="form-group">
           <label class="col-sm-2 control-label col-lg-2" for="txtObservaciones">Observaciones</label>
           <div class="col-lg-10">
           <input type="text" name="txtApellido" class="form-control" id="txtObservacionesE"/>
            </div>
           </div>
	
        </div>
       <div class="modal-footer">
         
          <button id ="btnEgreso" type="button" onclick=" return altaEgreso();" class="btn btn-primary" >Agregar</button>
        </div>
       
      </div>
    </div>
  </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script src="js/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/html" id="fieldTemplate">
<tr>
<td class="col-md-3" data-bind="text: fecha_ingreso"></td>
<td class="col-md-4" data-bind="text: cantidad"></td>
<td class="col-md-5" data-bind="text: tipo_ingreso" class="td-success"></td>
</tr>
</script>
<script type="text/html" id="fieldTemplate2">
<tr>
	 <td class="col-md-3" data-bind="text: fecha_egreso"></td>
	<td class="col-md-4" data-bind="text: cantidad"></td>
	<td class="col-md-5" data-bind="text: tipo_egreso" class="td-danger"></td>
</tr>
</script>   
<script>


$( document ).ready(function() {
	   
	 
			viewModel=
		    {	
		    	ingresos: ko.observableArray([]),
		    	egresos: ko.observableArray([]),
		    	tipos: ko.observableArray([]),
		    	selectedTipoI:ko.observable(),
		    	selectedTipoE:ko.observable(),
		    	meses:ko.observableArray([]),
		    	mesesE:ko.observableArray([]),
		    	//paginacion para ingresos
		    	pageSize: ko.observable(4),
		        pageIndex: ko.observable(0),
		        previousPage: function() {
		            this.pageIndex(this.pageIndex() - 1);
		        },
		        nextPage: function() {
		            this.pageIndex(this.pageIndex() + 1);
		        },
		      //paginacion para ingresos
		    	pageSize2: ko.observable(4),
		        pageIndex2: ko.observable(0),
		        previousPage2: function() {
		            this.pageIndex2(this.pageIndex2() - 1);
		        },
		        nextPage2: function() {
		            this.pageIndex2(this.pageIndex2() + 1);
		        }
		    	
		    };
			//cantidad de paginas 
			viewModel.maxPageIndex = ko.dependentObservable(function() {
		        return Math.ceil(this.ingresos().length / this.pageSize()) - 1;
		    }, viewModel);
		    
		    //la cantidad de paginas a mostrar en el momento
		    viewModel.pagedRows = ko.dependentObservable(function() {
		        var size = this.pageSize();
		        var start = this.pageIndex() * size;
		        return this.ingresos.slice(start, start + size);
		    }, viewModel);
		    
		  //cantidad de paginas 
			viewModel.maxPageIndex2 = ko.dependentObservable(function() {
		        return Math.ceil(this.egresos().length / this.pageSize2()) - 1;
		    }, viewModel);
		    
		    //la cantidad de paginas a mostrar en el momento
		    viewModel.pagedRows2 = ko.dependentObservable(function() {
		        var size = this.pageSize2();
		        var start = this.pageIndex2() * size;
		        return this.egresos.slice(start, start + size);
		    }, viewModel);
		    
			ko.applyBindings(viewModel);
			//llamada ajax que devuelve el examen y carga el modelo con knockout
			 var ruta= "ServletBuscarIyE";
				$.ajax({
						async: false,
						url: ruta,
						type: "POST",
						dataType: "json",
						success: function(datos)
						{ 
							if(datos.respInfo=="OK")
								{
								viewModel.ingresos(datos.ingresos);
								viewModel.egresos(datos.egresos);
								sumaIngresos();
								graficar();
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
function sumaIngresos(){

	var meses2= [0,0,0,0,0,0,0,0,0,0,0,0];
	var mesesEg= [0,0,0,0,0,0,0,0,0,0,0,0];
	
	for(i=0; i< viewModel.ingresos().length;++i){
		var mes= viewModel.ingresos()[i].fecha_ingreso;
		var mesReal= mes.substring(5,7);
		var mesA= parseInt(mesReal)-1;
		var cantidad=viewModel.ingresos()[i].cantidad;
		meses2[mesA]+=cantidad;
	}
	viewModel.meses(meses2);
	for(i=0; i< viewModel.egresos().length;++i){
		var mes= viewModel.egresos()[i].fecha_egreso;
		var mesReal= mes.substring(5,7);
		var mesA= parseInt(mesReal)-1;
		var cantidad=viewModel.egresos()[i].cantidad;
		mesesEg[mesA]+=cantidad;
	}
	viewModel.mesesE(mesesEg);
}
function graficar(){
  $('#container').highcharts({

	        xAxis: {
	            categories: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
	        },
	        
			title: {
	                text: 'Ingresos y egresos en el último año'
	            },

	        series: [{
	            data: viewModel.meses(),
	            name: 'Ingresos'
	        },{ data: viewModel.mesesE(),
	           name: 'Egresos',
	           color: '#cc0000'}
	        ]
	        });

}
function setModalIngresos()
{
	 var ruta= "ServletBuscarTiposIngreso";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				success: function(datos)
				{ 
					if(datos.respInfo=="OK")
						{
						viewModel.tipos(datos.tipos);
						
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

}
function setModalEgresos()
{
	 var ruta= "ServletBuscarTiposEgreso";
		$.ajax({
				async: false,
				url: ruta,
				type: "POST",
				dataType: "json",
				success: function(datos)
				{ 
					if(datos.respInfo=="OK")
						{
						viewModel.tipos(datos.tipos);
						
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
}
function altaIngreso(){
	var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!

    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 
    var canti=parseInt($('#txtMontoI').val()); 
    var today = yyyy+'-'+mm+'-'+dd;
	var ingreso={tipo_ingreso: viewModel.selectedTipoI().tipo_codigo,cod_tipo_ingreso:viewModel.selectedTipoI().codigo,
			cantidad: canti,observaciones:$('#txtObservacionesI').val(),fecha_ingreso:today};
	if(viewModel.selectedTipoI=="undefined" && $('#txtMontoI').val()!="" && $('#txtObservacionesI').val() !="" )
		{
	var ruta= "ServletAgregarIngreso";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data: "ingreso="+JSON.stringify(ingreso),
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert("Ingreso correcto");
					viewModel.ingresos.push(ingreso);
					sumaIngresos();
					graficar();
					//limpiar
					$('#txtMontoI').val('');
					$('#txtObservacionesI').val('');
					viewModel.selectedTipoI('');

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
	window.location.href='caja.jsp';
		}else{alert("Complete todos los campos");
		return false;}
}
function altaEgreso(){
	var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!

    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 
    var today = yyyy+'-'+mm+'-'+dd;
    var canti=parseInt($('#txtMontoE').val()); 
	var egreso={tipo_egreso: viewModel.selectedTipoE().tipo_codigo,cod_tipo_egreso:viewModel.selectedTipoE().codigo,
			cantidad: canti,observaciones:$('#txtObservacionesE').val(),fecha_egreso:today};
	var ruta= "ServletAgregarEgreso";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			data: "egreso="+JSON.stringify(egreso),
			success: function(datos)
			{ 
				if(datos.respInfo=="OK")
					{
					alert("Egreso correcto");
					viewModel.egresos.push(egreso);
					sumaIngresos();
					graficar();
					//limpiar
					$('#txtMontoE').val('');
					$('#txtObservacionesE').val('');
					viewModel.selectedTipoE('');
					
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
 window.location.href='caja.jsp';
}
function hacerCaja(){
	//recorro ya qu tengo el viewModel ingersos y egresos
	var suma=0;
	var resta=0;
	var cant= viewModel.ingresos().length;
	for(i=0; i<cant;++i){
		suma+= viewModel.ingresos()[i].cantidad;
	}
	var cante= viewModel.egresos().length;
	for(j=0; j< cante ;++j){
		resta+= viewModel.egresos()[j].cantidad;
	}
	var total=suma-resta;
	$('#cajaValor').text('Caja actual= $'+ total +'= Ingresos('+ suma +' ) - Egresos('+ resta +' )');
}
</script>
	<script src="js/tableFilter.js"></script>

</body>

</html>
