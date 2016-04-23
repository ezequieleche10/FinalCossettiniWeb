<%@page import="Negocio.Controlador"%>
<%
Controlador cont = (Controlador)session.getAttribute("controlador");
if(cont.existe(request.getParameter("inputUsername")))

	out.println(1);
else
	out.println(0);

%>