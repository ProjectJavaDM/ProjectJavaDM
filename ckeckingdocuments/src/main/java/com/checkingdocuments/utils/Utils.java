package com.checkingdocuments.utils;

import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Utils {
	
	private final Logger log = LoggerFactory.getLogger(Utils.class);
	
	public boolean findFile(String url, String nameFile, Long periodicity) {
		File listFile[] = (new File(url)).listFiles();
		Boolean searchFile = false;
		if(listFile != null){
			for (File element: listFile){
				if(element.isDirectory()){
					searchFile = findFile(element.getPath(),nameFile,periodicity);
				}
				else if (element.getName().indexOf(nameFile) > -1 && 
						betweenDatesFindFile(element,periodicity))
					return true;
			}
		}
		return searchFile;
	}
	
	public boolean betweenDatesFindFile(File file, Long periodicity) {
		Long dateFile = file.lastModified();
		Date nowDate = new Date();
		Date dateModified = new Date(dateFile);
		Date dateLast;
		switch(periodicity.intValue()){
			case 1:
				dateLast = addSubtractDate(nowDate, -7);
				return findDate(dateLast,nowDate,dateModified);
			case 2:
				dateLast = addSubtractDate(nowDate, -14);
				return findDate(dateLast,nowDate,dateModified);
			case 3: 
				dateLast = addSubtractDate(nowDate, -30);
				return findDate(dateLast,nowDate,dateModified);
			default: return false;
		}
	}
	
	public boolean findDate(Date dateRange2, Date dateRange1, Date date){
		Calendar calendarDateRange1 = new GregorianCalendar();
		Calendar calendarDateRange2 = new GregorianCalendar();
		Calendar calendarDate = new GregorianCalendar();
		
		calendarDateRange1.setTime(dateRange1);
		calendarDateRange2.setTime(dateRange2);
		calendarDate.setTime(date);
		
		if(calendarDate.after(calendarDateRange2) && calendarDate.before(calendarDateRange1))
			return true;
		return false;
	}
	
	public Date addSubtractDate(Date date, int days){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_YEAR, days);
		return calendar.getTime();
	}
	
	public String urlServerLocal(){
		try {
			InetAddress inetAddress = InetAddress.getLocalHost();
			return inetAddress.getHostAddress();
		} catch (UnknownHostException e) {
			log.error("Error: ", e);
		}
		return "";
	}
}
