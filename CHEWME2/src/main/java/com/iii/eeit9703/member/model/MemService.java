package com.iii.eeit9703.member.model;

public class MemService {
	private MemDAO_interface dao;

	public MemService(){
		dao=new MemDAO();
	}

	public MemVO addMem(String memberId,String mName,String mNickN,String mPwd,java.sql.Date mBirthday,String mMail,String mAddr,String mPhone,String mIntr){
		MemVO memVO=new MemVO();
		memVO.setmemberId(memberId);
		memVO.setmName(mName);
		memVO.setmNickN(mNickN);
		memVO.setmPwd(mPwd);
		memVO.setmBirthday(mBirthday);
		memVO.setmMail(mMail);
		memVO.setmAddr(mAddr);
		memVO.setmPhone(mPhone);
		memVO.setmIntr(mIntr);
		dao.insert(memVO);
		
		return memVO;
	}

}
