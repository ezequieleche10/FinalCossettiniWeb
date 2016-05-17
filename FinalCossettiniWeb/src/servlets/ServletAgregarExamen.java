package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

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
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		JsonObject myObj = new JsonObject();
		
		String mje="";
		PrintWriter out = response.getWriter();
		try{
			//redirect to specific page
			//validar si el examen es creado o no
			int valor = cont.buscarExamenesPendientes(tipo_examen, año);
			switch(valor){
			case 0:
				cont.agregarExamen(tipo_examen, año, descripcion);
				myObj.addProperty("success", true);
				myObj.add("mensaje", gson.toJsonTree(""));
				break;
			case 1:
				mje= "Ya existe un examen con dichos datos";
				myObj.addProperty("success", true);
				myObj.add("mensaje", gson.toJsonTree(mje));
				break;
			case 2:
				mje= "No existe el examen anterior creado";
				myObj.addProperty("success", true);
				myObj.add("mensaje", gson.toJsonTree(mje));
			case 3:
				mje= "El examen anterior no esta cerrado";
				myObj.addProperty("success", true);
				myObj.add("mensaje", gson.toJsonTree(mje));
			default:
				myObj.addProperty("success", false);
				break;
			}
		    	
				myObj.add("resp", gson.toJsonTree("OK"));
		    	out.println(myObj.toString());
		    	out.close();
			}
		catch(Exception e){
		   myObj.add("resp", gson.toJsonTree(""));
		   out.println(myObj.toString());
		   out.close();
		    }
						
		}
		
			
			
	}

