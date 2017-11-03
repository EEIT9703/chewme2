package com.iii.eeit9703.member.model;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

public class MemService {
	private MemDAO_interface dao;

	public MemService() {
		dao = new MemDAO();
	}

	public MemVO insertGoogle(String memberId,String memName,String memNickN, String memMail, String googleId) {
		MemVO memVO = new MemVO();
		memVO.setMemberId(memberId);
		memVO.setMemName(memName);
		memVO.setMemNickN(memNickN);
		memVO.setMemMail(memMail);
		memVO.setGoogleId(googleId);
		dao.insert(memVO);
		
		return memVO;

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
	
	public void updateMem(MemVO memVO) {
		dao.update(memVO);
	}

	public MemVO getOneMem(Integer memId) {

		return dao.findByPrimaryKey(memId);
	}
	public MemVO getGID(String googleId) {

		return dao.findByGID(googleId);
	}
	public MemVO getOneMem(String memberId){
		return dao.findByMemberId(memberId);
	}

	public List<MemVO> getAll() {// 取出所有會員資料放入List裡
		return dao.getAll();
	}

	public MemVO checkIDPassword(String userId, String password) {// 檢查會員登入時的帳號密碼
		MemService memSvc = new MemService();
		for (MemVO memVO : memSvc.getAll()) {// 將memSvc收集到的會員資料放入memVO裡
			if (memVO.getMemberId().trim().equals(userId.trim())) {// 從memVO的會員資料找出memberId欄位跟userId比對
				// String encodePassword =
				// DatatypeConverter.printBase64Binary(password.getBytes());
				// String
				// encrypedString=GlobalService.encryptString(password.trim());
				// String pswd=GlobalService.getMD5Encoding(encrypedString);
				String mvpwd = memVO.getMemPwd().trim();
				if (mvpwd.equals(password.trim())) {// 從memVO的會員資料找出memPwd欄位跟password比對
					return memVO;
				}
			}
		}
		return null;
	}
	public MemVO findMemIdorMail(String userId,String userMail){		
		MemService memSvc=new MemService();
		for(MemVO mv:memSvc.getAll()){
			if(mv.getMemberId().trim().equals(userId.trim())){
				if(mv.getMemberId().trim().equals(userId.trim())){
					return mv;					
				}
			}
		}
		return null;
	}


	synchronized public boolean idExists(String id) throws IOException {
		boolean exist = false; // 檢查id是否已經存在
		MemService memSvc = new MemService();
		for (MemVO memVO : memSvc.getAll()) {
			if (memVO.getMemberId().equals(id.trim())) {
				exist = true;
				break;
			}
		}
		return exist;
	}


	public MemVO updateMem(Integer memId, String memberId, String memName, String memNickN, String memPwd,
			Date memBirthday, String memMail, String memAddr, String memPhone, String memIntr, String memPhoto) {
		MemVO memVO = new MemVO();
		memVO.setMemId(memId);
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
		dao.update(memVO);

		return dao.findByPrimaryKey(memId);
	}
	
	public static void main(String[] args) {
		
	}

}
