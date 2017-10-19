package com.iii.eeit9703.member.model;

import java.util.*;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemJNDIDAO implements MemDAO_interface {
	private static DataSource ds = null;
	static {//系統load進來時就做一次,且只做一次,除非系統關閉,否則一直存在
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdsbc/CMDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO members (memberId,mName,mNickN,mPwd,mBirthday,mMail,mAddr,mPhone,mIntr,mphoto,mstatus,mrole) VALUES(?,?,?,?,?,?,?,?,?,?,'正常','一般會員')";
	private static final String GET_ALL_STMT = "SELECT  memberId,mName,mNickN,mPwd,mBirthday,mMail,mAddr,mPhone,mIntr,mphoto,mstatus,mrole FROM members order by memberId";
	private static final String GET_ONE_STMT = "SELECT  memberId,mName,mNickN,mPwd,mBirthday,mMail,mAddr,mPhone,mIntr,mphoto,mstatus,mrole FROM members WHERE memberId=?";
	private static final String DELETE = "DELETE FROM members WHERE memberId=?";
	private static final String UPDATE = "UPDATE members set mName=?,mNickN=?, mPwd=?, mBirthday=?, mMail=?, mAddr=?, mPhone=?,mIntr=?,mphoto=?,mstatus=?,mrole=?  WHERE memberId=?";

	@Override
	public void insert(MemVO memVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con = ds.getConnection();
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

	@Override
	public void update(MemVO memVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con = ds.getConnection();
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

	@Override
	public void delete(String memberId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, memberId);

			pstmt.executeUpdate();

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

	@Override
	public MemVO findByPrimaryKey(String memberId) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
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

	@Override
	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
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

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		}finally {
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

}
