package com.iii.eeit9703.activity.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ActivityDAO implements ActivityDAO_interface {

	
	private static DataSource ds = null;
	static{
		try {
			Context ctx = new InitialContext(); //初始化
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TestDB"); //連結資料庫
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
		

	

		//活動上架
		private static final String UPDATE_ACT =
				"UPDATE activity set act_name=?, act_groups=?,act_current=?, BDate=?, EDate=?, act_price=?,activity_state=?,clubId=null where actID = ?";
		private static final String UPDATE_ACT_CLUB =
				"UPDATE activity set act_name=?, act_groups=?,act_current=?, BDate=?, EDate=?, act_price=?,activity_state=?,clubId=? where actID = ?";
		//刪除活動
		private static final String DELETE_ACT =
				"DELETE FROM activity where actID = ?";
		//查詢活動
		private static final String GET_ALL_ACT =
			      "SELECT actID,act_name,act_groups,act_current,BDate,EDate,activity_state,act_photo,act_price FROM activity where actID<>0";
		//查詢單筆
		private static final String GET_ONE_ACT =
			      "SELECT actID,act_name,act_groups,act_current,BDate,EDate,activity_state,act_photo,act_price,act_news,sch_photo FROM activity where actID = ?";
		//上傳預覽圖及行程特色
		private static final String Final_ACT =
				"UPDATE activity set act_photo=?,act_news=? where actID=?";
		//搜尋
		private static final String Search_ACT =
				"SELECT * FROM activity WHERE act_name like ?";

	
	

	
	//修改
	@Override
	public void update(ActivityVO activityVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			if((Integer)activityVO.getClubId()!=null){				
				pstmt = con.prepareStatement(UPDATE_ACT_CLUB);
			}else{				
				pstmt = con.prepareStatement(UPDATE_ACT);
			}
			
			pstmt.setString(1, activityVO.getAct_name());    //活動名稱
			pstmt.setString(2, activityVO.getAct_groups());    //成團人數
			pstmt.setString(3, activityVO.getAct_current());
			pstmt.setDate(4, activityVO.getBDate());      //開始日期
			pstmt.setDate(5, activityVO.getEDate());     //結束日期
			pstmt.setString(6, activityVO.getAct_price());    //活動價格
			pstmt.setInt(7, activityVO.getActivity_state());  //活動上下架
			
			if((Integer)activityVO.getClubId()!=null){
				pstmt.setInt(8, activityVO.getClubId());     //社團編號				
				pstmt.setInt(9, activityVO.getActID());      //活動編號			
			}else{
				pstmt.setInt(8, activityVO.getActID());      //活動編號
			}
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException("資料庫更新錯誤" + e.getMessage());
			
		}finally{
			if(pstmt != null){	
				try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace(System.err);
				}
			}
		}
		if(con !=null){
			try {
				con.close();
			} catch (SQLException e1) {
				e1.printStackTrace(System.err);
			}
		}
		
	}

	
	//刪除
	@Override
	public void delete(Integer actID) {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_ACT);
			
			pstmt.setInt(1, actID);
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("資料庫刪除錯誤"
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	
	//查詢單筆
	@Override
	public ActivityVO findByPrimaryKey(Integer actID) {

		ActivityVO activityVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ACT);
			
			pstmt.setInt(1, actID);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				
				activityVO = new ActivityVO();
				
				activityVO.setActID(rs.getInt("actID"));
				activityVO.setAct_name(rs.getString("act_name"));                //活動名稱
				activityVO.setAct_groups(rs.getString("act_groups"));           //成團人數
				activityVO.setAct_current(rs.getString("act_current"));        //當前人數
				activityVO.setBDate(rs.getDate("BDate"));                     //開始日期
				activityVO.setEDate(rs.getDate("EDate"));                    //結束日期
				activityVO.setAct_price(rs.getString("act_price"));         //活動價格
				activityVO.setActivity_state(rs.getInt("activity_state")); //活動型態
				activityVO.setAct_photo(rs.getString("act_photo"));
				activityVO.setAct_price(rs.getString("act_price"));
				activityVO.setAct_news(rs.getString("act_news"));
				activityVO.setSch_photo(rs.getString("sch_photo"));
				
				
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return activityVO;
	}

	//查詢全部活動
	@Override
	public List<ActivityVO> getAll() {
		
		List<ActivityVO> list = new ArrayList<ActivityVO>();
		ActivityVO activityVO = null;

		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_ACT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
                activityVO = new ActivityVO();
                activityVO.setActID(rs.getInt("actID"));   
                activityVO.setAct_name(rs.getString("act_name"));                //活動名稱
				activityVO.setAct_groups(rs.getString("act_groups"));           //成團人數
				activityVO.setAct_current(rs.getString("act_current"));        //當前人數
				activityVO.setBDate(rs.getDate("BDate"));                     //開始日期
				activityVO.setEDate(rs.getDate("EDate"));                    //結束日期
				activityVO.setAct_price(rs.getString("act_price"));         //活動價格
				activityVO.setActivity_state(rs.getInt("activity_state"));  //活動型態
				activityVO.setAct_photo(rs.getString("act_photo"));        //預覽圖片
				
				list.add(activityVO);
				
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	//查詢關鍵
	public ArrayList<ActivityVO> Search(String act_name) {
		
		ArrayList<ActivityVO> list = new ArrayList<ActivityVO>();
		ActivityVO activityVO = null;
		

		
		     Connection con =null;
		     PreparedStatement pstmt =null;
		     ResultSet rs =null;		   
		     act_name = "%"+act_name+"%";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(Search_ACT);			
				pstmt.setString(1, act_name);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					
					activityVO = new ActivityVO();
					activityVO.setActID(rs.getInt("actID"));
					activityVO.setAct_name(rs.getString("act_name"));                //活動名稱
					activityVO.setAct_groups(rs.getString("act_groups"));           //成團人數
					activityVO.setAct_current(rs.getString("act_current"));        //當前人數
					activityVO.setAct_photo(rs.getString("act_photo"));
					activityVO.setAct_price(rs.getString("act_price"));
					activityVO.setActivity_state(rs.getInt("activity_state"));
					
					list.add(activityVO);
				}
				
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return list;
		}
		
	

	
    //活動特色和行程預覽行程
	public void finalAct(ActivityVO activityVO){
		
		Connection con = null;
		PreparedStatement pstmt =null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Final_ACT);
					
			pstmt.setString(1, activityVO.getAct_photo());
			pstmt.setString(2, activityVO.getAct_news());
			pstmt.setInt(3, activityVO.getActID());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException("資料庫更新錯誤" + e.getMessage());
			
		}finally{
			if(pstmt != null){	
				try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace(System.err);
				}
			}
		}
		if(con !=null){
			try {
				con.close();
			} catch (SQLException e1) {
				e1.printStackTrace(System.err);
			}
		}
		
		
		
		
	}
	
	

	public static void main(String[] args) {

		ActivityDAO dao = new ActivityDAO();
		

		
		//刪除
		dao.delete(1);
		
		// 查詢
		ActivityVO actVO3 = dao.findByPrimaryKey(1);
		System.out.print(actVO3.getActID() + ",");
		System.out.print(actVO3.getAct_name() + ",");
		System.out.print(actVO3.getAct_groups() + ",");
		System.out.print(actVO3.getAct_current() + ",");
		System.out.print(actVO3.getBDate() + ",");
		System.out.print(actVO3.getEDate() + ",");
		System.out.print(actVO3.getActivity_state() + ",");
		System.out.println(actVO3.getAct_photo()+ ",");
		System.out.println(actVO3.getAct_price()+ ",");

		System.out.println("---------------------");
		
		// 查詢
		List<ActivityVO> list = dao.getAll();
		for (ActivityVO aAct : list) {
			System.out.print(aAct.getActID() + ",");
			System.out.print(aAct.getAct_name() + ",");
			System.out.print(aAct.getAct_groups() + ",");
			System.out.print(aAct.getAct_current() + ",");
			System.out.print(aAct.getEDate() + ",");
			System.out.print(aAct.getEDate() + ",");
			System.out.print(aAct.getActivity_state() + ",");
			System.out.println(actVO3.getAct_photo()+ ",");

			System.out.println();
		}
		

	}


	


	
	}


	





