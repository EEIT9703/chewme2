package com.iii.eeit9703.club.model.jdbc.clubphoto;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.iii.eeit9703.club.model.ClubPhotoDAOI;
import com.iii.eeit9703.club.model.ClubPhotoVO;

public class ClubPhotoJDBCDAO implements ClubPhotoDAOI {
	private static DataSource ds = null;
	static Connection con = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	static {

		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			String url = "jdbc:sqlserver://localhost:1433;DatabaseName=CMDB";
			String userid = "sa";
			String passwd = "P@ssw0rd";

			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		}
	}

	private static final String GET_ALL = "select photoId,clubId,name,photo from club_photo";
	private static final String GET_PHOTO_BY_PHOTOID = "select clubId, name, photo from club_photo where photoId=?";
	private static final String GET_PHOTOLIST_BY_CLUBID = "select photo from club_photo where clubId=?";
	private static final String INSERT = "insert into club_photo (clubId, name, photo) values (?,?,?)";
	private static final String UPDATE = "update club_photo set clubId=?, name=?, photo=? where photoID=?";
	private static final String UPDATE_BY_CLUBID = "update club_photo set name=?, photo=? where clubID=?";
	private static final String DELETE = "delete from club_photo where clubId=?";

	// �s�W
	@Override
	public void insert(ClubPhotoVO clubPicVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			System.out.println("start to insert the Img");
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			// pstmt.setInt(1, clubPicVO.getPhotoId());
			pstmt.setInt(1, clubPicVO.getClubId());
			pstmt.setString(2, clubPicVO.getName());
			pstmt.setBinaryStream(3, clubPicVO.getPhoto());
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

	// �ק�
	@Override
	public void update(ClubPhotoVO clubPicVO, InputStream is) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, clubPicVO.getPhotoId());
			pstmt.setInt(2, clubPicVO.getClubId());
			pstmt.setString(3, clubPicVO.getName());
			pstmt.setBinaryStream(4, is);
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

	@Override
	public void updateByClubId(ClubPhotoVO clubPicVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		System.out.println("the clubid is"+clubPicVO.getClubId());
		if (!checkClubId(clubPicVO.getClubId())) {
			System.out.println("change to insert the Img");
			insert(clubPicVO);
		} else {
			try {
				System.out.println("start to update the Img");
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_BY_CLUBID);

				// pstmt.setInt(1, clubPicVO.getPhotoId());
				pstmt.setString(1, clubPicVO.getName());
				pstmt.setBinaryStream(2, clubPicVO.getPhoto());
				pstmt.setInt(3, clubPicVO.getClubId());
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
	}

	// �R��
	@Override
	public void delete(Integer photoId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, photoId);
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

	// �d�浧

	public InputStream findPhotoById(Integer photoId) {

		return null;
	}

	@Override
	public ClubPhotoVO findByPrimaryKey(Integer photoId) {

		ClubPhotoVO clubPicVO = null;
		// Connection con = null;
		// PreparedStatement pstmt = null;
		// ResultSet rs = null;

		try {
			// con = ds.getConnection();
			pstmt = con.prepareStatement(GET_PHOTO_BY_PHOTOID);

			pstmt.setInt(1, photoId);
			rs = pstmt.executeQuery();

			System.out.print("in the findbyphotoid");
			while (rs.next()) {
				clubPicVO = new ClubPhotoVO();
				clubPicVO.setClubId(rs.getInt("clubId"));
				clubPicVO.setName(rs.getString("name"));
				InputStream is = rs.getBinaryStream("photo");

				int len = 100;
				byte[] buffer = new byte[len];
				int count;
				try {
					while ((count = is.read(buffer)) != -1) {

						System.out.println("in the while");
						// fos2.write(buffer, 0, len);
						System.out.println(new String(buffer, "UTf-8"));
					}
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("--------------------------");
			}
			System.out.print("out of the findbyphotoid");

			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clubPicVO;
	}

	// �d����
	@Override
	public List<ClubPhotoVO> getClubPhotoByClubId(Integer clubId) {
		List<ClubPhotoVO> list = new ArrayList<ClubPhotoVO>();
		ClubPhotoVO clubPicVO = null;

		// Connection con = null;
		// PreparedStatement pstmt = null;
		// ResultSet rs = null;
		try {
			// con = ds.getConnection();

			pstmt = con.prepareStatement(GET_PHOTOLIST_BY_CLUBID);
			pstmt.setInt(1, clubId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				clubPicVO = new ClubPhotoVO();
				clubPicVO.setPhoto(rs.getBinaryStream("photo"));
				// clubPicVO.setName(rs.getString("name"));
				// clubPicVO.setPhotoId(rs.getInt("photoId"));
			}
			list.add(clubPicVO);
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	private boolean checkClubId(Integer clubId) {
		List<Integer> list = new ArrayList<Integer>();
		// ClubPhotoVO clubPicVO = null;

		 Connection con = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		try {
			// con = ds.getConnection();
			con = ds.getConnection();
			//pstmt = con.prepareStatement(INSERT);
			pstmt = con.prepareStatement("select clubId from club_photo");
			// pstmt.setInt(1, clubId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Integer p_clubId;
				// clubPicVO = new ClubPhotoVO();
				// clubPicVO.setPhoto(rs.getBinaryStream("photo"));
				// clubPicVO.setName(rs.getString("name"));
				// clubPicVO.setPhotoId(rs.getInt("photoId"));
				p_clubId = rs.getInt("clubId");
				list.add(p_clubId);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		boolean have;
		have = (list.contains(clubId)) ? true : false;
		System.out.println("list is "+list);
		System.out.println("have is "+have);
		return have;
	}

	public static void main(String[] args) {

		ClubPhotoJDBCDAO chd = new ClubPhotoJDBCDAO();
		// List<ClubPhotoVO> list = chd.getClubPhotoByClubId(4);
		ClubPhotoVO photo = chd.findByPrimaryKey(1);

	}

}
