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

import Entidades.Alumno;
import Entidades.Ejercicio;
import Entidades.Examen;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletCargaModo
 */
@WebServlet("/ServletCargaModo")
public class ServletCargaModo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCargaModo() {
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
		JsonObject myObj = new JsonObject();
		int modo = gson.fromJson(request.getParameter("mydata"),Integer.class);
		int codigo = gson.fromJson(request.getParameter("codigo"),Integer.class);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		JsonElement resp =null;
		try{
			if(modo==1){
				ArrayList<Alumno> alums= new ArrayList<Alumno>();
				 alums= cont.getAlumnosenExamen(codigo);
				 myObj.addProperty("success", true);
				myObj.add("alumnos", gson.toJsonTree(alums));
			}
			if(modo==2){
				ArrayList<Ejercicio> ejs= new ArrayList<Ejercicio>();
			   	ejs= cont.getAllEjercicios(codigo);
			   	myObj.addProperty("success", true);
				myObj.add("ejercicios", gson.toJsonTree(ejs));
			}
			if(modo==0){
				myObj.addProperty("success", false);
			}
		}
		catch(Exception e)
		{
			myObj.addProperty("success", false);
			
		}finally
		{
			out.println(myObj.toString());
			out.close();
		}
	}

}
