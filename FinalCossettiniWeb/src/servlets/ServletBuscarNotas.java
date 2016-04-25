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

import Entidades.AlumnoEnEjercicio;
import Entidades.Examen;
import Entidades.NotaExamenAlumno;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletBuscarNotas
 */
@WebServlet("/ServletBuscarNotas")
public class ServletBuscarNotas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBuscarNotas() {
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
		String tipoExamen=gson.fromJson(request.getParameter("tipoExamen"), String.class);
		int anio= gson.fromJson(request.getParameter("anio"), Integer.class);
				
		//preparo la respuesta
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try{
			
			Examen exa= new Examen();
			exa=cont.buscarExamen(tipoExamen, anio);
			myObj.addProperty("success", true);
			myObj.add("examen", gson.toJsonTree(exa));
			exa.setListaNotaExamenAlumno(cont.getNotasExamen(exa.getCod_examen()));
			ArrayList<NotaExamenAlumno> notas = new ArrayList<NotaExamenAlumno>();
			notas= exa.getListaNotaExamenAlumno();
			int suma=0;
			int cant=notas.size();
			for(int i=0;i< cant; ++i)
			{
			 if(notas.get(i).getNota()>=6){
				 suma=suma+1;
				 }
			}
			myObj.add("notaExams", gson.toJsonTree(notas));
			myObj.add("suma", gson.toJsonTree(suma));
			myObj.add("cant", gson.toJsonTree(cant));
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
