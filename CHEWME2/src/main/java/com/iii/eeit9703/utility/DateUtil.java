package com.iii.eeit9703.utility;

import java.util.Calendar;

public class DateUtil {

	public static java.sql.Date getCurrentTimeStamp() {
	    Calendar cal = Calendar.getInstance();
	    java.sql.Date sqlDate = new java.sql.Date(cal.getTimeInMillis());
	    return sqlDate;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
