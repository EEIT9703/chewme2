package com.iii.eeit9703.actEditor.model;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AttrDAO_JNDI {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String COUNTY = "SELECT countyName FROM countys where countyID = ?";
	private static final String AttrByCountry = "SELECT  *  FROM Attractions A join countrys c on A.county=c.countryName WHERE countryID = ? ";
	private static final String AttrByCounty = "SELECT  *  FROM Attractions A join countys c on A.county=c.countryName WHERE countyID = ? and address like ?";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public String getCountyName(Integer countyID){
		
		String countryName = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(COUNTY);
			
			pstmt.setInt(1, countyID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				countryName = rs.getString("countyName");
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
		return countryName;		
	}

	//由縣市取得景點資料	
		public ArrayList<AttrVO> getAttrByCountry(String countryID){

			ArrayList<AttrVO> list = new ArrayList<AttrVO>();
			AttrVO attrVO = null;

			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(AttrByCountry);
				
				
				pstmt.setString(1, countryID);
				
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
					attrVO.setImage(rs.getBinaryStream("image"));
					System.out.println(attrVO.getImage());
					InputStream is 	 =attrVO.getImage();
					
					//InputStream is = null;
					ByteArrayOutputStream bos = null;
					try {

						int len;
						int size = 1024;
						byte[] buf;

						if (is instanceof ByteArrayInputStream) {
							
							//檔案大小若是60個byte 準備的byte陣列就設為60 剛好把檔案塞進去
							size = is.available();
							buf = new byte[size];
							//將檔案讀入buf
							is.read(buf, 0, size);
/*							//將buf轉為base64
							String strbase64 = Base64.getEncoder().encodeToString(buf);
							//將strbase64放入attrVO
							attrVO.setImg64(strbase64);
							
							list.add(attrVO);
*/						} else {
							bos = new ByteArrayOutputStream();
							//一次讀size個byte
							buf = new byte[size];
							while ((len = is.read(buf, 0, size)) != -1)
								//透過while迴圈一次寫size個byte到bos裡
								bos.write(buf, 0, len);
							//用toByteArray()方法把完整檔案轉成byte陣列存入buf
							buf = bos.toByteArray();
							//將buf轉為base64
							String strbase64 = Base64.getEncoder().encodeToString(buf);
//						System.out.println(strbase64);
							attrVO.setImg64(strbase64);
							
							list.add(attrVO);
						}	
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						try {
							is.close();							
							// is.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
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
	


//由區域取得景點資料	
	public ArrayList<AttrVO> getAttrByCounty(Integer countyID){

		ArrayList<AttrVO> list = new ArrayList<AttrVO>();
		AttrVO attrVO = null;
		
		String countryName = getCountyName(countyID);
		countryName = "%"+countryName+"%";
//		System.out.println(countryName);

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(AttrByCounty);
			
			
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
		
		AttrDAO_JNDI aDao = new AttrDAO_JNDI();
		
		//查區域景點、餐廳、民宿
		List<AttrVO> list = aDao.getAttrByCountry("TPE");
		for(AttrVO area : list){
			System.out.print(area.getName()+",");
			System.out.print(area.getCounty()+",");
			System.out.print(area.getType()+",");
			System.out.print(area.getAddress()+",");
			System.out.println(area.getTel());
			System.out.println(area.getImage());
		}
	}
	

}
