package Entidades;

import java.util.ArrayList;

public class Socio {
	private int cod_socio;
	public int getCod_socio() {
		return cod_socio;
	}
	public void setCod_socio(int cod_socio) {
		this.cod_socio = cod_socio;
	}
	public int getDni() {
		return dni;
	}
	public void setDni(int dni) {
		this.dni = dni;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public ArrayList<Cargo> getCargos() {
		return cargos;
	}
	public void setCargos(ArrayList<Cargo> cargos) {
		this.cargos = cargos;
	}
	private int dni;
    private String nombre;
    private String apellido;
    private ArrayList<Cargo> cargos;
    private String fecha_nacimiento;
	public String getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(String fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	 private String nya;
	 public String getNya() {
		return nya;
	}
	public void setNya(String nya) {
		this.nya = nya;
	}
	public String getCargosS() {
		return cargosS;
	}
	public void setCargosS(String cargosS) {
		this.cargosS = cargosS;
	}
	private String cargosS;
}
