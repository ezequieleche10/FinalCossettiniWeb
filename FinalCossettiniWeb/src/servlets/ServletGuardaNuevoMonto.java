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

import Entidades.Cambio;
import Entidades.Usuario;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletGuardaNuevoMonto
 */
@WebServlet("/ServletGuardaNuevoMonto")
public class ServletGuardaNuevoMonto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletGuardaNuevoMonto() {
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
		String usu= (String)Session.getAttribute("usuario");
		Gson gson = new Gson();
		Double valorMinimo= gson.fromJson(request.getParameter("valorMinimo"), Double.class);
		String pass= gson.fromJson(request.getParameter("password"), String.class);
		int cod_padron= gson.fromJson(request.getParameter("cod_padron"), Integer.class);
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		JsonElement resp =null;
		try{
			//write some code
			
			myObj.addProperty("success", true);
		    resp = gson.toJsonTree("OK");
		    //valido pass here 
		    Usuario u = cont.getUsuario(usu);
		    if(u.getClave().equals(pass))
		    {
		    Cambio c = new Cambio();
		    c.setCod_padron(cod_padron);
		    c.setValorMinimo(valorMinimo);
		    cont.actualizarValorMinimo(c,u);
		    myObj.add("passValida",gson.toJsonTree("OK"));
			myObj.add("sociosHabilitados", gson.toJsonTree(cont.listarSociosHab(cod_padron,valorMinimo)));
		    }else {
		    	myObj.add("passValida",gson.toJsonTree(""));
		    }
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
