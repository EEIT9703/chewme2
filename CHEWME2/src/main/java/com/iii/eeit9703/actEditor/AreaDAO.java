package com.iii.eeit9703.actEditor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AreaDAO {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";
	
	private static final String SELECT = "SELECT * FROM taiwan_areas where countyID = ?";
	
	public List<AreaVO> findConty(String countyID){
		
		List<AreaVO> list = new ArrayList<AreaVO>();
		AreaVO areaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT);
			
			pstmt.setString(1, countyID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				areaVO = new AreaVO();
				areaVO.setContyID(rs.getInt("contyID"));
				areaVO.setConty(rs.getString("conty"));
				areaVO.setCounty(rs.getString("county"));
				areaVO.setCountyID(rs.getString("countyID"));
				list.add(areaVO);
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
		
		AreaDAO aDao = new AreaDAO();
		
		List<AreaVO> list = aDao.findConty("TPE");
		for(AreaVO area : list){
			System.out.print(area.getContyID()+",");
			System.out.print(area.getConty()+",");
			System.out.print(area.getCounty()+",");
			System.out.println(area.getCountyID()+",");
		}

	}

}
