package com.iii.eeit9703.club.model.jdbcDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iii.eeit9703.club.model.ClubVO;



public class ClubJdbcDAO implements ClubJdbcDAOI{
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=EEIT9703test";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String INSERT_STMT = "INSERT INTO clubs (clubID,clubName,managerId,location,brief,refURL,vistors,vistorsInMonth,addr) VALUES(?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT  clubID,clubName,managerId,location,brief,refURL,vistors,vistorsInMonth,addr FROM clubs order by clubID";
	private static final String GET_ONE_STMT = "SELECT  clubID,clubName,managerId,location,brief,refURL,vistors,vistorsInMonth,addr FROM clubs WHERE clubID=?";
	private static final String DELETE = "DELETE FROM clubs WHERE clubID=?";
	private static final String UPDATE = "UPDATE clubs set clubName=?,managerId=?, location=?, brief=?, refURL=?, vistors=?, vistorsInMonth=?,addr=?  WHERE clubID=?";

	public void insert(ClubVO clubVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, clubVO.getClubId());
			pstmt.setString(2, clubVO.getClubName());
			pstmt.setInt(3, clubVO.getManagerId());
			pstmt.setInt(4, clubVO.getLocationId());
			pstmt.setString(5, clubVO.getBrief());
			pstmt.setString(6, clubVO.getRefURL());
			pstmt.setInt(7, clubVO.getVistors());
			pstmt.setInt(8, clubVO.getVistorsInMonth());
			pstmt.setString(9, clubVO.getAddr());

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

	public void update(ClubVO clubVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, clubVO.getClubName());
			pstmt.setInt(2, clubVO.getManagerId());
			pstmt.setInt(3, clubVO.getLocationId());
			pstmt.setString(4, clubVO.getBrief());
			pstmt.setString(5, clubVO.getRefURL());
			pstmt.setInt(6, clubVO.getVistors());
			pstmt.setInt(7, clubVO.getVistorsInMonth());
			pstmt.setString(8, clubVO.getAddr());
			pstmt.setInt(9, clubVO.getClubId());

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

	public void delete(Integer clubId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, clubId);

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

	public ClubVO findByPrimaryKey(String clubId) {

		ClubVO clubVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, clubId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				clubVO = new ClubVO();
				clubVO.setClubId(rs.getInt("clubID"));
				clubVO.setClubName(rs.getString("clubName"));
				clubVO.setManagerId(rs.getInt("managerId"));
				clubVO.setLocationId(rs.getInt("locationId"));
				clubVO.setBrief(rs.getString("brief"));
				clubVO.setRefURL(rs.getString("refURL"));
				clubVO.setVistors(rs.getInt("vistors"));
				clubVO.setVistorsInMonth(rs.getInt("vistorsInMonth"));
				clubVO.setAddr(rs.getString("addr"));

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
		return clubVO;

	}

	public List<ClubVO> getAll() {
		List<ClubVO> list = new ArrayList<ClubVO>();
		ClubVO clubVO = null;

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
				clubVO = new ClubVO();
				clubVO.setClubId(rs.getInt("clubID"));
				clubVO.setClubName(rs.getString("clubName"));
				clubVO.setManagerId(rs.getInt("managerId"));
				clubVO.setLocationId(rs.getInt("locationId"));
				clubVO.setBrief(rs.getString("brief"));
				clubVO.setRefURL(rs.getString("refURL"));
				clubVO.setVistors(rs.getInt("vistors"));
				clubVO.setVistorsInMonth(rs.getInt("vistorsInMonth"));
				clubVO.setAddr(rs.getString("addr"));
				list.add(clubVO); // Store the row in the list
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

		ClubJdbcDAO dao = new ClubJdbcDAO();

		 ClubVO clubVO1=new ClubVO();
		 clubVO1.setClubId(Integer.parseInt("eeit970302"));
		 clubVO1.setClubName("王立藍");
		 clubVO1.setManagerId(Integer.parseInt("職業哈星"));
		 clubVO1.setLocationId(Integer.parseInt("eeit97032017"));
		 clubVO1.setBrief("38");
		 clubVO1.setRefURL("eeit9703@gmail.com");
		 clubVO1.setVistors(Integer.parseInt("你家"));
		 clubVO1.setVistorsInMonth(Integer.parseInt("0912-345-678"));
		 clubVO1.setAddr("我超猛");
		 dao.insert(clubVO1);

		 ClubVO clubVO2=new ClubVO();
		 clubVO2.setClubId(Integer.parseInt("eeit970301"));
		 clubVO2.setClubName("王立綠");
		 clubVO2.setManagerId(Integer.parseInt("業餘哈星"));
		 clubVO2.setLocationId(Integer.parseInt("eeit9703022017"));
		 clubVO2.setBrief("28");
		 clubVO2.setRefURL("eeit970302@gmail.com");
		 clubVO2.setVistors(Integer.parseInt("我家"));
		 clubVO2.setVistorsInMonth(Integer.parseInt("0987-654-321"));
		 clubVO2.setAddr("我超爛");
		 dao.update(clubVO2);

		dao.delete(Integer.parseInt("eeit970301"));

		ClubVO memVO3 = dao.findByPrimaryKey("eeit970301");
		System.out.print(memVO3.getClubId() + ",");
		System.out.print(memVO3.getClubName() + ",");
		System.out.print(memVO3.getManagerId() + ",");
		System.out.print(memVO3.getLocationId() + ",");
		System.out.print(memVO3.getBrief() + ",");
		System.out.print(memVO3.getRefURL() + ",");
		System.out.print(memVO3.getVistors() + ",");
		System.out.print(memVO3.getVistorsInMonth() + ",");
		System.out.print(memVO3.getAddr());
		System.out.println("---------------------");

		List<ClubVO> list = dao.getAll();
		for (ClubVO aMem : list) {
			System.out.print(aMem.getClubId() + ",");
			System.out.print(aMem.getClubName() + ",");
			System.out.print(aMem.getManagerId() + ",");
			System.out.print(aMem.getLocationId()+",");
			System.out.print(aMem.getBrief() + ",");
			System.out.print(aMem.getRefURL() + ",");
			System.out.print(aMem.getVistors() + ",");
			System.out.print(aMem.getVistorsInMonth() + ",");
			System.out.print(aMem.getAddr());
			System.out.println();

		}
	}

}
