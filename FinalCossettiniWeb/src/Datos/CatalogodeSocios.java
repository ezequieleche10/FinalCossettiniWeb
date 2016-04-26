package Datos;
import Datos.DBConexion_1;
import Entidades.Alumno;
import Entidades.Carrera;
import Entidades.Comision;
import Entidades.Ejercicio;
import Entidades.Examen;
import Entidades.Profesor;
import Entidades.Socio;
import Entidades.AlumnoEnEjercicio;
import Entidades.Cargo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import static java.lang.System.out;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.lang.String;

import javax.swing.JOptionPane;

/**
 *
 * @author Lucia
 */


public class CatalogodeSocios extends DBConexion_1{
    
    private ResultSet resu;
    private ResultSet resu2;
    
    public CatalogodeSocios()
            {
          
            }
    
    public ArrayList<Socio> listarSocios() throws Exception
    {
        try 
        {   this.Conectar();
        ArrayList<Socio> socios = new ArrayList<Socio>();
    	String cons="SELECT * FROM socio s";
    	PreparedStatement consulta= Cone.prepareStatement(cons);
         resu = consulta.executeQuery();
         while(resu.next())
           {
                Socio s= new Socio();
        	 	s.setCod_socio(resu.getInt("s.cod_socio"));
                s.setDni(resu.getInt("s.dni" ));
                s.setApellido(resu.getString("s.apellido"));
                s.setNombre(resu.getString("s.nombre"));
                s.setFecha_nacimiento(resu.getString("s.fecha_nacimiento"));
                socios.add(s); 
                
           }
         for (int i=0;i< socios.size();++i){
        	 String consultar = "SELECT * FROM cargo_socio cs INNER JOIN cargo c on c.cod_cargo=cs.cod_cargo WHERE cs.cod_socio  = ? ";
             PreparedStatement consultar2= Cone.prepareStatement(consultar);
             consultar2.setInt(1, socios.get(i).getCod_socio());
             resu2 = consultar2.executeQuery();
             ArrayList<Cargo> cargosSocio = new ArrayList<Cargo>();
         while(resu2.next())
         {	  
              Cargo c= new Cargo();
      	 	
              c.setCod_cargo(resu2.getInt("c.cod_cargo" ));
              c.setTipo_cargo(resu2.getString("c.tipo_cargo"));
              cargosSocio.add(c);
              
         } 
         socios.get(i).setCargos(cargosSocio);;
         }
       
            this.Desconectar();
            return socios;
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
            return null;            
        }
       
    }
    
     public void agregarSocio(Socio so, ArrayList<Cargo> cargos) throws Exception
    {
        try 
        {	this.Conectar();
        	String actu = "INSERT INTO socio (dni,nombre,apellido,fecha_nacimiento) VALUES (?,?,?,?)";
        	PreparedStatement inse = Cone.prepareStatement(actu);
            inse.setInt(1, so.getDni());
            inse.setString(2, so.getNombre());
            inse.setString(3, so.getApellido());
            inse.setString(4, so.getFecha_nacimiento());
        	inse.executeUpdate();
        	
        	String sqlc="SELECT max(cod_socio) as codigo FROM socio";
        	PreparedStatement consult= Cone.prepareStatement(sqlc);
        	resu=consult.executeQuery();
        	resu.first();
        	int cod_socio= resu.getInt("codigo");
        	
        	for (int i =0; i<cargos.size(); i++)
            {
        		
        		String actu2 = "INSERT INTO cargo_socio (cod_cargo,cod_socio) VALUES (?,?)";
            	PreparedStatement inse2 = Cone.prepareStatement(actu2);
                inse2.setInt(1, cargos.get(i).getCod_cargo());
                inse2.setInt(2, cod_socio);
                inse2.executeUpdate();   
            }
            this.Desconectar();
           
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());            
        }
        
    }
     
      public void actualizarSocio(Socio socio) throws Exception
      {
         try
         {    this.Conectar();
         	  PreparedStatement del = Cone.prepareStatement("DELETE FROM cargo_socio WHERE cod_socio= ?");
         	  del.setInt(1, socio.getCod_socio());
              del.executeUpdate();
              
              PreparedStatement upd = Cone.prepareStatement("UPDATE socio SET dni=?,nombre=?,apellido=?,fecha_nacimiento=? WHERE cod_socio= ?");
              upd.setInt(1, socio.getDni());
              upd.setString(2, socio.getNombre());
              upd.setString(3, socio.getApellido());
              upd.setString(4, socio.getFecha_nacimiento());
              upd.setInt(5, socio.getCod_socio());
              upd.executeUpdate();
              for (int i=0;i<socio.getCargos().size();++i){
            	String actu2 = "INSERT INTO cargo_socio (cod_cargo,cod_socio) VALUES (?,?)";
              	PreparedStatement inse2 = Cone.prepareStatement(actu2);
                  inse2.setInt(1, socio.getCargos().get(i).getCod_cargo());
                  inse2.setInt(2, socio.getCod_socio());
                  inse2.executeUpdate();
              }
              
              this.Desconectar();
         }
         catch (Exception ex)
         {
             System.err.println("SQLException: " + ex.getMessage());
             
         }
        
          
      }
      public void eliminarSocio(Socio socio) throws Exception
      {
         try
         {    this.Conectar();
         	  PreparedStatement del = Cone.prepareStatement("DELETE FROM cargo_socio WHERE cod_socio= ?");
         	  del.setInt(1, socio.getCod_socio());
              del.executeUpdate();
              
              PreparedStatement del2 = Cone.prepareStatement("DELETE FROM socio WHERE cod_socio= ?");
              del2.setInt(1, socio.getCod_socio());
              del2.executeUpdate();
              
               this.Desconectar();
         }
         catch (Exception ex)
         {
             System.err.println("SQLException: " + ex.getMessage());
             
         }
        
          
      }
      
      public void registrarPago(int cod_socio, double importe) throws Exception
      {
          try 
          {	this.Conectar();
          	String fecha_pago = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
          	String actu = "INSERT INTO aporte_socio (cod_socio,fecha_pago,importe) VALUES (?,?,?)";
          	PreparedStatement inse = Cone.prepareStatement(actu);
              inse.setInt(1, cod_socio);
              inse.setString(2,fecha_pago);
              inse.setDouble(3, importe);
              
          	inse.executeUpdate();
          	
          	
              this.Desconectar();
             
          }
          catch (Exception ex)
          {
              System.err.println("SQLException: " + ex.getMessage());            
          }
          
      } 
}

		
		
		
	
