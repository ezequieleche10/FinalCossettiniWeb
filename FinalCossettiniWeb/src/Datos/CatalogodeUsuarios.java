package Datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entidades.Examen;
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
		   
		    
		    public void cambiaClave(Usuario u, String pass) {
				// TODO Auto-generated method stub
				//se actualizan todas las notas por alumno 
				
					
					try 
			        {   this.Conectar();
			        
			        	PreparedStatement upd2= Cone.prepareStatement("UPDATE usuario SET clave=?,pv=? where nombre_usuario=?");
			        	upd2.setString(1, pass);
			        	upd2.setInt(2, 1);
			        	upd2.setString(3, u.getNombre_usuario());
			        	upd2.executeUpdate();  
			        	
			        	this.Desconectar();
				
			        	
			        }
			        catch (Exception ex)
			        {
			            System.err.println("SQLException: " + ex.getMessage());            
			        }
					
				}
}

	

