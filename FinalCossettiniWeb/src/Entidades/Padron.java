package Entidades;

import java.util.ArrayList;

public class Padron {
 private int cod_padron;
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
public String getEstado() {
	return estado;
}
public void setEstado(String estado) {
	this.estado = estado;
}
public double getMontoMinimo() {
	return montoMinimo;
}
public void setMontoMinimo(double montoMinimo) {
	this.montoMinimo = montoMinimo;
}
public ArrayList<Socio> getSociosHab() {
	return sociosHab;
}
public void setSociosHab(ArrayList<Socio> sociosHab) {
	this.sociosHab = sociosHab;
}
private int anio;
 private String estado;
 private double montoMinimo;
 private ArrayList<Socio> sociosHab;

}
