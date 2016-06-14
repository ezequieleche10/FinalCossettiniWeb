package Datos;
import Datos.DBConexion_1;
import Entidades.Cambio;
import Entidades.Cargo;
import Entidades.Examen;
import Entidades.Padron;
import Entidades.Socio;
import Entidades.Usuario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;


import java.lang.String;



/**
 *
 * @author Lucia
 */


public class CatalogodePadron extends DBConexion_1{
    
    private ResultSet resu;
    private ResultSet resu2;
    
    public CatalogodePadron()
            {
          
            }
    
    public ArrayList<Socio> listarSociosHab(double montoMinimo,int anio) throws Exception
    {
        try 
        {   this.Conectar();
        ArrayList<Socio> socios = new ArrayList<Socio>();
        String cons="SELECT s.*,SUM(ap.importe) as suma FROM aporte_socio ap INNER JOIN socio s on s.cod_socio=ap.cod_socio WHERE year(ap.fecha_pago)= ? GROUP BY s.cod_socio HAVING suma > ? ";
    	PreparedStatement consulta= Cone.prepareStatement(cons);
    	consulta.setInt(1,anio);
        consulta.setDouble(2,montoMinimo);
         resu = consulta.executeQuery();
         while(resu.next())
           {
                Socio s= new Socio();
        	 	s.setCod_socio(resu.getInt("s.cod_socio"));
                s.setDni(resu.getInt("s.dni" ));
                s.setApellido(resu.getString("s.apellido"));
                s.setNombre(resu.getString("s.nombre"));
                s.setFecha_nacimiento(resu.getString("s.fecha_nacimiento"));
                String nya= s.getApellido() + " " + s.getNombre();
                s.setNya(nya);
                socios.add(s); 
                
           }
         for (int i=0;i< socios.size();++i){
        	 String consultar = "SELECT * FROM cargo_socio cs INNER JOIN cargo c on c.cod_cargo=cs.cod_cargo WHERE cs.cod_socio  = ? ";
             PreparedStatement consultar2= Cone.prepareStatement(consultar);
             consultar2.setInt(1, socios.get(i).getCod_socio());
             resu2 = consultar2.executeQuery();
             ArrayList<Cargo> cargosSocio = new ArrayList<Cargo>();
             String cargoC="";
         while(resu2.next())
         {	  
              Cargo c= new Cargo();
      	 	
              c.setCod_cargo(resu2.getInt("c.cod_cargo" ));
              c.setTipo_cargo(resu2.getString("c.tipo_cargo"));
              cargosSocio.add(c);
              cargoC= cargoC + c.getTipo_cargo()+ "/";
         } 
         socios.get(i).setCargosS(cargoC);
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
    public Padron listarPadron(int anio) throws Exception
    {
        try 
        {   this.Conectar();
        Padron p = new Padron();
        String cons="SELECT * FROM padron  WHERE anio= ?";
    	PreparedStatement consulta= Cone.prepareStatement(cons);
    	consulta.setInt(1,anio);
        resu = consulta.executeQuery();
        resu.first();
     	p.setCod_padron(resu.getInt("cod_padron"));
     	p.setAnio(resu.getInt("anio"));
     	p.setEstado(resu.getString("estado"));
     	p.setMontoMinimo(resu.getDouble("valorMinimo"));
     	
            this.Desconectar();
            return p;
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
            return null;            
        }
       
    }
    
      public void actualizarMonto(Cambio cambio,Usuario u) throws Exception
      {
         try
         {    this.Conectar();
         	  PreparedStatement updP = Cone.prepareStatement("UPDATE padron SET valorMinimo=? WHERE cod_padron= ? AND estado <> ?");
         	  updP.setDouble(1, cambio.getValorMinimo() );
         	  updP.setInt(2, cambio.getCod_padron() );
         	  updP.setString(3,"cerrado");
              updP.executeUpdate();
              String fecha_cambio = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
              String insert="INSERT INTO cambios_padron(cod_padron,nombre_usuario,valorMinimo,fecha_cambio) VALUES(?,?,?,?)";
              PreparedStatement ins= Cone.prepareStatement(insert);
              ins.setInt(1, cambio.getCod_padron());
              ins.setString(2, u.getNombre_usuario());
              ins.setDouble(3,cambio.getValorMinimo());
              ins.setString(4,fecha_cambio);
              ins.executeUpdate();
             
              
              this.Desconectar();
         }
         catch (Exception ex)
         {
             System.err.println("SQLException: " + ex.getMessage());
             
         }
        
          
      }

	public void crearPadron(Padron p) {
		// TODO Auto-generated method stub
		  try 
		        {	this.Conectar();
		        	String actu = "INSERT INTO padron (anio, estado, valorMinimo) VALUES (?,?,?)";
		        	PreparedStatement inse = Cone.prepareStatement(actu);
		            inse.setInt(1, p.getAnio());
		            inse.setString(2, p.getEstado());
		            inse.setDouble(3, p.getMontoMinimo());
		            inse.executeUpdate();
		        	 this.Desconectar();
		           
		        }
		        catch (Exception ex)
		        {
		            System.err.println("SQLException: " + ex.getMessage());            
		        }
		        
		    }

	public void cerrarPadron(int anio) {
		// TODO Auto-generated method stub
		  try
	         {    this.Conectar();
	         	  PreparedStatement updP = Cone.prepareStatement("UPDATE padron SET estado=? WHERE anio= ? ");
	         	  updP.setString(1, "cerrado");
	         	  updP.setInt(2,anio);
	         	  updP.executeUpdate();
	              this.Desconectar();
	         }
	         catch (Exception ex)
	         {
	             System.err.println("SQLException: " + ex.getMessage());
	             
	         }
	}	
	
     
      
      
}

		
		
		
	
