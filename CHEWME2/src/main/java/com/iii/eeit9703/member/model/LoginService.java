package com.iii.eeit9703.member.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;
import javax.xml.bind.DatatypeConverter;

public class LoginService implements LoginDAO {
	static private List<MemVO> memberList = new ArrayList<MemVO>();
	private DataSource ds = null;

	public LoginService() throws NamingException, SQLException {
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		if (memberList.isEmpty()) {
			populateMemberList();
		}
	}

	@Override
	public void populateMemberList() throws SQLException {
		String sql = "SELECT * FROM members";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String memberId = rs.getString("memberId").trim();
				String mName = rs.getString("mName").trim();
				String mNickN = rs.getString("mNickN").trim();
				String mPwd = rs.getString("mPwd").trim();
				java.sql.Date mBirthday = rs.getDate("mBirthday");
				String mMail = rs.getString("mMail").trim();
				String mAddr = rs.getString("mAddr").trim();
				String mPhone = rs.getString("mPhone").trim();
				String mIntr = rs.getString("mIntr").trim();
				MemVO mv = new MemVO(memberId, mName, mNickN, mPwd, mBirthday, mMail, mAddr, mPhone, mIntr);
				memberList.add(mv);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

	}

	@Override
	public MemVO checkIDPassword(String userId, String password) {
		for(MemVO mv:memberList){
			if(mv.getmemberId().trim().equals(userId.trim())){
				String encodePassword=DatatypeConverter.printBase64Binary(password.getBytes());
				//String encrypedString=GlobalService.encryptString(password.trim());
				//String pswd=GlobalService.getMD5Encoding(encrypedString);
				String mvpswd=mv.getmPwd().trim();
				if(mvpswd.equals(encodePassword)){
					return mv;
				}
			}
		}
		return null;
	}

	@Override
	public List<MemVO> getMemberList() {

		return memberList;
	}

	@Override
	public void addMem(MemVO mv) {
		memberList.add(mv);

	}

}
