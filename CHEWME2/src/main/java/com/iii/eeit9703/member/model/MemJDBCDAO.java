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
	private static final String UPDATE = "UPDATE members set memberId=? memName=?,memNickN=?, memPwd=?, memBirthday=?, memMail=?, memAddr=?, memPhone=?,memIntr=?,memPhoto=?  WHERE memId=?";

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
			pstmt.setBinaryStream(10, memVO.getMemPhoto());



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
			pstmt.setBinaryStream(10, memVO.getMemPhoto());
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
				memVO.setMemPhoto(rs.getBinaryStream("memPhoto"));

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
				memVO.setMemPhoto(rs.getBinaryStream("memPhoto"));
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

	public static void main(String[] args) throws Exception {

		MemJDBCDAO dao = new MemJDBCDAO();

		 MemVO memVO1=new MemVO();
		 memVO1.setMemberId("eeit970307");
		 memVO1.setMemName("王立藍");
		 memVO1.setMemNickN("職業哈星");
		 memVO1.setMemPwd("eeit970307");
		 memVO1.setMemBirthday(java.sql.Date.valueOf("1978-05-22"));
		 memVO1.setMemMail("eeit9703@gmail.com");
		 memVO1.setMemAddr("你家");
		 memVO1.setMemPhone("0912-345-678");
		 memVO1.setMemIntr("我超猛");
		 memVO1.setMemPhoto(new FileInputStream(new File("C:\\Users\\Student\\Downloads\\番薯島小霸王.jpg")));
		 
		 dao.insert(memVO1);

//		 MemVO memVO2=new MemVO();
//		 memVO2.setMemberId("eeit970308");
//		 memVO2.setMemName("王立綠");
//		 memVO2.setMemNickN("業餘哈星");
//		 memVO2.setMemPwd("GG123");
//		 memVO2.setMemBirthday(java.sql.Date.valueOf("1990-11-22"));
//		 memVO2.setMemMail("eeit970302@gmail.com");
//		 memVO2.setMemAddr("我家");
//		 memVO2.setMemPhone("0987-654-321");
//		 memVO2.setMemIntr("我超爛");
//		 memVO2.setMemPhoto(new FileInputStream(new File("C:\\Users\\Student\\Downloads\\番薯島小霸王.jpg")));
//		 memVO2.setMemId(7);
//		 dao.update(memVO2);
//
//		dao.delete(1);
//
//		MemVO memVO3 = dao.findByPrimaryKey(7);
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
//			System.out.println();
//
//		}
	}
}
