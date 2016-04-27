package Datos;
import Datos.DBConexion_1;
import Entidades.Ingreso;
import Entidades.TipoIngresoEgreso;

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


public class CatalogodeIngresos extends DBConexion_1{
    
    private ResultSet resu;
    
    
    public CatalogodeIngresos()
            {
          
            }
    
    public ArrayList<Ingreso> listarIngresos() throws Exception
    {
        try 
        {   this.Conectar();
        ArrayList<Ingreso> ingresos = new ArrayList<Ingreso>();
    	String cons="SELECT * FROM ingreso ing";
    	PreparedStatement consulta= Cone.prepareStatement(cons);
         resu = consulta.executeQuery();
         while(resu.next())
           {
                Ingreso i= new Ingreso();
        	 	i.setCod_ingreso(resu.getInt("ing.cod_ingreso"));
                i.setCod_tipo_ingreso(resu.getInt("ing.codigo_tipo_ingreso" ));
                i.setTipo_ingreso(resu.getString("ing.tipo_ingreso"));
                i.setCantidad(resu.getDouble("ing.cantidad"));
                i.setFecha_ingreso(resu.getString("ing.fecha_ingreso"));
                i.setObservaciones(resu.getString("ing.observaciones"));
                ingresos.add(i); 
                
           }
         	this.Desconectar();
            return ingresos;
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
            return null;            
        }
       
    }
    
     public void agregarIngreso(Ingreso i) throws Exception
    {
        try 
        {	this.Conectar();
        	String fecha_ingreso = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
        	String actu = "INSERT INTO ingreso (tipo_ingreso,codigo_tipo_ingreso,cantidad,fecha_ingreso,observaciones) VALUES (?,?,?,?,?)";
        	PreparedStatement inse = Cone.prepareStatement(actu);
            inse.setString(1,i.getTipo_ingreso());
            inse.setInt(2, i.getCod_tipo_ingreso());
            inse.setDouble(3,i.getCantidad());
            inse.setString(4,fecha_ingreso);
            inse.setString(5, i.getObservaciones());
        	inse.executeUpdate();
        	
        	 this.Desconectar();
           
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());            
        }
        
    }
     
      public void actualizarIngreso(Ingreso i) throws Exception
      {
         try
         {    this.Conectar();
         	  
             	PreparedStatement upd = Cone.prepareStatement("UPDATE ingreso SET tipo_ingreso=?,codigo_tipo_ingreso=?,cantidad=?,fecha_ingreso=?,observaciones=? WHERE cod_ingreso= ?");
              
              upd.setString(1,i.getTipo_ingreso());
              upd.setInt(2, i.getCod_tipo_ingreso());
              upd.setDouble(3,i.getCantidad());
              upd.setString(4, i.getFecha_ingreso());
              upd.setString(5, i.getObservaciones());
              upd.setInt(6, i.getCod_ingreso());
              upd.executeUpdate();
              
              
              this.Desconectar();
         }
         catch (Exception ex)
         {
             System.err.println("SQLException: " + ex.getMessage());
             
         }
        
          
      }
      public void eliminarIngreso(Ingreso ingreso) throws Exception
      {
         try
         {    this.Conectar();
         	  PreparedStatement del = Cone.prepareStatement("DELETE FROM ingreso WHERE cod_ingreso= ?");
         	  del.setInt(1, ingreso.getCod_ingreso());
              del.executeUpdate();
              
            this.Desconectar();
         }
         catch (Exception ex)
         {
             System.err.println("SQLException: " + ex.getMessage());
             
         }
        
          
      }
      public ArrayList<TipoIngresoEgreso> listarTiposIngreso() throws Exception
      {
          try 
          {   this.Conectar();
          ArrayList<TipoIngresoEgreso> tipos = new ArrayList<TipoIngresoEgreso>();
      	String cons="SELECT * FROM tipos_ingresos tipo";
      	PreparedStatement consulta= Cone.prepareStatement(cons);
           resu = consulta.executeQuery();
           while(resu.next())
             {
                  TipoIngresoEgreso t= new TipoIngresoEgreso();
          	 	  t.setCodigo(resu.getInt("tipo.cod_tipo_ingreso"));
                  t.setTipo_codigo(resu.getString("tipo.tipo_ingreso"));
                  
                  tipos.add(t); 
                  
             }
           	this.Desconectar();
              return tipos;
          }
          catch (Exception ex)
          {
              System.err.println("SQLException: " + ex.getMessage());
              return null;            
          }
         
      }
            
     
}

		
		
		
	
