package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Entidades.Usuario;
import Negocio.Controlador;

/**
 * Servlet implementation class ServletNuevoUsuario
 */
@WebServlet("/ServletNuevoUsuario")
public class ServletNuevoUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNuevoUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session= request.getSession(true);
		Controlador cont = (Controlador)session.getAttribute("controlador");

	    
		String vUsername =request.getParameter("inputUsername");
	    
		String vPassword =request.getParameter("inputPassword");
		
		String vRePassword =request.getParameter("inputREPassword");
		
		String vNombre = request.getParameter("inputNombre");
		
	
		try{
			Usuario User = new Usuario();
			User.setNombre_usuario(vUsername);
		
			session.setAttribute("usuario", vUsername);
			request.getRequestDispatcher("inicio.jsp").forward(request, response);
		
		}catch(Exception e){
	    
		   session.setAttribute("error", e);
		   request.getRequestDispatcher("/SingUp.jsp").forward(request, response);
		 
		    
	    }
						
		}
		
		
	}


