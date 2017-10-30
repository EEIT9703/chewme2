package com.iii.eeit9703.actEditor.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountyDAO {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";
	
	private static final String COUNTY = "SELECT * FROM countys where countryID = ? order by countyID";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public ArrayList<CountyVO> getCounty(String countryID){

		ArrayList<CountyVO> list = new ArrayList<CountyVO>();
		CountyVO countyVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(COUNTY);
			
			pstmt.setString(1, countryID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				countyVO = new CountyVO();
				countyVO.setCountyID(rs.getInt("countyID"));
				countyVO.setCountyName(rs.getString("countyName"));
				countyVO.setCountryName(rs.getString("countryName"));
				countyVO.setCountryID(rs.getString("countryID"));
				list.add(countyVO);
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
		
		CountyDAO aDao = new CountyDAO();
		
		//查台北市區域
		List<CountyVO> list = aDao.getCounty("TPE");
		for(CountyVO area : list){
			System.out.print(area.getCountyID()+",");
			System.out.print(area.getCountyName()+",");
			System.out.print(area.getCountryName()+",");
			System.out.println(area.getCountryID());
		}

	}

}
