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
	private static final String DELETESCHEDULES= "UPDATE schedules set actID=0 WHERE attractionID=? and actID is null";
	private static final String DELETEALL= "UPDATE schedules set actID=0 WHERE scheduleID=? and actID is null";
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public Integer insertACT(String actName, Integer memId){
	
		System.out.println("insertACT1");
		ArrayList<ActivityVO> list = new ArrayList<ActivityVO>();
		int actID = 0;
		try {

			System.out.println("insertACT2");
			con = ds.getConnection();
			con.setAutoCommit(false);
			System.out.println("insertACT3");
			pstmt = con.prepareStatement(NEWACTIVITY);
			
			System.out.println("insertACT4");
			pstmt.setString(1, actName);
			pstmt.setInt(2, memId);
			pstmt.executeUpdate();
			con.commit();
			actID = selectACT(actName);
			System.out.println("insertACT5");
			
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
		System.out.println("selectACT1");		
		ArrayList<ActivityVO> activitylist = new ArrayList<ActivityVO>();
		ActivityVO activityVO=null;
		int actID = 0;

		try {
			
			System.out.println("selectACT2");		
			con = ds.getConnection();
			con.setAutoCommit(false);
			System.out.println("selectACT3");		
			pstmt = con.prepareStatement(SELECTACTIVITY);
			System.out.println("selectACT4");		
			
			pstmt.setString(1, actName);
			System.out.println("selectACT5");		
			rs = pstmt.executeQuery();
			con.commit();
			System.out.println("selectACT6");		
			rs.next();
			System.out.println("selectACT7");		
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
		//System.out.println("insertSCH");	
		ArrayList<ScheduleVO> schedulelist = new ArrayList<ScheduleVO>();
		Integer scheduleID = null;

		try {

			System.out.println("insertSCH2");	
			
			
			con = ds.getConnection();
			System.out.println(con);
			
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(NEWSCHEDULES);
			System.out.println("insertSCH4");	
			pstmt.setInt(1, SCHlist.getAttractionID());
			pstmt.setInt(2, SCHlist.getDayNo());
			pstmt.setString(3, SCHlist.getPeriod());
			pstmt.executeUpdate();
			con.commit();
			scheduleID = selectSCH(SCHlist.getAttractionID());
						
		} catch (SQLException e) {
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
				try {
					con.close();
					System.out.println("conn close!");
				} 
				catch (SQLException e) {e.printStackTrace();}
			}
		}
		return scheduleID;
	}
	
	public Integer selectSCH(Integer attractionID){
		//System.out.println("selectSCH1");	
		Integer scheduleID = null;
		
		try {
			//System.out.println("selectSCH2");	

			con = ds.getConnection();
			con.setAutoCommit(false);
			//System.out.println("selectSCH3");	
			pstmt = con.prepareStatement(SELECTSCHEDULES);
			//System.out.println("selectSCH4");	
			
			pstmt.setInt(1, attractionID);
			rs = pstmt.executeQuery();
			con.commit();
			//System.out.println("selectSCH5");	
			rs.next();
			//System.out.println("selectSCH6");	
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
			
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(UPDATESCHEDULES);
			
			pstmt.setString(1, chVO.getPeriod());
			pstmt.setInt(2, chVO.getAttractionID());
			pstmt.executeUpdate();		
			con.commit();
			
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
			System.out.println("uptdateSCH1");	
			con = ds.getConnection();
			con.setAutoCommit(false);
			System.out.println("uptdateSCH2");	
			pstmt = con.prepareStatement(UPDATESCHEDULES2);
			System.out.println("uptdateSCH3");	
			
			Integer Nact = Integer.parseInt(actID);

			pstmt.setInt(1, Nact);
			pstmt.setInt(2, schID);
			pstmt.executeUpdate();
			con.commit();
			System.out.println("uptdate5");	

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
	public void deleteSCH(Integer attrID) {
		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(DELETESCHEDULES);
			
			pstmt.setInt(1, attrID);
			pstmt.executeUpdate();
			con.commit();
			
			System.out.println("attrID="+attrID);

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
	
	public void deleteAll(Integer schID) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETEALL);

			pstmt.setInt(1, schID);
			pstmt.executeUpdate();
			con.commit();
			
			System.out.println("schID="+schID);

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
	public static void main(String[] args){

	}
	
}
