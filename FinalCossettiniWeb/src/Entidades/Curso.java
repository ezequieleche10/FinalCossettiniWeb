package Entidades;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.JOptionPane;

public class Curso {
	
	private int cod_curso;
	private String nombre;
	private String descripcion;
	private int anio;
	private int cupo;
	private int precio;
	private String estado;
	 
	public int getCod_curso() {
		return cod_curso;
	}
	public void setCod_curso(int cod_curso) {
		this.cod_curso = cod_curso;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public int getCupo() {
		return cupo;
	}
	public void setCupo(int cupo) {
		this.cupo = cupo;
	}
	public int getPrecio() {
		return precio;
	}
	public void setPrecio(int precio) {
		this.precio = precio;
	}

	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Curso(String nombre, int año, int precio, int cupo, String descripcion) {
		this.nombre = nombre;
    	this.descripcion = descripcion;
        this.anio = año;
        this.cupo = cupo;
        this.precio = precio;	
	}
	
	public Curso(int cod_curso, String nombre, String descripcion) {
		this.cod_curso = cod_curso;
		this.nombre = nombre;
    	this.descripcion = descripcion;
	}
	public Curso(int cod_curso, String nombre, int anio, String estado, int cupo) {
		this.cod_curso = cod_curso;
		this.nombre = nombre;
    	this.anio = anio;
        this.estado = estado;	
        this.cupo=cupo;
	}
	public Curso(int cod_curso, String nombre, int anio, String estado, int precio, int cupo) {
		this.cod_curso = cod_curso;
		this.nombre = nombre;
    	this.anio = anio;
        this.estado = estado;
        this.precio = precio;
        this.cupo=cupo;
	}
}
