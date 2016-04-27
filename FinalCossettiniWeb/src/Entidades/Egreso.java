package Entidades;

public class Egreso {
	public int getCod_egreso() {
		return cod_egreso;
	}
	public void setCod_egreso(int cod_egreso) {
		this.cod_egreso = cod_egreso;
	}
	public int getCod_tipo_egreso() {
		return cod_tipo_egreso;
	}
	public void setCod_tipo_egreso(int cod_tipo_egreso) {
		this.cod_tipo_egreso = cod_tipo_egreso;
	}
	public String getTipo_egreso() {
		return tipo_egreso;
	}
	public void setTipo_egreso(String tipo_egreso) {
		this.tipo_egreso = tipo_egreso;
	}
	public double getCantidad() {
		return cantidad;
	}
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	public String getFecha_egreso() {
		return fecha_egreso;
	}
	public void setFecha_egreso(String fecha_egreso) {
		this.fecha_egreso = fecha_egreso;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	private int cod_egreso;
	private int cod_tipo_egreso;
	private String tipo_egreso;
	private double cantidad;
	private String fecha_egreso;
	private String observaciones;
}
