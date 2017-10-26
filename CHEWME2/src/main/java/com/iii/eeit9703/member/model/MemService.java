package com.iii.eeit9703.member.model;

import java.io.InputStream;


public class MemService {
	private MemDAO_interface dao;

	public MemService(){
		dao=new MemDAO();
	}

	public MemVO addMem(String memberId,String memName,String memNickN,String memPwd,java.sql.Date memBirthday,String memMail,String memAddr,String memPhone,String memIntr,InputStream memPhoto){
		MemVO memVO=new MemVO();
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
	

}
