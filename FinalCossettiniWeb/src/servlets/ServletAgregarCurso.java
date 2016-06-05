package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Negocio.Controlador;

/**
 * Servlet implementation class ServletAgregarCurso
 */
@WebServlet("/ServletAgregarCurso")
public class ServletAgregarCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletAgregarCurso() {
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
		
		HttpSession session= request.getSession(true);
		Controlador cont=(Controlador)session.getAttribute("controlador");	    
		String nombre = request.getParameter("nombre");
		int año = Integer.parseInt(request.getParameter("anio"));
		int cupo = Integer.parseInt(request.getParameter("cupo"));
		int precio = Integer.parseInt(request.getParameter("precio"));
		String desc = request.getParameter("desc");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			//redirect to specific page
		    	cont.agregarCurso(nombre, año, precio, cupo, desc);
		    	out.print("OK");
			
			}
		catch(Exception e){
		   out.print("");
		    }
						
		}

}
