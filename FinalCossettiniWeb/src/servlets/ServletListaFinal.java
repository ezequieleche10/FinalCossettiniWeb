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
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import Entidades.Alumno;
import Entidades.Examen;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletListaFinal
 */
@WebServlet("/ServletListaFinal")
public class ServletListaFinal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletListaFinal() {
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
		// TODO Auto-generated method stub
		HttpSession Session=request.getSession();
		Controlador cont= (Controlador)Session.getAttribute("controlador");
		Gson gson = new Gson();
		JsonObject myObj = new JsonObject();
		int anio= gson.fromJson(request.getParameter("mydata"), Integer.class);
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try{
			//write some code
			ArrayList<Alumno> alumnos= new ArrayList<Alumno>();
			alumnos = cont.buscarListaFinal(anio);
			String resp="OK";
			myObj.addProperty("success", true);
			myObj.add("respInfo", gson.toJsonTree(resp));
			myObj.add("alumnos", gson.toJsonTree(alumnos));

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
