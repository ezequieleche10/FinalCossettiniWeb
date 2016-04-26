package Entidades;

public class CargoSocio {

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
	public int getCod_socio() {
		return cod_socio;
	}
	public void setCod_socio(int cod_socio) {
		this.cod_socio = cod_socio;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	private String tipo_cargo;
	private int cod_socio;
	private String descripcion;
}
