package com.iii.eeit9703.crawler.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AttrDAO implements AttrDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String GET_ALL = "select attractionID,name,county,type,address,tel,intro from Attractions";
	private static final String GET_ONE = "select attractionID, name, county, type, address, tel, intro from Attractions where attractionID=?";
	private static final String INSERT = "insert into Attractions (name, county, type, address, tel, intro) values (?,?,?,?,?,?)";
	private static final String UPDATE = "update Attractions set name=?, county=?, type=?, address=?, tel=?, intro=? where attractionID=?";
	private static final String DELETE = "delete from Attractions where attractionID=?";

	//新增
	@Override
	public void insert(AttrVO attrVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, attrVO.getName());
			pstmt.setString(2, attrVO.getCounty());
			pstmt.setString(3, attrVO.getType());
			pstmt.setString(4, attrVO.getAddress());
			pstmt.setString(5, attrVO.getTel());
			pstmt.setString(6, attrVO.getIntro());
			pstmt.executeUpdate();

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

	//修改
	@Override
	public void update(AttrVO attrVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, attrVO.getName());
			pstmt.setString(2, attrVO.getCounty());
			pstmt.setString(3, attrVO.getType());
			pstmt.setString(4, attrVO.getAddress());
			pstmt.setString(5, attrVO.getTel());
			pstmt.setString(6, attrVO.getIntro());
			pstmt.setInt(7, attrVO.getAttractionID());
			pstmt.executeUpdate();

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

	//刪除
	@Override
	public void delete(Integer attractionID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, attractionID);
			pstmt.executeUpdate();

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

	//查單筆
	@Override
	public AttrVO findByPK(Integer attractionID) {

		AttrVO attrvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
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

			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return attrvo;
	}

	//查全部
	@Override
	public List<AttrVO> getAll() {
		List<AttrVO> list = new ArrayList<AttrVO>();
		AttrVO attrvo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
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

			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
