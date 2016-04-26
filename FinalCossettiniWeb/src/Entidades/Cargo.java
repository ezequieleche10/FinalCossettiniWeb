package Entidades;

public class Cargo {

	private int cod_cargo;
	public int getCod_cargo() {
		return cod_cargo;
	}
	public void setCod_cargo(int cod_cargo) {
		this.cod_cargo = cod_cargo;
	}
	public String getTipo_cargo() {
		return tipo_cargo;
	}
	public void setTipo_cargo(String tipo_cargo) {
		this.tipo_cargo = tipo_cargo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	private String tipo_cargo;
	private String descripcion;
}
