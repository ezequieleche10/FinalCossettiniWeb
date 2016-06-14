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

import Entidades.Cargo;
import Entidades.Profesor;
import Entidades.Socio;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletAgregarSocio
 */
@WebServlet("/ServletAgregarSocio")
public class ServletAgregarSocio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAgregarSocio() {
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
		Socio socio= gson.fromJson(request.getParameter("socio"), Socio.class);
		ArrayList<Cargo> cargos = gson.fromJson(request.getParameter("cargos"), new TypeToken<ArrayList<Cargo>>() { }.getType());
		//preparo la respuesta
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try{
			int i= cont.buscarSocio(socio);
			if(i==0)
			{
			cont.agregarSocio(socio, cargos);
			myObj.addProperty("success", true);
			myObj.add("respInfo", gson.toJsonTree("OK"));
			out.println(myObj.toString());
			}else
			{
				myObj.addProperty("success", true);
				myObj.add("respInfo", gson.toJsonTree("El dni ya existe"));
				out.println(myObj.toString());	
			}	

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
