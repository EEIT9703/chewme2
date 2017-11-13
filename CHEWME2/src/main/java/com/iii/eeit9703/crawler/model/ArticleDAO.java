package com.iii.eeit9703.crawler.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ArticleDAO implements ArticleDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String get_one = "select articleID, memPhoto, memId, a.attractionID, "
			+ "contents from attractions a join ArticleShare b "
			+ "on a.attractionID = b.attractionID where b.attractionID = ?";

	@Override
	public void insert(ArticleVO articleVO) {

	}

	@Override
	public void update(ArticleVO articleVO) {

	}

	@Override
	public void delete(Integer articleID) {

	}

	@Override
	public ArrayList<ArticleVO> findByPK(Integer attractionID) {

		ArrayList<ArticleVO> list = new ArrayList<ArticleVO>();
		
		ArticleVO articleVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(get_one);

			pstmt.setInt(1, attractionID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				articleVO = new ArticleVO();
				articleVO.setArticleID(rs.getInt("articleID"));
				articleVO.setMemId(rs.getInt("memId"));
				articleVO.setAttractionID(rs.getInt("attractionID"));
				articleVO.setContents(rs.getString("contents"));
				articleVO.setMemPhoto(rs.getString("memPhoto"));
				list.add(articleVO);
			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ArticleVO> getAll() {

		
		return null;
	}
}
