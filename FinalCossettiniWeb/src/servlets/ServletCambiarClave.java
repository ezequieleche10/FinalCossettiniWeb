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
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import Entidades.Usuario;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletCambiarClave
 */
@WebServlet("/ServletCambiarClave")
public class ServletCambiarClave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCambiarClave() {
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
		String pass= gson.fromJson(request.getParameter("clave"), String.class);
		String usu= gson.fromJson(request.getParameter("usu"), String.class);
		int pv= gson.fromJson(request.getParameter("pv"), Integer.class);
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		JsonElement resp =null;
		try{
			//write some code
			
			
		    //valido pass here 
		    Usuario u = cont.getUsuario(usu);
		    cont.cambiaClave(u,pass,pv);
		    Session.setAttribute("pv",0);
		    myObj.addProperty("success", true);
		    resp = gson.toJsonTree("OK");
		    
		}
		catch(Exception e)
		{
			//write some code		} 
			//myObj.addProperty("success", false);
			resp = gson.toJsonTree("");
			
		}finally
		{
			myObj.add("respInfo", resp);
			out.println(myObj.toString());
			out.close();
		}
	}

}
