package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import Entidades.Alumno;
import Entidades.AlumnoEnEjercicio;
import Entidades.Comision;
import Entidades.Ejercicio;
import Entidades.Examen;
import Entidades.Profesor;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletAlumnoEnEjercicio
 */
@WebServlet("/ServletAlumnoEnCurso")
public class ServletAlumnoEnCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAlumnoEnCurso() {
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
		
		Alumno alumno = gson.fromJson(request.getParameter("alumno"), Alumno.class);
		String observaciones = gson.fromJson(request.getParameter("observaciones"), String.class);		
		int codSeleccionado = gson.fromJson(request.getParameter("codSeleccionado"), int.class);
		
		//preparo la respuesta
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		JsonElement resp =null;
		
		PrintWriter out = response.getWriter();
		try{
			cont.agregarAlumnoCurso(codSeleccionado, alumno, observaciones);
	    	myObj.addProperty("success", true);
	    	resp = gson.toJsonTree("OK");

		}
		catch(Exception e)
		{

			resp = gson.toJsonTree("");
		}
		finally
		{
			myObj.add("respInfo", resp);
			out.println(myObj.toString());
			out.close();
		}

		
	}

}
