package com.edutecno.modelo;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Horoscopo {
	
	    private String animal;
	    private Date fechaInicio;
	    private Date fechaFin;
	    
	    //private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    
	    public Horoscopo() {
	     
	    }
	    
	    public Horoscopo(String animal, Date fechaInicio, Date fechaFin) {
	        this.animal = animal;
	        this.fechaInicio = fechaInicio;
	        this.fechaFin = fechaFin;
	    }

	    public String getAnimal() {
	        return animal;
	    }

	    public void setAnimal(String animal) {
	        this.animal = animal;
	    }

	    public Date getFechaInicio() {
	        return fechaInicio;
	    }

	    public void setFechaInicio(Date fechaInicio) {
	        this.fechaInicio = fechaInicio;
	    }

	    public Date getFechaFin() {
	        return fechaFin;
	    }

	    public void setFechaFin(Date date) {
	        this.fechaFin = date;
	    }
	    
//	 // Método para obtener la fecha de inicio formateada
//	    public String getFechaInicioFormateada() {
//	    	return dateFormat.format(fechaInicio); 
//	    } 
//	    
//	   // Método para obtener la fecha de fin formateada
//	    public String getFechaFinFormateada() { 
//	    	return dateFormat.format(fechaFin); 
//	    }


		@Override
		public String toString() {
			return "Horoscopo [animal=" + animal + ", fechaInicio=" + fechaInicio + ", fechaFin=" + fechaFin+ "]";
		}
	    
	    

}
