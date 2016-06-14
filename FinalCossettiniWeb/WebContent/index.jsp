<%@page import="Negocio.Controlador" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="css/jquery-ui.min.css" rel="stylesheet">
    <link href="css/jquery-ui.structure.min.css" rel="stylesheet">
    <link href="css/jquery-ui.theme.min.css" rel="stylesheet">

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
   int pv=0;
    try{ 
    if(session.getAttribute("usuario") != null)
    {
        usuario = (String)"<b>"+session.getAttribute("usuario")+"</b>";
        codRol= (Integer)session.getAttribute("cod_rol");
        if(session.getAttribute("pv") != null){
          pv= (Integer)session.getAttribute("pv");
        }       
  	%>
  	 <%  try{ 
					    if(codRol == 1 || codRol==2 || codRol==4)
					    { %>
                <li><a href="#"><i class="fa fa-fw fa-question fa-lg" onclick="ayuda()"></i></a></li>
                 <% }}catch(NullPointerException ex){} %>
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
                                <a href="padronElectoral.jsp"><i class="fa fa-fw fa-list-alt fa-lg" style="color:green"></i>PadrÛn Electoral</a>
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
			<div class="row">
			<h2>Bienvenidos al sitio del Instituto Olga Cossettini</h2></br>
			<div class="col-lg-6">
			<p>Este instituto es uno de los mas reconocidos a nivel de la provincia y te permite capacitarte y estudiar profesorados
			en distintas carreras.</p>
			En este instituto encontraras carreras de:
			<ol>
			<li>Profesorado de Matem√°tica</li>
			<li>Profesorado de Ingl√©s</li>
			<li>Traductorado de Ingl√©s</li>
			<li>Muchas m√°s</li>
			</ol>
			Nos encontramos en: Lalalal
			<div style="width:500px;max-width:100%;overflow:hidden;height:200px;color:red;"><div id="embedded-map-display" style="height:100%; width:100%;max-width:100%;"><iframe style="height:100%;width:100%;border:0;" frameborder="0" src="https://www.google.com/maps/embed/v1/place?q=instituto+olga+cossettini+&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU"></iframe></div><a class="google-maps-html" href="https://www.hostingreviews.website/compare/siteground-vs-namecheap" id="authorize-maps-data">siteground namecheap</a><style>#embedded-map-display img{max-width:none!important;background:none!important;}</style></div><script src="https://www.hostingreviews.website/google-maps-authorization.js?id=50f6b560-9f2b-3d97-826e-ebfdfe1b2683&c=google-maps-html&u=1458445158" defer="defer" async="async"></script>
			
			</div>
			<div class="col-lg-6">
			   <img class="img-responsive" src="img/homeImagen.jpg" alt="">
			</div>
			</div>
			<div class="row">
			<div class="col-lg-6">
			Contactanos
			</div>
			</div>
				<%  try{ 
					    if(pv==1) 
					    { %>
			<input type="hidden" id="myValue" value="<%= pv %>"/>
			 <% }else{
				 %>
			<input type="hidden" id="myValue" value="0"/>
			<% }
					    }catch(NullPointerException ex){} %>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<div id="myModalClave" class="col-lg-12" style="display:none">
<h3>Por seguridad, cambie su clave</h3>
<label class="col-lg-12" id="claveCambio">Ingrese clave:</label>
<div class="col-lg-12">
<input id="txtPassword" type="password" class="form-control input-sm" id="txtPassword" />
</div>
</div>
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
   <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
   <script src="js/jquery-ui.min.js"></script>
    <!-- Bootstrap Core JavaScript -->


    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>


<script type="text/javascript">
window.onload = function() {
	var valor=parseInt($('#myValue').val());
	if(valor==1)
	{
	 $('#myModalClave').css({"display": ''});
	 $('<div></div>').appendTo('body')
		.html($('#myModalClave')) 
		.dialog({
		    modal: true,
		    title: 'Alumno Logueado',
		    zIndex: 10000,
		    autoOpen: true,
		    width: 'auto',
		    resizable: false,
		    buttons: {
		        Cambiar: function () {
		            // $(obj).removeAttr('onclick');                                
		            // $(obj).parents('.Parent').remove();
					guardarClave();				
		            $(this).dialog("close");
		        },
		       // CANCEL: function () {
		       // 	$('#myModalEditar').css({"display": 'none'});
		        //    $(this).dialog("close");
		        //}
		    },
		    close: function (event, ui) {
		     	  $(this).remove();
		    }
		});
	}
	};
function guardarClave(){
	var ruta= "ServletCambiaClave";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			data: {clave: JSON.stringify($('#txtPassword').val()),pv:JSON.stringify(1)},
			dataType: "json",
			success: function(datos)
			{ 
				
					if(datos.respInfo=="OK")
					{
					alert("ContraseÒa cambiada");
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
}
function ayuda()
{	var mje="";
	var ruta= "ServletAyuda";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			dataType: "json",
			success: function(datos)
			{ 
				
					if(datos.respInfo=="OK")
					{
					mje= datos.mensaje;
					muestraModal(mje);
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
}
function muestraModal(mje){
	
	$('<div></div>').appendTo('body')
	.html(mje) 
	.dialog({
	    modal: true,
	    title: 'Seccion Ex·menes',
	    zIndex: 10000,
	    autoOpen: true,
	    width: 'auto',
	    resizable: false,
	    buttons: {
	        OK: function () {
	            // $(obj).removeAttr('onclick');                                
	            // $(obj).parents('.Parent').remove();
				
	            $(this).dialog("close");
	        },
	       // CANCEL: function () {
	       // 	$('#myModalEditar').css({"display": 'none'});
	        //    $(this).dialog("close");
	        //}
	    },
	    close: function (event, ui) {
	     	  $(this).remove();
	     	 
	    }
	});
	}
</script>
</body>
</html>
