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
 * Servlet implementation class ServletAgregarExamen
 */
@WebServlet("/ServletAgregarExamen")
public class ServletAgregarExamen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAgregarExamen() {
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
		
		HttpSession session= request.getSession(true);
		Controlador cont=(Controlador)session.getAttribute("controlador");	    
		String tipo_examen =request.getParameter("tipo_examen");
		int año =Integer.parseInt(request.getParameter("spAno"));
		String descripcion =request.getParameter("areaDesc");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			//redirect to specific page
		    	cont.agregarExamen(tipo_examen, año, descripcion);
		    	out.print("OK");
			
			}
		catch(Exception e){
		   out.print("");
		    }
						
		}
		
			
			
	}

