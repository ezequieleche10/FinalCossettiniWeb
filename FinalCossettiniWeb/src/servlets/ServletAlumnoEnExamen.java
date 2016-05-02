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

import Entidades.NotaExamenAlumno;
import Entidades.Usuario;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletAlumnoEnExamen
 */
@WebServlet("/ServletAlumnoEnExamen")
public class ServletAlumnoEnExamen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAlumnoEnExamen() {
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
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		JsonElement resp =null;
		try{
			//write some code
			
			myObj.addProperty("success", true);
		    resp = gson.toJsonTree("OK");
		    Usuario u = cont.getUsuario(usu);
		    ArrayList<NotaExamenAlumno> nea = new ArrayList<NotaExamenAlumno>();
		    nea = cont.getNotasAlumno(u);
		   	myObj.add("notas", gson.toJsonTree(nea));
		    
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
