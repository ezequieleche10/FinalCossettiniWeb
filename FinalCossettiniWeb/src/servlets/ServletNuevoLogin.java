package servlets;

import java.awt.Window;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JPanel;
import javax.swing.JViewport;
import Negocio.Controlador;
import Entidades.Usuario;

/**
 * Servlet implementation class ServletNuevoLogin
 */
@WebServlet("/ServletNuevoLogin")
public class ServletNuevoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNuevoLogin() {
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
		
		Controlador cont = new Controlador();
		Usuario vUsuario;
		
		HttpSession session= request.getSession(true);
			    
		String vUsername =request.getParameter("inputUsername");
	    
		String vPassword =request.getParameter("inputPassword");
		
		try{
			if(cont.validarUsuario(vUsername, vPassword)== true)
			{
				
				Cookie cookieUsuario = new Cookie("cookieUsuario", vUsername);
	            cookieUsuario.setPath("/");
	            cookieUsuario.setMaxAge(60*60*24*31);
	            response.addCookie(cookieUsuario);
	            vUsuario = cont.getUsuario(vUsername);
	            if(vUsuario.getTipo_Usuario()==3 && vUsuario.getPv()==0 )
	            {
	            session.setAttribute("pv",1);	
	            }
	            else
	            {
	            session.setAttribute("pv",0);	
	            }
	            if(vUsuario.getTipo_Usuario()==2 && vUsuario.getPv()==0){
	            session.setAttribute("pv",1);
	            }
	            
		    	session.setAttribute("usuario",vUsername);
		    	session.setAttribute("controlador",cont);
		    	session.setAttribute("cod_rol", vUsuario.getTipo_Usuario());
		    	session.setAttribute("pass", vPassword);
		    	request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			else
	    	{
				
	    		throw new Exception("Ingreso incorrecto");
	    	}
	  	
	    }catch(Exception e){
	    
		   session.setAttribute("error", e);
		   request.getRequestDispatcher("/nuevologin.jsp").forward(request, response);
		 
		    
	    }
						
		}
		
			
			
	}



