package com.iii.eeit9703.actEditor.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountryDAO_JDBC {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";
	
	private static final String COUNTRY = "SELECT * FROM countrys order by queue";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<CountryVO> getCountry(){

		List<CountryVO> list = new ArrayList<CountryVO>();
		CountryVO countryVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(COUNTRY);
			rs = pstmt.executeQuery();
						
			while(rs.next()){
				countryVO = new CountryVO();
				countryVO.setQueue(rs.getInt("queue"));
				countryVO.setCountryID(rs.getString("countryID"));
				countryVO.setCountryName(rs.getString("countryName"));
				list.add(countryVO);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs != null){
				try {rs.close();} 
				catch (SQLException e) {e.printStackTrace();}
			}
			if(pstmt != null){
				try {pstmt.close();} 
				catch (SQLException e) {e.printStackTrace();}
			}
			if(con != null){
				try {con.close();} 
				catch (SQLException e) {e.printStackTrace();}
			}
		}
		return list;
		
		
	}
	
	
	
	public static void main(String[] args) {
		
		CountryDAO_JDBC aDao = new CountryDAO_JDBC();
		
		//查台灣縣市
		List<CountryVO> list = aDao.getCountry();
		for(CountryVO area : list){
			System.out.print(area.getCountryID()+",");
			System.out.println(area.getCountryName());
		}
	}

}
