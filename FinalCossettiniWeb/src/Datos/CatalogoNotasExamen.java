/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Entidades.NotaExamenAlumno;
import Entidades.Usuario;
import Entidades.Alumno;
import Entidades.Examen;

import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

/**
 *
 * @author Lucia
 */
public class CatalogoNotasExamen extends DBConexion_1 {
    
     private ResultSet resu;
     public ArrayList<NotaExamenAlumno> listarNotaExamenAlumno(int cod_examen) throws Exception
    {
        try 
        {    this.Conectar();
        	
            String cadenaC="SELECT * FROM alumno_en_examen INNER JOIN alumno ON alumno_en_examen.dni=alumno.dni WHERE alumno_en_examen.cod_examen = ?";
            ArrayList<NotaExamenAlumno> notasExamenesAlumnos = new ArrayList<NotaExamenAlumno>();
            PreparedStatement consulta= Cone.prepareStatement(cadenaC);
            consulta.setInt(1, cod_examen);
            resu= consulta.executeQuery(); 
            
         
            while(resu.next())
               {
                    float nota = resu.getFloat("nota");
                    String condicion = resu.getString("estado");
                    int dniAl = resu.getInt("dni" );
                    String nomAl = resu.getString("nombre");
                    String apeAl = resu.getString("apellido");
                    String mailAl = resu.getString("mail");
                    String tuelAl = resu.getString("turno_eleccion");
                    String indiAl = resu.getString("ingreso_directo");
                    String nombreC= getNombreCarrera(resu.getInt("cod_carrera"));
                    Alumno al = new Alumno(dniAl, nomAl, apeAl,  mailAl, tuelAl, indiAl,nombreC);
                    NotaExamenAlumno nea= new NotaExamenAlumno(nota,condicion,al);
                
                    
                    notasExamenesAlumnos.add(nea); 
                    
               }
            this.Desconectar();
            
            return notasExamenesAlumnos;
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
            return null;            
        }
    }
     public ArrayList<NotaExamenAlumno> listarNotasAlumno(Usuario u) throws Exception
     {
         try 
         {    this.Conectar();
         	
             String cadenaC="select * from examen e inner join alumno_en_examen ae on ae.cod_examen=e.cod_examen inner join alumno_en_carrera aec on aec.dni=ae.dni inner join carrera c on c.cod_carrera=aec.cod_carrera where ae.dni= ? ";
             ArrayList<NotaExamenAlumno> notasExamenesAlumnos = new ArrayList<NotaExamenAlumno>();
             PreparedStatement consulta= Cone.prepareStatement(cadenaC);
             consulta.setInt(1, Integer.parseInt(u.getNombre_usuario()));
             resu= consulta.executeQuery(); 
             
          
             while(resu.next())
                {
            	 	//seteo el examen
            	     Examen e = new Examen();
                     e.setCod_examen(resu.getInt("e.cod_examen"));
                     e.setTipo_examen(resu.getString("e.tipo_examen"));
                     e.setEstado(resu.getString("e.estado" ));
                     e.setAnio(resu.getInt("e.anio" ));
                     Alumno al= new Alumno();
                     int dni = resu.getInt("ae.dni");
                     String nombreC= getNombreCarrera(resu.getInt("cod_carrera"));
                     al.setDni(dni);
                     al.setNombre_Carrera(nombreC);
                     NotaExamenAlumno nea= new NotaExamenAlumno();
                     e.setEstado(resu.getString("ae.estado" ));
                     e.setAnio(resu.getInt("e.anio" ));
                     nea.setNota(resu.getFloat("ae.nota"));
                     nea.setCondicion(resu.getString("ae.estado"));
                     nea.setAlumno(al);
                     nea.setEx(e);
                     notasExamenesAlumnos.add(nea); 
                     
                }
             this.Desconectar();
             
             return notasExamenesAlumnos;
         }
         catch (Exception ex)
         {
             System.err.println("SQLException: " + ex.getMessage());
             return null;            
         }
     }
     
      public void agregarAlumnos(ArrayList<NotaExamenAlumno> listaNotas, int cod_examen) throws Exception
    {
        try 
        {   
            this.Conectar();
            String insert="INSERT INTO alumno_en_examen(dni,cod_examen,estado,nota)VALUES(?,?,?,?)";
            PreparedStatement ins= Cone.prepareStatement(insert);
            for (int i =0; i<listaNotas.size(); i++)
            {
            int dni = listaNotas.get(i).getAlumno().getDni();
            String estado = listaNotas.get(i).getCondicion();
            float nota = listaNotas.get(i).getNota();
            ins.setInt(1,dni);
            ins.setInt(2,cod_examen );
            ins.setString(3,estado);
            ins.setFloat(4, nota);
            ins.executeUpdate();
            
        	}
             this.Desconectar();
        	
            
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
                        
        }
    }
      private String getNombreCarrera(int int1) {
    	  if(int1==1)
    	  {
    		return "Traductorado de ingles";
    	  }
    		else return "Profesorado de ingles";
    	}
    
}
