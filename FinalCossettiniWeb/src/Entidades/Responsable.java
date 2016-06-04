package Entidades;

public class Responsable {

	private String apellido;
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public Usuario getU() {
		return u;
	}
	public void setU(Usuario u) {
		this.u = u;
	}
	private String nombre;
	private String dni;
	private Usuario u;
}
