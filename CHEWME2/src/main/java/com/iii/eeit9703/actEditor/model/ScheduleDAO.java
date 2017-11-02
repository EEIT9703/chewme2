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

import com.iii.eeit9703.activity.model.ActivityVO;

public class ScheduleDAO {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String NEWACTIVITY= "INSERT INTO activity(act_name,memId)VALUES(?,?) ";
	private static final String SELECTACTIVITY= "SELECT actID,act_name from activity where act_name=?";
	private static final String NEWSCHEDULES= "INSERT INTO schedules(attractionID,dayNo,period)VALUES(?,?,?)";
	private static final String SELECTSCHEDULES= "SELECT TOP(1)scheduleID from schedules where attractionID=? and actID is null";
	private static final String UPDATESCHEDULES= "UPDATE TOP(1)schedules set period=? WHERE attractionID=? and actID is null";
	private static final String UPDATESCHEDULES2= "UPDATE schedules set actID=? WHERE scheduleID=? and actID is null";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public Integer insertACT(String actName){
		ArrayList<ActivityVO> list = new ArrayList<ActivityVO>();
		int actID = 0;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(NEWACTIVITY);
			
			pstmt.setString(1, actName);
			pstmt.setInt(2, 3);
			pstmt.executeUpdate();
			
			actID = selectACT(actName);
			
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
		
		return actID;
	}
	
	public Integer selectACT(String actName){
		
		ArrayList<ActivityVO> activitylist = new ArrayList<ActivityVO>();
		ActivityVO activityVO=null;
		int actID = 0;

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECTACTIVITY);
			
			pstmt.setString(1, actName);
			rs = pstmt.executeQuery();
			rs.next();
			actID = rs.getInt("actID");

			
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
		return actID;
	}
	
	public Integer insertSCH(ScheduleVO SCHlist){
		
		ArrayList<ScheduleVO> schedulelist = new ArrayList<ScheduleVO>();
		Integer scheduleID = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(NEWSCHEDULES);
			//NEWSCHEDULES= "INSERT INTO schedules(attractionID,dayNo,period)VALUES(?,?,?)"
			pstmt.setInt(1, SCHlist.getAttractionID());
			pstmt.setInt(2, SCHlist.getDayNo());
			pstmt.setString(3, SCHlist.getPeriod());
			pstmt.executeUpdate();
			
			scheduleID = selectSCH(SCHlist.getAttractionID());
						
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
		return scheduleID;
	}
	
	public Integer selectSCH(Integer attractionID){
		
		Integer scheduleID = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECTSCHEDULES);
			
			pstmt.setInt(1, attractionID);
			rs = pstmt.executeQuery();
			rs.next();
			scheduleID = rs.getInt("scheduleID");
			
			
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
		return scheduleID;
	}
	
	public void updateSCH(ScheduleVO chVO){
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATESCHEDULES);
			
			pstmt.setString(1, chVO.getPeriod());
			pstmt.setInt(2, chVO.getAttractionID());
			pstmt.executeUpdate();		
			
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

	public void updateSCH2(String actID,Integer schID) {
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATESCHEDULES2);
			
			Integer Nact = Integer.parseInt(actID);

			pstmt.setInt(1, Nact);
			pstmt.setInt(2, schID);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static void main(String[] args) {
		
		ScheduleDAO aDao = new ScheduleDAO();
		ScheduleVO testVO = new ScheduleVO();
		
		//新增行程後查詢
/*		List<ActivityVO> list = aDao.insertACT("花蓮一日遊");
		for(ActivityVO act : list){
			System.out.print(act.getActID()+",");
			testVO.setActID(act.getActID());
			System.out.println(act.getAct_name());
		}
*/		
		//新增行程明細
		testVO.setAttractionID(15);
		testVO.setDayNo(1);
		testVO.setPeriod("09:00");
		
		Integer scheduleID=aDao.insertSCH(testVO);
		System.out.println(scheduleID);
		

	}

}
