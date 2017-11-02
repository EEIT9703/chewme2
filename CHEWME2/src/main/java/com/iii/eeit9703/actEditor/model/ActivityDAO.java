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

public class ActivityDAO {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String SelectAttraction = "select * from schedules S join attractions A on S.attractionID=A.attractionID where actID=? order by dayNo, period";
	private static final String SelectActivity = "SELECT  act_name  FROM activity WHERE actID = ? ";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//由actID取得actName
	public String getActName(Integer actID){
		
		String actName = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SelectActivity);
			
			pstmt.setInt(1, actID);
			rs = pstmt.executeQuery();
			rs.next();
			actName = rs.getString("act_name");
			
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
		return actName;		
	}

	//由actID取得旅遊資料	
		public ArrayList<AttrVO> getTrip(Integer actID){

			ArrayList<AttrVO> list = new ArrayList<AttrVO>();
			AttrVO attrVO = null;
			ScheduleVO schVO =null;

			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(SelectAttraction);
				
				
				pstmt.setInt(1, actID);
				
				rs = pstmt.executeQuery();
							
				while(rs.next()){
					attrVO = new AttrVO();
					schVO = new ScheduleVO();
					
					attrVO.setAttractionID(rs.getInt("attractionID"));
					attrVO.setName(rs.getString("name"));
					attrVO.setCounty(rs.getString("county"));
					attrVO.setType(rs.getString("type"));
					attrVO.setAddress(rs.getString("address"));
					attrVO.setTel(rs.getString("tel"));
					attrVO.setIntro(rs.getString("intro"));
					attrVO.setImage(rs.getBinaryStream("image"));
					
//					System.out.println(attrVO.getImage());
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
/*							is.read(buf, 0, size);
							//將buf轉為base64
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
						schVO.setDayNo(rs.getInt("dayNo"));
						schVO.setPeriod(rs.getString("period").substring(0, 5));
					
						
						attrVO.setScheduleData(schVO);
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
	
	
	
	public static void main(String[] args) {
		
		ActivityDAO aDao = new ActivityDAO();
		
		
		List<AttrVO> list = aDao.getTrip(113);
		for(AttrVO area : list){
			System.out.print(area.getName()+",");
			System.out.print(area.getCounty()+",");
			System.out.print(area.getType()+",");
			System.out.print(area.getAddress()+",");
			System.out.println(area.getTel());
			System.out.println(area.getScheduleData().getPeriod());
		}
	}
	

}
