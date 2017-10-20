package com.iii.eeit9703.actEditor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttrDAO {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";
	
	private static final String COUNTY = "SELECT countyName FROM countys where countyID = ?";
	private static final String Attr = "SELECT  *  FROM Attractions A join countys c on A.county=c.countryName WHERE countyID = ? and address like ?";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public String getCountyName(Integer countyID){
		
		String countryName = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(COUNTY);
			
			pstmt.setInt(1, countyID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				countryName = rs.getString("countyName");
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
		return countryName;		
	}
	
	public ArrayList<AttrVO> getAttr(Integer countyID){

		ArrayList<AttrVO> list = new ArrayList<AttrVO>();
		AttrVO attrVO = null;
		
		String countryName = getCountyName(countyID);
		countryName = "%"+countryName+"%";
//		System.out.println(countryName);

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Attr);
			
			
			pstmt.setInt(1, countyID);
			pstmt.setString(2, countryName);
			
			rs = pstmt.executeQuery();
						
			while(rs.next()){
				attrVO = new AttrVO();
				attrVO.setAttractionID(rs.getInt("attractionID"));
				attrVO.setName(rs.getString("name"));
				attrVO.setCounty(rs.getString("county"));
				attrVO.setType(rs.getString("type"));
				attrVO.setAddress(rs.getString("address"));
				attrVO.setTel(rs.getString("tel"));
				attrVO.setIntro(rs.getString("intro"));
				//attrVO.setImage(rs.getString("image"));				
				
				list.add(attrVO);
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
		
		AttrDAO aDao = new AttrDAO();
		
		//查區域景點、餐廳、民宿
		List<AttrVO> list = aDao.getAttr(251);
		for(AttrVO area : list){
			System.out.print(area.getName()+",");
			System.out.print(area.getCounty()+",");
			System.out.print(area.getType()+",");
			System.out.print(area.getAddress()+",");
			System.out.println(area.getTel());
		}
	}

}
