/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;
import Datos.CatalogoNotasExamen;
import Datos.CatalogodeAlumnos;
import Datos.CatalogodeComisiones;
import Datos.CatalogodeEjercicios;
import Datos.CatalogodeProfesores;
import Datos.CatalogodeUsuarios;
import Entidades.Alumno;
import Entidades.AlumnoEnEjercicio;
import Entidades.Carrera;
import Entidades.Comision;
import Entidades.Ejercicio;
import Entidades.Examen;
import Entidades.NotaExamenAlumno;
import Entidades.Profesor;
import Entidades.Usuario;
import Negocio.Controlador;
//import Negocio.String;
//IGNORE NEGOCIO.String
import Datos.CatalogodeCarreras;
import Datos.CatalogodeExamenes;

import java.awt.Component;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.JOptionPane;

/**
 *
 * @author Lucia
 */
public class Controlador {
    
    private CatalogodeExamenes cde;
    private CatalogodeCarreras cdc;
    private CatalogodeAlumnos cda;
    private CatalogodeProfesores cdp;
    private CatalogodeComisiones cdco;
    private CatalogodeEjercicios cdej;
    private CatalogodeUsuarios cdeu;
    private CatalogoNotasExamen cne;
   
    public Controlador() {
        cde = new CatalogodeExamenes();
        cdc = new CatalogodeCarreras();
        cda = new CatalogodeAlumnos();
        cdp= new CatalogodeProfesores();
        cdco = new CatalogodeComisiones();
        cdej = new CatalogodeEjercicios();
        cdeu=new CatalogodeUsuarios();
        cne=new CatalogoNotasExamen();
       
        }
    
     public ArrayList<Carrera> buscarCarreras() throws Exception{
         return cdc.buscarCarreras();
     }
     
     public ArrayList<Profesor> buscarProfesores() throws Exception{
         return cdp.getAllProfesores();
     }
    
    
    public Examen mostrarExamenPendiente(int anio) {
    	
              try {
				return cde.listarExamen(anio);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
       
        
    }
    
    public int agregarAlumnos(ArrayList<Alumno> alumnos) throws Exception
    {
    	  return cda.agregarAlumnos(alumnos);
    }
    
    public ArrayList<Alumno> listarAlumnos(int cod_examen) throws Exception {
        ArrayList<Alumno> alumnos= new ArrayList<Alumno>();
        Examen ex = cde.buscaExamen(cod_examen);
        if (ex.getTipo_examen().equals("A"))
        {
           alumnos= cda.buscarAlumnos();
        }else 
        {
            Examen examenV= new Examen();
            if(ex.getTipo_examen().equals("B"))
            { 
                
              examenV= cde.buscarExamen("A",ex.getAnio());
              
            }else 
            {
              examenV= cde.buscarExamen("B",ex.getAnio());
            }
            //devuelve los alumnos que han aprobado el examen anterior
            alumnos = examenV.obtenerAlumnos();
           
           //agregar alumnos no lo hace todavia, cuando se procesa solamente
           // ex.agregarAlumnos(alumnos);
            
            
         }
        return alumnos;
        }
        
    
    
    public void confirmarExamen(int cod_examen) {
        
    }
    
    public void listarAlumnosEnCondiciones(int cod_examen) {
        
    }
    
    public Comision buscarExamen (int anio, int cod_carrera) throws Exception {
        
        Examen ex = new Examen();
        ex = cde.listarExamen(anio);
        //resolver tema nombre y descripcion
        Comision c = new Comision(0, "", "", ex);
        return c;
        
        
    }
    
    public void asignarProfesores (ArrayList<Profesor> profes, int cod_comision) throws Exception
    {
    
      cdp.agregaraComision(profes, cod_comision);
       
    }
    
    public int agregarComision (int cod_examen, String nombre, String descripcion)
    {	
    	return cdco.agregarComision(nombre, descripcion, cod_examen);
    }
        
    
    public void agregarEjercicios (ArrayList<Ejercicio> ejercicios, int cod_examen) throws Exception{
     
    	cdej.agregarEjercicios(ejercicios,cod_examen);
       
        
        
    }
    
    public void agregarAlumnosEnEjercicio (int cod_examen) {
    	ArrayList<Alumno> alums= new ArrayList<Alumno>();
    	ArrayList<Ejercicio> ejs= new ArrayList<Ejercicio>();
    	alums=cde.getAllAlumnos(cod_examen);
    	ejs=cdej.getAllEjercicios(cod_examen);
    	cdej.agregarAlumnos(cod_examen,alums,ejs);
        
    }
    
    public void buscarProfesor (int cod_profesor) {
    	
        
    }
    
    public void mostrarEjercicios (int cod_examen){
        
    }
   
    public void buscarAlumnosEnEjercicio (int cod_examen, int cod_ejercicio){
        
    }
    
    public void cargarNotas (Ejercicio e) {
    	
    	
    	e.calcularNotaParcial();
    	cdej.cargarNotas(e);
    	
    }
    
    public void agregarExamen (String tipo_examen, int año, String descripcion) throws Exception
    {
    	Examen ex= new Examen(tipo_examen,año,"sin generar",descripcion);
    	cde.agregarExamen(ex);
    }
    public void agregarProfesor(String nombre, String apellido, String fecha_Nacimiento, String usu, String password) throws Exception
    {
    	Profesor p= new Profesor(nombre,apellido,fecha_Nacimiento);
    	Usuario u = new Usuario (usu, password, 2);
    	p.setUsuario(u);
    	p.AgregarProfesor();
    }
    
    public void agregarAlumnosEnExamen (ArrayList<Alumno> alumnos, int cod_examen) throws Exception
    {
    	Examen ex = cde.buscaExamen(cod_examen);
    	ex.agregarAlumnos(alumnos);
    	cde.cambiarEstado(ex.getCod_examen(), "alumnos cargados");
    	
    }

	public ArrayList<Alumno> getAlumnosenExamen(int cod_examen) {
		
		return cde.getAllAlumnos(cod_examen);
		
	}
	
	public void cambiarEstadoExamen (int cod_examen, String estado) throws Exception
	{
		cde.cambiarEstado(cod_examen, estado);
	}

	public int[] validarComisionyEjercicio(int cod_examen) {
		int[] valores;
		valores= new int[2];
		valores[0]=cdco.buscarComision(cod_examen);
		valores[1]=cdej.buscarEjercicio(cod_examen);
		return valores;
	}
	public Usuario getUsuario(String pUsername)
	{
		try {
			return cdeu.getUsuario(pUsername);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public  boolean existe(String pUsername) throws Exception
	{
	  Usuario existUs = new Usuario();
	  existUs = cdeu.getUsuario(pUsername);
	 if(existUs.getNombre_usuario()== null)
	 
		 return false;
	 	 else
		 return true;
	}

	public boolean validarUsuario(String pUsername, String pPassword)
	{
		Usuario user = new Usuario();
		try {
			user = cdeu.getUsuario(pUsername);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String nombreUsuario = user.getNombre_usuario();
		String contrasena = user.getClave();
		if(nombreUsuario.equalsIgnoreCase(pUsername) && contrasena.equalsIgnoreCase(pPassword))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public ArrayList<Examen> buscarExamenes(int cod_profesor) throws Exception
	{
		return cde.buscarExamenes(cod_profesor);
	}

	public ArrayList<Ejercicio> getAllEjercicios(int cod) throws Exception {
		ArrayList<Ejercicio> ejercicios = new ArrayList<Ejercicio>();
		
		ejercicios = cde.getAllEjercicios(cod);
		for (int i =0; i<ejercicios.size();++i)
		{	
			ArrayList<AlumnoEnEjercicio> alumsEjer = new ArrayList<AlumnoEnEjercicio>();
			alumsEjer = cde.recuperarAlumnosEnEjercicio(ejercicios.get(i).getCod_ejercicio(), cod);
			ejercicios.get(i).setListaAlumnos(alumsEjer);
		
		}
		return ejercicios;
	}

	public ArrayList<AlumnoEnEjercicio> getAlumnosenEjercicio(int cod, Alumno al) {
		// TODO Auto-generated method stub
		return cdej.getAlumnosenEjercicio(cod, al);
	}

	public void agregarNotasEnEjercicios(ArrayList<AlumnoEnEjercicio> alen, int cod) throws Exception {
		float nota=0;
		
		for(int i=0;i<alen.size();++i){
			float num= alen.get(i).getResultado()* alen.get(i).getEjer().getPorcentaje();
			float den= alen.get(i).getEjer().getCant_items()*10;
			alen.get(i).setNota_parcial((num/den));
			nota+=num/den;
		}
		cdej.agregarNotasEnEjercicio(alen,nota,cod);
		
		
	}

	public ArrayList<NotaExamenAlumno> getNotasExamen(int cod_examen) {
		ArrayList<NotaExamenAlumno> nea= new ArrayList<NotaExamenAlumno>();
		try {
			nea=cne.listarNotaExamenAlumno(cod_examen);
			for(int i=0;i<nea.size();i++){
				nea.get(i).setNota(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(nea!=null){
			ArrayList<AlumnoEnEjercicio> alen= new ArrayList<AlumnoEnEjercicio>();
			alen=cdej.getAlumnosEnEjercicios(cod_examen);
			for(int i=0; i<nea.size();i++)
			{
				for(int j=0; j<alen.size();j++)
				{
					if(alen.get(j).getAlumno().getDni()==nea.get(i).getAlumno().getDni())
					{
					//	JOptionPane.showMessageDialog(null, nea.get(i).getNota() );
						//JOptionPane.showMessageDialog(null, alen.get(j).getNota_parcial());
						nea.get(i).setNota((nea.get(i).getNota() + alen.get(j).getNota_parcial()));
					}
				
				}
			}
			return nea;
		}
		else
		{
			return null;
		}
	}

	public Examen buscarExamen(String tipoEx, int anio) {
		
		try {
			return cde.buscarExamen(tipoEx, anio);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public void actualizarNotasExamen(Examen exa) {
		cde.actualizarNotas(exa);
	}

	public Comision buscarComision(int cod_examen) {
		return cde.buscarComision(cod_examen);
		
	}

	public int buscarExamenesPendientes(String tipoEx, int anio) throws Exception {
		Examen ex = cde.buscarExamen(tipoEx, anio);
		if (ex!=null)
		{
			return 1;
			
		}
		else
		{
			String tipoExaAnt = "";
			if(tipoEx.equals("A"))
			{
				return 0;
			}
			else
			{
				if(tipoEx.equals("C"))
				{
					tipoExaAnt = "B";
				}
				else if (tipoEx.equals("B"))
				{
					tipoExaAnt = "A";
				}
				ex = cde.buscarExamen(tipoExaAnt, anio);
				if (ex!=null)
				{
					return 0;
				}
				else
				{
					return 2;
				}
				
			}
		}
	}

	public ArrayList<Alumno> buscarListaFinal(int anio) {
		// TODO Auto-generated method stub
		//logic!!
		ArrayList<Alumno> alumnos= new ArrayList<Alumno>();
		Examen e= new Examen();
		Examen ex= new Examen();
		try {
			e= cde.buscarExamen("C", anio);
			if(e!=null){
			ArrayList<NotaExamenAlumno> notasEx = new ArrayList<NotaExamenAlumno>();
			notasEx= cne.listarNotaExamenAlumno(e.getCod_examen());
			for(int i=0;i<notasEx.size();++i){
			
				if(notasEx.get(i).getNota()>=6){
				alumnos.add(notasEx.get(i).getAlumno());
				}
			
			}
			}
			ex=cde.buscarExamen("B",anio);
			String s= "Profesorado de ingles";
			if(ex!=null){
				ArrayList<NotaExamenAlumno> notasExB = new ArrayList<NotaExamenAlumno>();
				notasExB= cne.listarNotaExamenAlumno(ex.getCod_examen());
				for(int i=0;i<notasExB.size();++i){
				if(notasExB.get(i).getAlumno().getNombre_Carrera().equals(s)){	
						if(notasExB.get(i).getNota()>=6){
							alumnos.add(notasExB.get(i).getAlumno());
						}
				}
				}
			}
		    ArrayList<Alumno> alums= new ArrayList<Alumno>();
		    alums=cda.buscarAlumnosID();
		    for (int j=0; j<alums.size();++j){
		    	alumnos.add(alums.get(j));
		    }
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return alumnos;
	}

	public Examen traerExamen(int codigo) {
		// TODO Auto-generated method stub
		try {
			return cde.buscaExamen(codigo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}


	
    
}
