package com.iii.eeit9703.actEditor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iii.eeit9703.activity.model.ActivityVO;

public class ScheduleDAO {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";
	
	private static final String NEWACTIVITY= "INSERT INTO activity(act_name,memId)VALUES(?,?) ";
	private static final String SELECTACTIVITY= "SELECT actID,act_name from activity where act_name=?";
	private static final String NEWSCHEDULES= "INSERT INTO schedules(actID,attractionID,dayNo,period,remark)VALUES(?,?,?,?,?)";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public ArrayList<ActivityVO> insertACT(String actName){
		ArrayList<ActivityVO> list = new ArrayList<ActivityVO>();

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(NEWACTIVITY);
			
			pstmt.setString(1, actName);
			pstmt.setInt(2, 3);
			pstmt.executeUpdate();
			
			list = selectACT(actName);
			
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
	
	public ArrayList<ActivityVO> selectACT(String actName){
		
		ArrayList<ActivityVO> activitylist = new ArrayList<ActivityVO>();
		ActivityVO activityVO=null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECTACTIVITY);
			
			pstmt.setString(1, actName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				activityVO = new ActivityVO();
				activityVO.setActID(rs.getInt("actID"));
				activityVO.setAct_name(actName);
				activitylist.add(activityVO);
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
		return activitylist;
	}
	
	public void insertSCH(ScheduleVO SCHlist){
		
		ArrayList<ScheduleVO> schedulelist = new ArrayList<ScheduleVO>();
		

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(NEWSCHEDULES);
			// NEWSCHEDULES= "INSERT INTO schedules(actID,attractionID,dayNo,period,remark)VALUES(?,?,?,?,?)"
			pstmt.setInt(1, SCHlist.getActID());
			pstmt.setInt(2, SCHlist.getAttractionID());
			pstmt.setInt(3, SCHlist.getDayNo());
			pstmt.setString(4, SCHlist.getPeriod());
			pstmt.setString(5, SCHlist.getRemark());
			pstmt.executeUpdate();
						
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
		
	}
	
	public static void main(String[] args) {
		
		ScheduleDAO aDao = new ScheduleDAO();
		ScheduleVO testVO = new ScheduleVO();
		
		//新增行程後查詢
		List<ActivityVO> list = aDao.insertACT("花蓮一日遊");
		for(ActivityVO act : list){
			System.out.print(act.getActID()+",");
			testVO.setActID(act.getActID());
			System.out.println(act.getAct_name());
		}
		
		//新增行程明細
		testVO.setAttractionID(15);
		testVO.setDayNo(1);
		testVO.setPeriod("09:00");
		testVO.setRemark("測試資料,Data for test!!");
		
		aDao.insertSCH(testVO);
		System.out.println("Success!!");
		

	}

}
