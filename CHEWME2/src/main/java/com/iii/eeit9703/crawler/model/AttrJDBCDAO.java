package com.iii.eeit9703.crawler.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class AttrJDBCDAO implements AttrDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
	String userID = "sa";
	String password = "P@ssw0rd";

	private static final String GET_ALL = "select attractionID,name,county,type,address,tel,intro from Attractions";
	private static final String GET_ONE = "select attractionID, name, county, type, address, tel, intro, image from Attractions where attractionID=?";
	private static final String INSERT = "insert into Attractions (name, county, type, address, tel, intro, image) values (?,?,?,?,?,?,?)";
	private static final String UPDATE = "update Attractions set county=? where attractionID=?";
	private static final String DELETE = "delete from Attractions where attractionID=?";

	@Override
	public void insert(AttrVO attrvo, InputStream is) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userID, password);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, "�Ӿ|�հ�a����");
			pstmt.setString(2, "�Ὤ��");
			pstmt.setString(3, "���I");
			pstmt.setString(4, "�Ὤ���q�L�m�I�@���I�@291��");
			pstmt.setString(5, " 03 862 1100");
			pstmt.setString(6, "�Ӿ|�հ�a����O�x�W�ĥ|�y���ߪ���a����A�e������v�ɴ����ߤ������Ӿ|�հ�ߤ���C");
			pstmt.setBinaryStream(7, is);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void update(AttrVO attrvo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userID, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, "������");
			pstmt.setInt(2, 3);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void delete(Integer attractionID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userID, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, attractionID);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public AttrVO findByPK(Integer attractionID) {

		AttrVO attrvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userID, password);
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setInt(1, attractionID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				attrvo = new AttrVO();
				attrvo.setAttractionID(rs.getInt("attractionID"));
				attrvo.setName(rs.getString("name"));
				attrvo.setCounty(rs.getString("county"));
				attrvo.setType(rs.getString("type"));
				attrvo.setAddress(rs.getString("address"));
				attrvo.setTel(rs.getString("tel"));
			    attrvo.setIntro(rs.getString("intro"));

				System.out.print(rs.getInt("attractionID") + ",");
				System.out.print(rs.getString("name") + ",");
				System.out.print(rs.getString("county") + ",");
				System.out.print(rs.getString("type") + ",");
				System.out.print(rs.getString("address") + ",");
				System.out.print(rs.getString("tel"));
			    System.out.println(rs.getString("intro"));
				System.out.println();
			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return attrvo;
	}

	@Override
	public List<AttrVO> getAll() {
		List<AttrVO> list = new ArrayList<AttrVO>();
		AttrVO attrvo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userID, password);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				attrvo = new AttrVO();
				attrvo.setAttractionID(rs.getInt("attractionID"));
				attrvo.setName(rs.getString("name"));
				attrvo.setCounty(rs.getString("county"));
				attrvo.setType(rs.getString("type"));
				attrvo.setAddress(rs.getString("address"));
				attrvo.setTel(rs.getString("tel"));
				attrvo.setIntro(rs.getString("intro"));
				list.add(attrvo);

				System.out.print(rs.getInt("attractionID") + ",");
				System.out.print(rs.getString("name") + ",");
				System.out.print(rs.getString("county") + ",");
				System.out.print(rs.getString("type") + ",");
				System.out.print(rs.getString("address") + ",");
				System.out.print(rs.getString("tel") + ",");
				System.out.print(rs.getString("intro"));
				System.out.println();
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {

		AttrJDBCDAO dao = new AttrJDBCDAO();
		 //AttrVO attrvo1 = new AttrVO();
		 dao.getAll();
		 //dao.insert(attrvo1);
		// dao.update(attrvo1);
		// dao.delete(3);
		//dao.findByPK(3);
	}

}
