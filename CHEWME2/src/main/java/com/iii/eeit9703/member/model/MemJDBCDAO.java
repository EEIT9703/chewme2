package com.iii.eeit9703.member.model;

import java.sql.*;
import java.util.*;



public class MemJDBCDAO {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String INSERT_STMT = "INSERT INTO members (memberId,mName,mNickN,mPwd,mBirthday,mMail,mAddr,mPhone,mIntr,mphoto,mstatus,mrole) VALUES(?,?,?,?,?,?,?,?,?,?,'正常','一般會員')";
	private static final String GET_ALL_STMT = "SELECT  memberId,mName,mNickN,mPwd,mBirthday,mMail,mAddr,mPhone,mIntr,mphoto,mstatus,mrole FROM members order by memberId";
	private static final String GET_ONE_STMT = "SELECT  memberId,mName,mNickN,mPwd,mBirthday,mMail,mAddr,mPhone,mIntr,mphoto,mstatus,mrole FROM members WHERE memberId=?";
	private static final String DELETE = "DELETE FROM members WHERE memberId=?";
	private static final String UPDATE = "UPDATE members set mName=?,mNickN=?, mPwd=?, mBirthday=?, mMail=?, mAddr=?, mPhone=?,mIntr=?,mphoto=?,mstatus=?,mrole=?  WHERE memberId=?";

	public void insert(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memVO.getmemberId());
			pstmt.setString(2, memVO.getmName());
			pstmt.setString(3, memVO.getmNickN());
			pstmt.setString(4, memVO.getmPwd());
			pstmt.setDate(5, memVO.getmBirthday());
			pstmt.setString(6, memVO.getmMail());
			pstmt.setString(7, memVO.getmAddr());
			pstmt.setString(8, memVO.getmPhone());
			pstmt.setString(9, memVO.getmIntr());

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

			pstmt.setString(1, memVO.getmName());
			pstmt.setString(2, memVO.getmNickN());
			pstmt.setString(3, memVO.getmPwd());
			pstmt.setDate(4, memVO.getmBirthday());
			pstmt.setString(5, memVO.getmMail());
			pstmt.setString(6, memVO.getmAddr());
			pstmt.setString(7, memVO.getmPhone());
			pstmt.setString(8, memVO.getmIntr());
			pstmt.setString(9, memVO.getmemberId());

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

	public void delete(String memberId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, memberId);

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

	public MemVO findByPrimaryKey(String memberId) {

		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setmemberId(rs.getString("memberId"));
				memVO.setmName(rs.getString("mName"));
				memVO.setmNickN(rs.getString("mNickN"));
				memVO.setmPwd(rs.getString("mPwd"));
				memVO.setmBirthday(rs.getDate("mBirthday"));
				memVO.setmMail(rs.getString("mMail"));
				memVO.setmAddr(rs.getString("mAddr"));
				memVO.setmPhone(rs.getString("mPhone"));
				memVO.setmIntr(rs.getString("mIntr"));

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
				memVO.setmemberId(rs.getString("memberId"));
				memVO.setmName(rs.getString("mName"));
				memVO.setmNickN(rs.getString("mNickN"));
				memVO.setmPwd(rs.getString("mPwd"));
				memVO.setmBirthday(rs.getDate("mBirthday"));
				memVO.setmMail(rs.getString("mMail"));
				memVO.setmAddr(rs.getString("mAddr"));
				memVO.setmPhone(rs.getString("mPhone"));
				memVO.setmIntr(rs.getString("mIntr"));
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

	public static void main(String[] args) {

		MemJDBCDAO dao = new MemJDBCDAO();

		 MemVO memVO1=new MemVO();
		 memVO1.setmemberId("eeit970307");
		 memVO1.setmName("王立藍");
		 memVO1.setmNickN("職業哈星");
		 memVO1.setmPwd("eeit97032017");
		 memVO1.setmBirthday(java.sql.Date.valueOf("1978-05-22"));
		 memVO1.setmMail("eeit9703@gmail.com");
		 memVO1.setmAddr("你家");
		 memVO1.setmPhone("0912-345-678");
		 memVO1.setmIntr("我超猛");
		 
		 
		 dao.insert(memVO1);

//		 MemVO memVO2=new MemVO();
//		 memVO2.setmemberId("eeit970301");
//		 memVO2.setmName("王立綠");
//		 memVO2.setmNickN("業餘哈星");
//		 memVO2.setmPwd("eeit9703022017");
//		 memVO2.setmBirthday(java.sql.Date.valueOf("1990-11-22"));
//		 memVO2.setmMail("eeit970302@gmail.com");
//		 memVO2.setmAddr("我家");
//		 memVO2.setmPhone("0987-654-321");
//		 memVO2.setmIntr("我超爛");
//		 dao.update(memVO2);
//
//		dao.delete("eeit970301");
//
//		MemVO memVO3 = dao.findByPrimaryKey("eeit970301");
//		System.out.print(memVO3.getmemberId() + ",");
//		System.out.print(memVO3.getmName() + ",");
//		System.out.print(memVO3.getmNickN() + ",");
//		System.out.print(memVO3.getmPwd() + ",");
//		System.out.print(memVO3.getmBirthday() + ",");
//		System.out.print(memVO3.getmMail() + ",");
//		System.out.print(memVO3.getmAddr() + ",");
//		System.out.print(memVO3.getmPhone() + ",");
//		System.out.print(memVO3.getmIntr());
//		System.out.println("---------------------");
//
//		List<MemVO> list = dao.getAll();
//		for (MemVO aMem : list) {
//			System.out.print(aMem.getmemberId() + ",");
//			System.out.print(aMem.getmName() + ",");
//			System.out.print(aMem.getmNickN() + ",");
//			System.out.print(aMem.getmPwd()+",");
//			System.out.print(aMem.getmBirthday() + ",");
//			System.out.print(aMem.getmMail() + ",");
//			System.out.print(aMem.getmAddr() + ",");
//			System.out.print(aMem.getmPhone() + ",");
//			System.out.print(aMem.getmIntr());
//			System.out.println();
//
//		}
	}
}
