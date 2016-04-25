package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Entidades.Ejercicio;
import Entidades.Examen;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletCerrarNota
 */
@WebServlet("/ServletCerrarNota")
public class ServletCerrarNota extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCerrarNota() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession Session=request.getSession();
		Controlador cont= (Controlador)Session.getAttribute("controlador");
		Gson gson = new Gson();
		//recupero el json y lo convierto a entidades
		int codigo=gson.fromJson(request.getParameter("codigo"), Integer.class);
		
		
		//preparo la respuesta
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try{
			
			Examen exa= new Examen();
			
			exa=cont.traerExamen(codigo);
			exa.setListaNotaExamenAlumno(cont.getNotasExamen(exa.getCod_examen()));
			cont.actualizarNotasExamen(exa);
			myObj.addProperty("success", true);
			myObj.add("respInfo", gson.toJsonTree("OK"));
			out.println(myObj.toString());
			

		}
		catch(Exception e)
		{
			myObj.addProperty("success", false);
		}
		finally
		{
			out.close();
			
		}
	}

}
