package Datos;
import Datos.DBConexion_1;
import Entidades.Egreso;
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


public class CatalogodeEgresos extends DBConexion_1{
    
    private ResultSet resu;
    
    
    public CatalogodeEgresos()
            {
          
            }
    
    public ArrayList<Egreso> listarEgresos() throws Exception
    {
        try 
        {   this.Conectar();
        ArrayList<Egreso> egresos = new ArrayList<Egreso>();
    	String cons="SELECT * FROM egreso eg";
    	PreparedStatement consulta= Cone.prepareStatement(cons);
         resu = consulta.executeQuery();
         while(resu.next())
           {
                Egreso e= new Egreso();
        	 	e.setCod_egreso(resu.getInt("eg.cod_egreso"));
                e.setCod_tipo_egreso(resu.getInt("eg.codigo_tipo_egreso" ));
                e.setTipo_egreso(resu.getString("eg.tipo_egreso"));
                e.setCantidad(resu.getDouble("eg.cantidad"));
                e.setFecha_egreso(resu.getString("eg.fecha_egreso"));
                e.setObservaciones(resu.getString("eg.observaciones"));
                egresos.add(e); 
                
           }
         	this.Desconectar();
            return egresos;
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
            return null;            
        }
       
    }
    
     public void agregarEgreso(Egreso i) throws Exception
    {
        try 
        {	this.Conectar();
        	String fecha_egreso = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
        	String actu = "INSERT INTO egreso (tipo_egreso,codigo_tipo_egreso,cantidad,fecha_egreso,observaciones) VALUES (?,?,?,?,?)";
        	PreparedStatement inse = Cone.prepareStatement(actu);
            inse.setString(1,i.getTipo_egreso());
            inse.setInt(2, i.getCod_tipo_egreso());
            inse.setDouble(3,i.getCantidad());
            inse.setString(4, fecha_egreso);
            inse.setString(5, i.getObservaciones());
        	inse.executeUpdate();
        	
        	 this.Desconectar();
           
        }
        catch (Exception ex)
        {
            System.err.println("SQLException: " + ex.getMessage());            
        }
        
    }
     
      public void actualizarIngreso(Egreso e) throws Exception
      {
         try
         {    this.Conectar();
         	  
             	PreparedStatement upd = Cone.prepareStatement("UPDATE ingreso SET tipo_ingreso=?,codigo_tipo_ingreso=?,cantidad=?,fecha_ingreso=?,observaciones=? WHERE cod_ingreso= ?");
              
              upd.setString(1,e.getTipo_egreso());
              upd.setInt(2, e.getCod_tipo_egreso());
              upd.setDouble(3,e.getCantidad());
              upd.setString(4, e.getFecha_egreso());
              upd.setString(5, e.getObservaciones());
              upd.setInt(6, e.getCod_egreso());
              upd.executeUpdate();
              
              
              this.Desconectar();
         }
         catch (Exception ex)
         {
             System.err.println("SQLException: " + ex.getMessage());
             
         }
        
          
      }
      public void eliminarIngreso(Egreso egreso) throws Exception
      {
         try
         {    this.Conectar();
         	  PreparedStatement del = Cone.prepareStatement("DELETE FROM egreso WHERE cod_egreso= ?");
         	  del.setInt(1, egreso.getCod_egreso());
              del.executeUpdate();
              
            this.Desconectar();
         }
         catch (Exception ex)
         {
             System.err.println("SQLException: " + ex.getMessage());
             
         }
        
          
      }
      
      public ArrayList<TipoIngresoEgreso> listarTiposEgreso() throws Exception
      {
          try 
          {   this.Conectar();
          ArrayList<TipoIngresoEgreso> tipos = new ArrayList<TipoIngresoEgreso>();
      	String cons="SELECT * FROM tipos_egresos tipo";
      	PreparedStatement consulta= Cone.prepareStatement(cons);
           resu = consulta.executeQuery();
           while(resu.next())
             {
                  TipoIngresoEgreso t= new TipoIngresoEgreso();
          	 	  t.setCodigo(resu.getInt("tipo.cod_tipo_egreso"));
                  t.setTipo_codigo(resu.getString("tipo.tipo_egreso"));
                  
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

		
		
		
	
