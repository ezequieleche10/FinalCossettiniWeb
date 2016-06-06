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

import Entidades.Alumno;
import Entidades.AlumnoEnCurso;
import Entidades.Curso;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletBuscarAlumnosCurso
 */
@WebServlet("/ServletBuscarAlumnosCurso")
public class ServletBuscarAlumnosCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBuscarAlumnosCurso() {
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
		Curso curso = gson.fromJson(request.getParameter("curso"), Curso.class);
		JsonObject myObj = new JsonObject();
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try{
			String resp="OK";
			myObj.addProperty("success", true);
			myObj.add("respInfo", gson.toJsonTree(resp));
			ArrayList<Alumno> alums= new ArrayList<Alumno>();
			ArrayList<AlumnoEnCurso> alumnosCurso= new ArrayList<AlumnoEnCurso>();
			alums=cont.getAlumnos();
			alumnosCurso=cont.alumnosEnCurso(curso);
			for(int i=0;i<alumnosCurso.size();++i)
			{
			for(int j=0;j<alums.size();++j)
				{
				if(alumnosCurso.get(i).getDni() == alums.get(j).getDni()){
					alums.remove(j);
				}
				}
			}
			myObj.add("alumnos", gson.toJsonTree(alums));
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
