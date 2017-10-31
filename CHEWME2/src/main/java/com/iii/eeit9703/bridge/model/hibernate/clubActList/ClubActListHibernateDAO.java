package com.iii.eeit9703.bridge.model.hibernate.clubActList;

import java.util.List;

import com.iii.eeit9703.bridge.model.ClubActListDAOI;
import com.iii.eeit9703.bridge.model.ClubActListVO;
import com.iii.eeit9703.club.model.ClubVO;

public class ClubActListHibernateDAO implements  ClubActListDAOI{

	private static final String GET_ALL_STMT="from ClubVO order by clubId";
	private static final String GET_ONE_STMT_SQL="from ClubVO where clubId = ?";
	@Override
	public List<ClubActListVO> getAll() {
		return null;
	}

	@Override
	public void getOne(Integer clubId) {
		
	}

	@Override
	public void insert(ClubVO clubVO) {
		
	}

	@Override
	public void update(ClubVO clubVO) {
		
	}

	@Override
	public void delete(Integer clubId) {
		
	}


}
