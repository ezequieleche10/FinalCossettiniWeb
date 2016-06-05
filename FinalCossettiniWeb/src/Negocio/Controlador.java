/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;
import Datos.CatalogoNotasExamen;
import Datos.CatalogodeAlumnos;
import Datos.CatalogodeComisiones;
import Datos.CatalogodeEgresos;
import Datos.CatalogodeEjercicios;
import Datos.CatalogodeProfesores;
import Datos.CatalogodeSocios;
import Datos.CatalogodeUsuarios;
import Datos.CatalogodeCursos;
import Entidades.Alumno;
import Entidades.AlumnoEnCurso;
import Entidades.AlumnoEnEjercicio;
import Entidades.Cambio;
import Entidades.Responsable;
import Entidades.Cargo;
import Entidades.Carrera;
import Entidades.Comision;
import Entidades.Curso;
import Entidades.Ejercicio;
import Entidades.Examen;
import Entidades.Ingreso;
import Entidades.Egreso;
import Entidades.NotaExamenAlumno;
import Entidades.Padron;
import Entidades.Profesor;
import Entidades.Socio;
import Entidades.TipoIngresoEgreso;
import Entidades.Usuario;
import Negocio.Controlador;
//import Negocio.String;
//IGNORE NEGOCIO.String
import Datos.CatalogodeCarreras;
import Datos.CatalogodeExamenes;
import Datos.CatalogodeIngresos;
import Datos.CatalogodePadron;

import java.awt.Component;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
    private CatalogodeSocios cdeso;
    private CatalogodeCursos cdcu;
    public Controlador() {
        cde = new CatalogodeExamenes();
        cdc = new CatalogodeCarreras();
        cda = new CatalogodeAlumnos();
        cdp= new CatalogodeProfesores();
        cdco = new CatalogodeComisiones();
        cdej = new CatalogodeEjercicios();
        cdeu=new CatalogodeUsuarios();
        cne=new CatalogoNotasExamen();
        cdeso= new CatalogodeSocios();
        cdcu= new CatalogodeCursos();
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
					if(ex.getEstado().equals("cerrado")){
					return 0;
					}else{
					return 3;
					}
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
	public void agregarSocio(Socio s, ArrayList<Cargo> cargos){
		try {
			cdeso.agregarSocio(s, cargos);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Socio> listarSocios() throws Exception{
		return cdeso.listarSocios();
	}
	public void actualizarSocio(Socio s){
		try {
			cdeso.actualizarSocio(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void eliminarSocio(Socio s){
		try {
			cdeso.eliminarSocio(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void registrarPagoSocio(int cod_socio,double importe){
		try {
			cdeso.registrarPago(cod_socio, importe);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
	}

	public ArrayList<Ingreso> listarIngresos() throws Exception {
		// TODO Auto-generated method stub
		CatalogodeIngresos cdei= new CatalogodeIngresos();
		return cdei.listarIngresos();

	}

	public ArrayList<Egreso> listarEgresos() throws Exception {
		// TODO Auto-generated method stub
		CatalogodeEgresos cdee= new CatalogodeEgresos();
		return cdee.listarEgresos();
		
	}

	public ArrayList<TipoIngresoEgreso> listarTiposIngreso() throws Exception {
		CatalogodeIngresos cdei= new CatalogodeIngresos();
		return cdei.listarTiposIngreso();
	}

	public ArrayList<TipoIngresoEgreso> listarTiposEgreso() throws Exception {
		CatalogodeEgresos cdee= new CatalogodeEgresos();
		return cdee.listarTiposEgreso();
	}

	public void agregarIngreso(Ingreso i) {
		// TODO Auto-generated method stub
		CatalogodeIngresos cdei= new CatalogodeIngresos();
		try {
			cdei.agregarIngreso(i);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void agregarEgreso(Egreso eg) {
		// TODO Auto-generated method stub
		CatalogodeEgresos cdee= new CatalogodeEgresos();
		try {
			cdee.agregarEgreso(eg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Padron listarPadron() {
		// TODO Auto-generated method stub
		CatalogodePadron cdpa= new CatalogodePadron();
		Padron p = new Padron();
        String fechaActual = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
        int anio= Integer.parseInt(fechaActual);
		try {
			p = cdpa.listarPadron(anio);
			p.setSociosHab(cdpa.listarSociosHab(p.getMontoMinimo(), anio));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	public ArrayList<Socio> listarSociosHab(int cod_padron, Double valorMinimo) throws Exception {
		// TODO Auto-generated method stub
		CatalogodePadron cdpa = new CatalogodePadron();
		String fechaActual = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
        int anio= Integer.parseInt(fechaActual);
		return cdpa.listarSociosHab(valorMinimo, anio);
	}

	public void actualizarValorMinimo(Cambio c, Usuario u) {
		// TODO Auto-generated method stub
		CatalogodePadron cdpa = new CatalogodePadron();
		String fechaActual = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
        c.setFecha_cambio(fechaActual);
        try {
			cdpa.actualizarMonto(c, u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<NotaExamenAlumno> getNotasAlumno(Usuario u) {
		// TODO Auto-generated method stub
		ArrayList<NotaExamenAlumno> notas= new ArrayList<NotaExamenAlumno>();
		try {
			notas= cne.listarNotasAlumno(u);
			int cant = notas.size();
			switch(cant)
			{
			case 0: Examen e= new Examen();
					e.setTipo_examen("A");
					e.setEstado("sin generar");
					NotaExamenAlumno n= new NotaExamenAlumno();
					n.setEx(e);
					n.setCondicion("sin cargar");
					notas.add(n);
					
					e= new Examen();
					e.setTipo_examen("B");
					e.setEstado("sin generar");
					n= new NotaExamenAlumno();
					n.setEx(e);
					n.setCondicion("sin cargar");
					notas.add(n);
					
					e= new Examen();
					e.setTipo_examen("C");
					e.setEstado("sin generar");
					n= new NotaExamenAlumno();
					n.setEx(e);
					n.setCondicion("sin cargar");
					notas.add(n);
					break;
			case 1: e= new Examen();
					e.setTipo_examen("B");
					e.setEstado("sin generar");
					n= new NotaExamenAlumno();
					n.setEx(e);
					n.setCondicion("sin cargar");
					notas.add(n);
					
					e= new Examen();
					e.setTipo_examen("C");
					e.setEstado("sin generar");
					n= new NotaExamenAlumno();
					n.setEx(e);
					n.setCondicion("sin cargar");
					notas.add(n);
					break;
			case 2: e= new Examen();
					e.setTipo_examen("C");
					e.setEstado("sin generar");
					n= new NotaExamenAlumno();
					n.setEx(e);
					n.setCondicion("sin cargar");
					notas.add(n);
					break;
			default: break;
			}
			return notas;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public String getAyuda() {
		// TODO Auto-generated method stub
		String ayuda= "";
		int finA=0;
		int finB=0;
		try {
			int cant=cda.buscarCantAl();
			if (cant==0)
			{
			ayuda="1- Cargar la lista del SIGAE para proceder a la realizacion del examen <br>";	
			}else{
			//String fechaActual = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
		    //solo para testear es con este año;
				int anio=2017;
			Examen ex= new Examen();
			ex=cde.buscarExamen("A", anio);
			if(ex!=null){
				
				switch(ex.getEstado()){
				case "sin generar": 
					ayuda="1- Generar la lista de alumnos en condiciones A <br> 2- Generar Examen A <br> 3- Cargar las notas A<br> 4- Repetir pasos para ByC";
								   break;
				case "alumnos cargados":
					ayuda="2- Generar Examen A <br> 3- Cargar las notas A <br> 4- Repetir pasos para ByC";
					break;
				case "generado":
					ayuda="3- Cargar las notas A <br> 4- Repetir pasos para ByC";
					break;
				case "cerrado":
					ayuda="Examen A definido <br>";
					finA=1;
					break;
				}
				}
			else {
					ayuda="1- Se debe agregar el examen A <br> 2- Generar la lista de alumnos en condiciones <br> 3- Generar Examen <br> 4- Cargar las notas <br> 5- Repetir para ByC";
				   }
			if (finA==1){
				ex=null;
				ex=cde.buscarExamen("B",anio);
				
				if (ex!=null){
				switch(ex.getEstado()){
				case "sin generar": 
					ayuda="1- Generar la lista de alumnos en condiciones B <br> 2- Generar Examen <br> 3- Cargar las notas <br> 4- Repetir para C";
								   break;
				case "alumnos cargados":
					ayuda="2- Generar Examen B <br> 3- Cargar las notas <br> 4- Repetir para C";
					break;
				case "generado":
					ayuda="3- Cargar las notas B <br> 4- Repetir pasos para C";
					break;
				case "cerrado":
					ayuda="Examen B definido <br>";
					finB=1;
					break;
				}
				}else{
					ayuda="1- Se debe agregar el examen B <br> 2- Generar la lista de alumnos en condiciones <br> 3- Generar Examen <br> 4- Cargar las notas <br> 5- Repetir para C";
				}
				if(finB==1){
					ex=null;
					ex=cde.buscarExamen("C",anio);
					
					if (ex!=null){
					switch(ex.getEstado()){
					case "sin generar": 
						ayuda="1- Generar la lista de alumnos en condiciones C <br> 2- Generar Examen <br> 3- Cargar las notas <br>";
									   break;
					case "alumnos cargados":
						ayuda="2- Generar Examen C <br> 3- Cargar las notas <br> ";
						break;
					case "generado":
						ayuda="3- Cargar las notas C <br>";
						break;
					case "cerrado":
						ayuda="Examen C definido <br> Lista final definida(Consulte)!!";
					
						break;
					}
					}else{
						ayuda="1- Se debe agregar el examen C <br> 2- Generar la lista de alumnos en condiciones <br> 3- Generar Examen <br> 4- Cargar las notas <br>";
					}
				}
				
			}
			
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return ayuda;
	}

	public void cambiaClave(Usuario u, String pass,int pv) {
		// TODO Auto-generated method stub
		cdeu.cambiaClave(u,pass,pv);
	}

	public void agregarProfesor(Profesor p) {
		// TODO Auto-generated method stub
		
		try {
			cdp.agregarProfesor(p.getNombre(),p.getApellido(),p.getFecha_nac(),p.getUsuario());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void eliminarProfesor(Profesor p) {
		// TODO Auto-generated method stub
		cdp.deleteProfesor(p.getCod_profesor());
	}

	public void editarProfesor(Profesor p) {
		// TODO Auto-generated method stub
		try {
			cdp.editarProfesor(p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Alumno> getAlumnos() {
		// TODO Auto-generated method stub
		return cda.getAllAlumnos();
	}

	public void agregarTipoIngreso(String tipo, String desc) {
		// TODO Auto-generated method stub
		CatalogodeIngresos cdi= new CatalogodeIngresos();
		try {
			cdi.agregarTipoIngreso(tipo,desc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void agregarTipoEgreso(String tipo, String desc) {
		// TODO Auto-generated method stub
		CatalogodeEgresos cdeg= new CatalogodeEgresos();
		try {
			cdeg.agregarTipoEgreso(tipo,desc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void eliminarCiclo() {
		// TODO Auto-generated method stub
		CatalogodeIngresos cdi= new CatalogodeIngresos();
		cdi.eliminarCiclo();
	}

	public void agregarResponsable(int ind, String nombre, String apellido, int dni, String clave) {
		// TODO Auto-generated method stub
		
		int rol=0;
		if(ind==1){
			rol=4;
		}else if(ind==2)
			{rol=5;
			
			}
		else{rol=6;}
		
		cdeu.agregarUsuario(dni,clave,rol);
		cdeu.agregarResponsable(nombre,apellido,dni);
		
		
	}

	public ArrayList<Responsable> buscarResps() {
		// TODO Auto-generated method stub
		return cdeu.getResponsables();
	}

	//MODULO CURSOS
	public void agregarCurso (String nombre, int año, int precio, int cupo, String descripcion) throws Exception
    {
    	Curso curso = new Curso(nombre, año, precio, cupo, descripcion);
    	cdcu.agregarCurso(curso);
    }
    
    public void agregarAlumnoCurso(int cod_curso, Alumno alumno, String observaciones) throws Exception
    {
    	cdcu.agregarAlumnoCurso(cod_curso, alumno, observaciones);
    }
    
    public ArrayList<Curso> buscarCursosAbiertos() throws Exception
    {
    	return cdcu.buscarCursosAbiertos();
    }
    
    public ArrayList<Curso> buscarCursos() throws Exception
    {
    	return cdcu.buscarCursos();
    }
    
    public ArrayList<AlumnoEnCurso> alumnosEnCurso(Curso curso) throws Exception
    {
    	return cdcu.alumnosEnCurso(curso);
    }
    
    public int cupoCurso(Curso curso) throws Exception
    {
    	return cdcu.cupoCurso(curso);
    }
    
    public void cambiarEstadoCurso(Curso curso) throws Exception
    {
    	cdcu.cambiarEstadoCurso(curso);
    }

	public void cambiarCupoCurso (Curso curso, int cupo) throws Exception
	{
		cdcu.cambiarCupoCurso(curso, cupo);
	}

	public int buscarExamenesAbiertos() {
		// TODO Auto-generated method stub
		String estado= "sin generar";
		return cde.buscarExamen(estado);
	}

	public int verAñoCorrecto(String tipoExamen,int anio) {
		// TODO Auto-generated method stub
		int respu=1;
		
		if(tipoExamen.equals("B"))
		{
			Examen ex=buscarExamen("A", anio);
			if(ex==null) respu=0;
		}
		if(tipoExamen.equals("C")){
			Examen ex=buscarExamen("B",anio);
			if(ex==null) respu=0;
		}
		return respu;
			
	}
	
	//
	

	
    
}
