package com.iii.eeit9703.member.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.*;
import java.util.*;



public class MemJDBCDAO {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String INSERT_STMT = "INSERT INTO members (memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memPhoto,memStatus,memRole) VALUES(?,?,?,?,?,?,?,?,?,?,'正常','一般會員')";
	private static final String GET_ALL_STMT = "SELECT  memId,memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memPhoto,memStatus,memRole FROM members order by memId";
	private static final String GET_ONE_STMT = "SELECT  memId,memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memPhoto,memStatus,memRole FROM members WHERE memId=?";
	private static final String DELETE = "DELETE FROM members WHERE memId=?";
	private static final String UPDATE = "UPDATE members set memberId=? ,memName=?,memNickN=?, memPwd=?, memBirthday=?, memMail=?, memAddr=?, memPhone=?,memIntr=?,memPhoto=?  WHERE memId=?";
	private static final String GET_CLUBID = "SELECT  clubId,memId FROM club_member_list where memId=?";

	public void insert(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memVO.getMemberId());
			pstmt.setString(2, memVO.getMemName());
			pstmt.setString(3, memVO.getMemNickN());
			pstmt.setString(4, memVO.getMemPwd());
			pstmt.setDate(5, memVO.getMemBirthday());
			pstmt.setString(6, memVO.getMemMail());
			pstmt.setString(7, memVO.getMemAddr());
			pstmt.setString(8, memVO.getMemPhone());
			pstmt.setString(9, memVO.getMemIntr());
			pstmt.setString(10, memVO.getMemPhoto());



			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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

	public void update(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memVO.getMemberId());
			pstmt.setString(2, memVO.getMemName());
			pstmt.setString(3, memVO.getMemNickN());
			pstmt.setString(4, memVO.getMemPwd());
			pstmt.setDate(5, memVO.getMemBirthday());
			pstmt.setString(6, memVO.getMemMail());
			pstmt.setString(7, memVO.getMemAddr());
			pstmt.setString(8, memVO.getMemPhone());
			pstmt.setString(9, memVO.getMemIntr());
			pstmt.setString(10, memVO.getMemPhoto());
			pstmt.setInt(11, memVO.getMemId());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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

	public void delete(Integer memId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, memId);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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

	public MemVO findByPrimaryKey(Integer memId) {

		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, memId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setMemId(rs.getInt("memId"));
				memVO.setMemberId(rs.getString("memberId"));
				memVO.setMemName(rs.getString("memName"));
				memVO.setMemNickN(rs.getString("memNickN"));
				memVO.setMemPwd(rs.getString("memPwd"));
				memVO.setMemBirthday(rs.getDate("memBirthday"));
				memVO.setMemMail(rs.getString("memMail"));
				memVO.setMemAddr(rs.getString("memAddr"));
				memVO.setMemPhone(rs.getString("memPhone"));
				memVO.setMemIntr(rs.getString("memIntr"));
				memVO.setMemPhoto(rs.getString("memPhoto"));
				memVO.setMemStatus(rs.getString("memStatus"));
				memVO.setMemRole(rs.getString("memRole"));

			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
		return memVO;

	}

	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memVO 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setMemId(rs.getInt("memId"));
				memVO.setMemberId(rs.getString("memberId"));
				memVO.setMemName(rs.getString("memName"));
				memVO.setMemNickN(rs.getString("memNickN"));
				memVO.setMemPwd(rs.getString("memPwd"));
				memVO.setMemBirthday(rs.getDate("memBirthday"));
				memVO.setMemMail(rs.getString("memMail"));
				memVO.setMemAddr(rs.getString("memAddr"));
				memVO.setMemPhone(rs.getString("memPhone"));
				memVO.setMemIntr(rs.getString("memIntr"));
				memVO.setMemPhoto(rs.getString("memPhoto"));
				memVO.setMemStatus(rs.getString("memStatus"));
				memVO.setMemRole(rs.getString("memRole"));
				list.add(memVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	
	public MemVO getClubId(Integer memId) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_CLUBID);

			pstmt.setInt(1, memId);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				// memVO 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setClubId(rs.getInt("ClubId"));
				memVO.setMemId(rs.getInt("memId"));
				

			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return memVO;
	}

	public static void main(String[] args) throws Exception {

		MemJDBCDAO dao = new MemJDBCDAO();

//		 MemVO memVO1=new MemVO();
//		 memVO1.setMemberId("eeit970307");
//		 memVO1.setMemName("王立藍");
//		 memVO1.setMemNickN("職業哈星");
//		 memVO1.setMemPwd("eeit970307");
//		 memVO1.setMemBirthday(java.sql.Date.valueOf("1978-05-22"));
//		 memVO1.setMemMail("eeit9703@gmail.com");
//		 memVO1.setMemAddr("你家");
//		 memVO1.setMemPhone("0912-345-678");
//		 memVO1.setMemIntr("我超猛");
//		 memVO1.setMemPhoto(new FileInputStream(new File("C:\\Users\\Student\\Downloads\\番薯島小霸王.jpg")));		 
//		 dao.insert(memVO1);

		 MemVO memVO2=new MemVO();
		 memVO2.setMemberId("eeit970307");
		 memVO2.setMemName("王立綠");
		 memVO2.setMemNickN("業餘哈星");
		 memVO2.setMemPwd("GG123");
		 memVO2.setMemBirthday(java.sql.Date.valueOf("1990-11-22"));
		 memVO2.setMemMail("eeit970302@gmail.com");
		 memVO2.setMemAddr("我家");
		 memVO2.setMemPhone("0987-654-321");
		 memVO2.setMemIntr("我超爛");
		 memVO2.setMemPhoto("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");
		 memVO2.setMemId(7);
		 dao.update(memVO2);
//
//		dao.delete(5);
//
//		MemVO memVO3 = dao.findByPrimaryKey(1);
//		System.out.print(memVO3.getMemId() + ",");
//		System.out.print(memVO3.getMemberId() + ",");
//		System.out.print(memVO3.getMemName() + ",");
//		System.out.print(memVO3.getMemNickN() + ",");
//		System.out.print(memVO3.getMemPwd()+",");
//		System.out.print(memVO3.getMemBirthday() + ",");
//		System.out.print(memVO3.getMemMail() + ",");
//		System.out.print(memVO3.getMemAddr() + ",");
//		System.out.print(memVO3.getMemPhone() + ",");
//		System.out.print(memVO3.getMemIntr()+",");
//		System.out.print(memVO3.getMemPhoto()+",");
//		System.out.print(memVO3.getMemStatus()+",");
//		System.out.println(memVO3.getMemRole()+",");
//		System.out.println("---------------------");
//
//		List<MemVO> list = dao.getAll();
//		for (MemVO aMem : list) {
//			System.out.print(aMem.getMemId() + ",");
//			System.out.print(aMem.getMemberId() + ",");
//			System.out.print(aMem.getMemName() + ",");
//			System.out.print(aMem.getMemNickN() + ",");
//			System.out.print(aMem.getMemPwd()+",");
//			System.out.print(aMem.getMemBirthday() + ",");
//			System.out.print(aMem.getMemMail() + ",");
//			System.out.print(aMem.getMemAddr() + ",");
//			System.out.print(aMem.getMemPhone() + ",");
//			System.out.print(aMem.getMemIntr()+",");
//			System.out.print(aMem.getMemPhoto()+",");
//			System.out.print(aMem.getMemStatus()+",");
//			System.out.println(aMem.getMemRole()+",");
//			System.out.println();
//
//		}
		MemVO memVO4 = dao.getClubId(1);

			System.out.print(memVO4.getMemId() + ",");
			System.out.print(memVO4.getClubId() + ",");

			System.out.println();

		
	}
}
