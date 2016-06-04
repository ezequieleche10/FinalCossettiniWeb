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

import Entidades.Profesor;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletAgregarU
 */
@WebServlet("/ServletAgregarU")
public class ServletAgregarU extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAgregarU() {
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
		int ind= gson.fromJson(request.getParameter("ind"), Integer.class);
		String nombre= gson.fromJson(request.getParameter("nombre"), String.class);
		String apellido=gson.fromJson(request.getParameter("apellido"), String.class);
		int dni= gson.fromJson(request.getParameter("dni"), Integer.class);
		String clave=gson.fromJson(request.getParameter("clave"), String.class);
		//preparo la respuesta
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try{
			
			cont.agregarResponsable(ind,nombre,apellido,dni,clave);
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
