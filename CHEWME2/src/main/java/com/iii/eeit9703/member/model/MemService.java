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
			String memMail, String memAddr, String memPhone, String memIntr, InputStream memPhoto) {
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

	public List<MemVO> getAll() {
		return dao.getAll();
	}

	public MemVO checkIDPassword(String userId, String password) {
		MemService memSvc = new MemService();
		for (MemVO memVO : memSvc.getAll()) {
			System.out.println(memVO);
			if (memVO.getMemberId().trim().equals(userId.trim())) {
				//String encodePassword = DatatypeConverter.printBase64Binary(password.getBytes());
				// String encrypedString=GlobalService.encryptString(password.trim());
				// String pswd=GlobalService.getMD5Encoding(encrypedString);
				String mvpwd = memVO.getMemPwd().trim();
				if (mvpwd.equals(password.trim())) {
					return memVO;
				}
			}
		}
		return null;
	}

	public static void main(String[] args) throws Exception {

	}
}
