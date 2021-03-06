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

import Entidades.Comision;
import Entidades.Ejercicio;
import Entidades.Examen;
import Entidades.Profesor;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletCargarNotaxEj
 */
@WebServlet("/ServletCargarNotaxEj")
public class ServletCargarNotaxEj extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCargarNotaxEj() {
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
		//recupero el json y lo convierto a entidades
		Ejercicio ejer=gson.fromJson(request.getParameter("ejercicio"), Ejercicio.class);
		
		
		//preparo la respuesta
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try{
			
			cont.cargarNotas(ejer);
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
