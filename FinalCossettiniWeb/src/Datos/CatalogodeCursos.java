package Datos;

import Entidades.Alumno;
import Entidades.AlumnoEnCurso;
import Entidades.Curso;
import Entidades.Examen;
import Entidades.Profesor;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.JOptionPane;


public class CatalogodeCursos extends DBConexion_1 {
    
    private ResultSet resu;
    
    public void agregarCurso(Curso curso) throws Exception
    {
        try 
        {   
        		this.Conectar();

        		PreparedStatement insert= Cone.prepareStatement("INSERT INTO curso(nombre, descripcion, precio, anio, cupo, estado, cupo_inicial) VALUES(?,?,?,?,?,?,?)");
        		insert.setString(1, curso.getNombre());
        		insert.setString(2, curso.getDescripcion());
        		insert.setInt(3, curso.getPrecio());
        		insert.setInt(4, curso.getAnio());
        		insert.setInt(5, curso.getCupo());
        		insert.setString(6, "abierto");
        		insert.setInt(7, curso.getCupo());
                insert.executeUpdate();

                this.Desconectar(); 
        	
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());            
        }
    }
    
    public ArrayList<Curso> buscarCursos() throws Exception
    {
    	
    	try 
        {   
    		this.Conectar();
	        String consult = "SELECT * FROM curso WHERE estado = ?";
	        PreparedStatement consulta= Cone.prepareStatement(consult);
	        consulta.setString(1, "abierto");
            ArrayList<Curso> listaCursos = new ArrayList<Curso>();
            resu = consulta.executeQuery();
            while(resu.next())
               {    
            		int id = resu.getInt("cod_curso");
	            	String nombre = resu.getString("nombre");
	                int anio = resu.getInt("anio");
	                String estado = resu.getString("estado");
	                int cupo= resu.getInt("cupo");
	                listaCursos.add(new Curso(id, nombre, anio, estado,cupo));
               }
            this.Desconectar();
            return listaCursos;
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage() + ex.toString());
            return null;            
        }
    }
   
    public void agregarAlumnoCurso(int cod_curso, Alumno alumno, String observacion) throws Exception
    {
        try 
        {   
        		this.Conectar();

        		PreparedStatement insert= Cone.prepareStatement("INSERT INTO alumno_en_curso(cod_curso, observacion, id_alumno) VALUES(?,?,?)");
        		insert.setInt(1, cod_curso);
        		insert.setString(2, observacion);
        		insert.setInt(3, alumno.getDni());
                insert.executeUpdate();

                String sqlc="SELECT cupo, precio FROM curso WHERE cod_curso = ?";
            	PreparedStatement consult= Cone.prepareStatement(sqlc);
            	consult.setInt(1, cod_curso);
            	resu=consult.executeQuery();
            	resu.first();
            	int cupo= resu.getInt("cupo");
            	int precioCurso = resu.getInt("precio");
                
                PreparedStatement upd = Cone.prepareStatement("UPDATE curso SET cupo = ? WHERE cod_curso = ?");
             	upd.setInt(1, cupo - 1);
             	upd.setInt(2, cod_curso);
                upd.executeUpdate();
                
                PreparedStatement insert1= Cone.prepareStatement("INSERT INTO aporte_alumno_curso(id_alumno, id_curso, precio, fecha) VALUES(?,?,?,?)");
                insert1.setInt(1, alumno.getDni());
                insert1.setInt(2, cod_curso);
                insert1.setInt(3, precioCurso);
                Date date = new Date();
                java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                insert1.setDate(4, sqlDate);
                insert1.executeUpdate();
                
                this.Desconectar();
        	
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());            
        }
    }
    
    public ArrayList<Curso> buscarCursosAbiertos() throws Exception
    {
    	
    	try 
        {   
    		this.Conectar();
	        String consult = "SELECT * FROM curso WHERE estado = ? and cupo > 0";
	        PreparedStatement consulta= Cone.prepareStatement(consult);
	        consulta.setString(1, "abierto");
            ArrayList<Curso> listaCursos = new ArrayList<Curso>();
            resu = consulta.executeQuery();
            while(resu.next())
               {    
            		int id = resu.getInt("cod_curso");
	            	String nombre = resu.getString("nombre");
	            	int anio = resu.getInt("anio");
	                String estado = resu.getString("estado");
	                int precio = resu.getInt("precio");
	                int cupo= resu.getInt("cupo");
	                listaCursos.add(new Curso(id, nombre, anio, estado, precio,cupo));
               }
            this.Desconectar();
            return listaCursos;
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
            return null;
        }
		
    }
    
    public void cambiarEstadoCurso(Curso curso) throws Exception
    {
        try 
        {   
        		this.Conectar();

                
                PreparedStatement upd = Cone.prepareStatement("UPDATE curso SET estado= ? WHERE cod_curso= ?");
             	upd.setString(1, "cerrado");
             	upd.setInt(2, curso.getCod_curso());
                upd.executeUpdate(); 
                
                this.Desconectar();
        	
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());            
        }
    }
    
    public ArrayList<AlumnoEnCurso> alumnosEnCurso(Curso curso) throws Exception
    {
    	try 
        {   
    	this.Conectar();
        String consult = "SELECT * FROM alumno_en_curso aec INNER JOIN alumno a ON aec.id_alumno = a.dni WHERE cod_curso = ?";
        PreparedStatement consulta= Cone.prepareStatement(consult);
        consulta.setInt(1, curso.getCod_curso());
        ArrayList<AlumnoEnCurso> listaAlumnos = new ArrayList<AlumnoEnCurso>();
        resu = consulta.executeQuery();
        while(resu.next())
           {    
        		int dni = resu.getInt("dni");
        		String nombre = resu.getString("nombre");
        		String apellido = resu.getString("apellido");
            	String desc = resu.getString("observacion");
                listaAlumnos.add(new AlumnoEnCurso(dni, nombre, apellido, desc));
           }
        this.Desconectar();
        return listaAlumnos;
    }
    catch (Exception ex)
    {
        System.err.println("SQLException: " + ex.getMessage());
        return null;
    }
	
    }
    
    public int cupoCurso(Curso curso) throws Exception
    {
    	try 
        {   
    		this.Conectar();
	        String consult = "SELECT * FROM curso WHERE cod_curso = ?";
	        PreparedStatement consulta= Cone.prepareStatement(consult);
	        consulta.setInt(1, curso.getCod_curso());
	        resu = consulta.executeQuery();
            resu.first();
            int cupo = resu.getInt("cupo_inicial" );
            this.Desconectar();
            return cupo;
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage() + ex.toString());
            return 0;            
        }
    }
    
    public void cambiarCupoCurso(Curso curso, int cupo) throws Exception
    {
        try 
        {   
        		this.Conectar();
                PreparedStatement upd = Cone.prepareStatement("UPDATE curso SET cupo= ? WHERE cod_curso= ?");
             	upd.setInt(1, cupo);
             	upd.setInt(2, curso.getCod_curso());
                upd.executeUpdate(); 
                this.Desconectar();
        	
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());            
        }
    }

}
