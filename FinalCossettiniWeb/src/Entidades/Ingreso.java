package Entidades;

public class Ingreso {
	private int cod_ingreso;
	public int getCod_ingreso() {
		return cod_ingreso;
	}
	public void setCod_ingreso(int cod_ingreso) {
		this.cod_ingreso = cod_ingreso;
	}
	public int getCod_tipo_ingreso() {
		return cod_tipo_ingreso;
	}
	public void setCod_tipo_ingreso(int cod_tipo_ingreso) {
		this.cod_tipo_ingreso = cod_tipo_ingreso;
	}
	public String getTipo_ingreso() {
		return tipo_ingreso;
	}
	public void setTipo_ingreso(String tipo_ingreso) {
		this.tipo_ingreso = tipo_ingreso;
	}
	public double getCantidad() {
		return cantidad;
	}
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	public String getFecha_ingreso() {
		return fecha_ingreso;
	}
	public void setFecha_ingreso(String fecha_ingreso) {
		this.fecha_ingreso = fecha_ingreso;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
	private int cod_tipo_ingreso;
	private String tipo_ingreso;
	private double cantidad;
	private String fecha_ingreso;
	private String observaciones;
}
