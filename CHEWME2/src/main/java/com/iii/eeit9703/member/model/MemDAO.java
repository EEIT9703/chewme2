package com.iii.eeit9703.member.model;

import java.util.*;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemDAO implements MemDAO_interface {
	private static DataSource ds = null;
	static {//系統load進來時就做一次,且只做一次,除非系統關閉,否則一直存在
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdsbc/CMDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO members (memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memPhoto,memStatus,memRole) VALUES(?,?,?,?,?,?,?,?,?,?,'正常','一般會員')";
	private static final String GET_ALL_STMT = "SELECT  memId,memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memPhoto,memStatus,memRole FROM members order by memId";
	private static final String GET_ONE_STMT = "SELECT  memId,memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memPhoto,memStatus,memRole FROM members WHERE memId=?";
	private static final String DELETE = "DELETE FROM members WHERE memId=?";
	private static final String UPDATE = "UPDATE members set memberId=? memName=?,memNickN=?, memPwd=?, memBirthday=?, memMail=?, memAddr=?, memPhone=?,memIntr=?,memPhoto=?  WHERE memId=?";

	@Override
	public void insert(MemVO memVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con = ds.getConnection();
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
	public void delete(Integer memId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, memId);

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
	public MemVO findByPrimaryKey(Integer memId) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
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
