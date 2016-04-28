package Entidades;

import java.sql.Date;

public class Cambio {
 public int getCod_cambio() {
		return cod_cambio;
	}
	public void setCod_cambio(int cod_cambio) {
		this.cod_cambio = cod_cambio;
	}
	public int getCod_padron() {
		return cod_padron;
	}
	public void setCod_padron(int cod_padron) {
		this.cod_padron = cod_padron;
	}
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public double getValorMinimo() {
		return valorMinimo;
	}
	public void setValorMinimo(double valorMinimo) {
		this.valorMinimo = valorMinimo;
	}
	public String getFecha_cambio() {
		return fecha_cambio;
	}
	public void setFecha_cambio(String fecha_cambio) {
		this.fecha_cambio = fecha_cambio;
	}
private int cod_cambio;
 private int cod_padron;
 private int anio;
 private double valorMinimo;
 private String fecha_cambio;
}
