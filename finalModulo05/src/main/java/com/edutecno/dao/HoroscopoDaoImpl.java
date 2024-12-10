package com.edutecno.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Date; 
import java.text.SimpleDateFormat;

import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.edutecno.modelo.Horoscopo;
import com.edutecno.modelo.Usuario;
import com.edutecno.procesaconexion.ConexionDB;

public class HoroscopoDaoImpl extends ConexionDB implements Dao<Horoscopo>{

	
	static private List<Horoscopo> horoscopos;
	private static final String[] HEADERS = {"horoscopo", "fecha inicio", "fecha final"};
	private String path = "C:/Users/fernando/eclipse-workspace/finalModulo05/";
	private String file = "horoscopo.xlsx";
	
	public HoroscopoDaoImpl() {
		super();
		horoscopos = new ArrayList<>();
	}
	
	@Override
	public List<Horoscopo> getAll() {
		return horoscopos;
	}

	@Override
	public Horoscopo getById(int id) {
		return null;
	}

	@Override
	public void save(Horoscopo t) {
		
	}


	@Override
	public void delete(int id) {
		
	}
	

	public void loadFromFiles() {
		try(FileInputStream fis = new FileInputStream(path+file);
				XSSFWorkbook workbook = new XSSFWorkbook(fis)) {
			Sheet sheet = workbook.getSheetAt(0);
			horoscopos.clear();
			
			for(int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
				Row row = sheet.getRow(rowNum);
				Horoscopo horoscopo = new Horoscopo();
				
				horoscopo.setAnimal(row.getCell(0).getStringCellValue());
				
				if (row.getCell(1).getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(row.getCell(1))) {
					horoscopo.setFechaInicio(row.getCell(1).getDateCellValue()); 
				} 
				
				if (row.getCell(2).getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(row.getCell(2))) {
					horoscopo.setFechaFin(row.getCell(2).getDateCellValue());
				}
				
				horoscopos.add(horoscopo);
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	
	
	
//	public List<Horoscopo> obtenerHoroscopo() {
//		List<Horoscopo> horoscopoList = new ArrayList<>(); 
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		
//		try {
//			horoscopoList.add(new Horoscopo("Rata", dateFormat.parse("2020-01-25"), dateFormat.parse("2021-02-11")));
//			horoscopoList.add(new Horoscopo("Buey", dateFormat.parse("2021-02-12"), dateFormat.parse("2022-01-30"))); 
//			
//			} catch (Exception e) {
//				e.printStackTrace(); 
//			} return horoscopoList;
//	}
	
	
	    public List<Horoscopo> obtenerHoroscopo() {
	        List<Horoscopo> horoscopoList = new ArrayList<>();
	        String excelFilePath = path+file;

	        try (FileInputStream fis = new FileInputStream(excelFilePath);
	        		XSSFWorkbook workbook = new XSSFWorkbook(fis)) {

	            Sheet sheet = workbook.getSheetAt(0);
	            for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
	                Row row = sheet.getRow(rowNum);
	                if (row != null) {
	                    Date fechaInicio = null;
	                    Date fechaFin = null;

	                    if (row.getCell(1).getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(row.getCell(1))) {
	                        fechaInicio = row.getCell(1).getDateCellValue();
	                    }

	                    if (row.getCell(2).getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(row.getCell(2))) {
	                        fechaFin = row.getCell(2).getDateCellValue();
	                    }

	                    Horoscopo h = new Horoscopo();
	                    h.setAnimal(row.getCell(0).getStringCellValue());
	                    h.setFechaInicio(fechaInicio);
	                    h.setFechaFin(fechaFin);
	                    horoscopoList.add(h);
	                }
	            }

	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return horoscopoList;
	    }
}

		

	

	


	 
	   
	

	    
	    


	


