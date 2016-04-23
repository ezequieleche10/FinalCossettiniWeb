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
import Negocio.Controlador;

/**
 * Servlet implementation class ServerGenerarLista
 */
@WebServlet("/ServerGenerarLista")
public class ServerGenerarLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerGenerarLista() {
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
		Controlador controlador= (Controlador)Session.getAttribute("controlador");
		Gson gson = new Gson();
		JsonObject myObj = new JsonObject();
		
		ArrayList<Alumno> alumnos = gson.fromJson(request.getParameter("mydata"), new TypeToken<ArrayList<Alumno>>() { }.getType());
		//Alumno[] alumnosT = gson.fromJson(request.getParameter("mydata"), Alumno[].class);
		//ArrayList<Alumno> alumnos= new ArrayList<Alumno>(Arrays.asList(alumnosT));
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try{
			//write some code
			
			controlador.agregarAlumnos(alumnos);
			String resp="OK";
			myObj.addProperty("success", true);
			JsonElement childObj = gson.toJsonTree(resp);
			myObj.add("respInfo", childObj);
			out.println(myObj.toString());
			out.close();
		}
		catch(Exception e)
		{
			//write some code		} 
			myObj.addProperty("success", false);
			out.close();
		}
	}
}
