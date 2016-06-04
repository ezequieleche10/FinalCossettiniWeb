package Datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Entidades.Examen;
import Entidades.Responsable;
import Entidades.Usuario;

public class CatalogodeUsuarios extends DBConexion_1 {
    private ResultSet resu;

	public Usuario getUsuario(String usu) throws Exception{
		        Usuario u= new Usuario();
		        try 
		        {   
		        	this.Conectar();
		            String vsql="SELECT * FROM usuario where nombre_usuario=?";
		            PreparedStatement consulta= Cone.prepareStatement(vsql);
		            consulta.setString(1, usu);
		            resu = consulta.executeQuery();
		            while(resu.next())
		            {
		            int tipo_usuario = resu.getInt("tipo_usuario" );
		            int codigo_profesor = resu.getInt("codigo_profesor");
		            int dni = resu.getInt("dni");
		            int pv= resu.getInt("pv");
		            String pass= resu.getString("clave");
		            u.setNombre_usuario(usu);
		            u.setClave(pass);
		            u.setTipo_Usuario(tipo_usuario);
		            u.setCodigo_profesor(codigo_profesor);
		            u.setPv(pv);
		            u.setDni(dni);
		            }
		            this.Desconectar();
		            
		            return u;
		        }
		        catch (Exception ex)
		        {
		            System.err.println("SQLException: " + ex.getMessage());
		            return null;            
		        }
		    }
		   
		    
		    public void cambiaClave(Usuario u, String pass,int pv) {
				// TODO Auto-generated method stub
				//se actualizan todas las notas por alumno 
				
					
					try 
			        {   this.Conectar();
			        
			        	PreparedStatement upd2= Cone.prepareStatement("UPDATE usuario SET clave=?,pv=? where nombre_usuario=?");
			        	upd2.setString(1, pass);
			        	upd2.setInt(2, pv);
			        	upd2.setString(3, u.getNombre_usuario());
			        	upd2.executeUpdate();  
			        	
			        	this.Desconectar();
				
			        	
			        }
			        catch (Exception ex)
			        {
			            System.err.println("SQLException: " + ex.getMessage());            
			        }
					
				}


			public void agregarUsuario(int dni, String clave, int rol) {
				// TODO Auto-generated method stub
				try 
		        {   this.Conectar();
		        	String nUsuario= Integer.toString(dni);
		        	PreparedStatement ins= Cone.prepareStatement("INSERT usuario(nombre_usuario,clave,tipo_usuario,pv) VALUES (?,?,?,?)");
		        	ins.setString(1, nUsuario);
		        	ins.setString(2, clave);
		        	ins.setInt(3, rol);
		        	ins.setInt(4, 0);
		        	ins.executeUpdate();  
		        	
		        	this.Desconectar();
			
		        	
		        }
		        catch (Exception ex)
		        {
		            System.err.println("SQLException: " + ex.getMessage());            
		        }
				
			}


			public void agregarResponsable(String nombre, String apellido, int dni) {
				// TODO Auto-generated method stub
				try 
		        {   this.Conectar();
		        	String nUsuario= Integer.toString(dni);
		        	PreparedStatement ins= Cone.prepareStatement("INSERT responsable(apellido,nombre,dni) VALUES (?,?,?)");
		        	ins.setString(1, apellido);
		        	ins.setString(2, nombre);
		        	ins.setString(3, nUsuario);
		        	ins.executeUpdate();  
		        	
		        	this.Desconectar();
			
		        	
		        }
		        catch (Exception ex)
		        {
		            System.err.println("SQLException: " + ex.getMessage());            
		        }
			}


			public ArrayList<Responsable> getResponsables() {
				
				ArrayList<Responsable> resps= new ArrayList<Responsable>();
		        try 
		        {   
		        	this.Conectar();
		            String vsql="SELECT * FROM responsable";
		            PreparedStatement consulta= Cone.prepareStatement(vsql);
		            resu = consulta.executeQuery();
		            while(resu.next())
		            {
		            	Responsable r= new Responsable();
		            	r.setNombre(resu.getString("nombre"));
		                r.setApellido(resu.getString("apellido"));
		                Usuario u= new Usuario();
		                u.setNombre_usuario(resu.getString("dni"));
		                r.setU(u);
		                resps.add(r);
		            }
		            this.Desconectar();
		            
		            return resps;
		        }
		        catch (Exception ex)
		        {
		            System.err.println("SQLException: " + ex.getMessage());
		            return null;            
		        }
			}
}

	

