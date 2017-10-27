package com.iii.eeit9703.member.model;

import java.io.InputStream;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

public class MemService {
	private MemDAO_interface dao;

	public MemService() {
		dao = new MemDAO();
	}

	public MemVO addMem(String memberId, String memName, String memNickN, String memPwd, java.sql.Date memBirthday,
			String memMail, String memAddr, String memPhone, String memIntr, String memPhoto) {
		MemVO memVO = new MemVO();
		memVO.setMemberId(memberId);
		memVO.setMemName(memName);
		memVO.setMemNickN(memNickN);
		memVO.setMemPwd(memPwd);
		memVO.setMemBirthday(memBirthday);
		memVO.setMemMail(memMail);
		memVO.setMemAddr(memAddr);
		memVO.setMemPhone(memPhone);
		memVO.setMemIntr(memIntr);
		memVO.setMemPhoto(memPhoto);
		dao.insert(memVO);

		return memVO;
	}

	public MemVO getOneMem(Integer memId) {

		return dao.findByPrimaryKey(memId);
	}

	public List<MemVO> getAll() {//取出所有會員資料放入List裡
		return dao.getAll();
	}

	public MemVO checkIDPassword(String userId, String password) {//檢查會員登入時的帳號密碼
		MemService memSvc = new MemService();
		for (MemVO memVO : memSvc.getAll()) {//將memSvc收集到的會員資料放入memVO裡
			if (memVO.getMemberId().trim().equals(userId.trim())) {//從memVO的會員資料找出memberId欄位跟userId比對
				//String encodePassword = DatatypeConverter.printBase64Binary(password.getBytes());
				// String encrypedString=GlobalService.encryptString(password.trim());
				// String pswd=GlobalService.getMD5Encoding(encrypedString);
				String mvpwd = memVO.getMemPwd().trim();
				if (mvpwd.equals(password.trim())) {//從memVO的會員資料找出memPwd欄位跟password比對
					return memVO;
				}
			}
		}
		return null;
	}

}
