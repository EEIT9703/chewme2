package com.iii.eeit9703.actEditor.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CountryDAO_JNDI {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String COUNTRY = "SELECT * FROM countrys order by queue";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<CountryVO> getCountry(){

		List<CountryVO> list = new ArrayList<CountryVO>();
		CountryVO countryVO = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(COUNTRY);
			rs = pstmt.executeQuery();
						
			while(rs.next()){
				countryVO = new CountryVO();
				countryVO.setQueue(rs.getInt("queue"));
				countryVO.setCountryID(rs.getString("countryID"));
				countryVO.setCountryName(rs.getString("countryName"));
				list.add(countryVO);
			}
			
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
		
		CountryDAO_JNDI aDao = new CountryDAO_JNDI();
		
		//查台灣縣市
		List<CountryVO> list = aDao.getCountry();
		for(CountryVO area : list){
			System.out.print(area.getCountryID()+",");
			System.out.println(area.getCountryName());
		}
	}

}
