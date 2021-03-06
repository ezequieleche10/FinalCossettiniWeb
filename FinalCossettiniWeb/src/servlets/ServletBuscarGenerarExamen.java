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
import Entidades.Examen;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletBuscarGenerarExamen
 */
@WebServlet("/ServletBuscarGenerarExamen")
public class ServletBuscarGenerarExamen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBuscarGenerarExamen() {
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
		int anoIngresado = gson.fromJson(request.getParameter("mydata"),Integer.class);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		JsonElement resp =null;
		try{
			//write some code
			Examen ex= new Examen();
			ArrayList<Alumno> alumnosE;
			ex= cont.mostrarExamenPendiente(anoIngresado);
			myObj.add("examen", gson.toJsonTree(ex));
			myObj.addProperty("success", true);
		    resp = gson.toJsonTree("OK");
			if(ex!=null)
			{
				if(ex.getEstado().equals("alumnos cargados"))
				{
				alumnosE= new ArrayList<Alumno>();
				alumnosE= cont.getAlumnosenExamen(ex.getCod_examen());
				myObj.add("alumnos", gson.toJsonTree(alumnosE));
				}else
				{
				resp=gson.toJsonTree("Examen con estado incorrecto, dir�jase a ayuda");
				}
			}else
			{resp=gson.toJsonTree("Examen no encontrado");
				
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
