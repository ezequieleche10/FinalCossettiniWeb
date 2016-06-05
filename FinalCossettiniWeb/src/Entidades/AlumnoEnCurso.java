package Entidades;

public class AlumnoEnCurso {
	 	private String nombre;
	    private String observacion;
	    private int dni;
	    private String apellido;
	    
	    public AlumnoEnCurso(String nomAl, String obs) {
	        this.nombre= nomAl;
	        this.observacion= obs;
	        
	    }
	    
	    public AlumnoEnCurso(int dni, String nomAl, String apellido, String obs) {
	    	this.dni = dni;
	        this.nombre= nomAl;
	        this.apellido = apellido;
	        this.observacion= obs;
	        
	    }

		public String getNombre() {
			return nombre;
		}

		public void setNombre(String nombre) {
			this.nombre = nombre;
		}

		public String getObservacion() {
			return observacion;
		}

		public void setObservacion(String observacion) {
			this.observacion = observacion;
		}
	    
	    
}
