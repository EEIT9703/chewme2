package com.iii.eeit9703.bridge.model.hibernate.clubActRelation;

import java.util.List;

import com.iii.eeit9703.bridge.model.ClubActRelationDAOI;
import com.iii.eeit9703.bridge.model.ClubActRelationVO;

public class ClubActRelationHibernateDAO implements  ClubActRelationDAOI{

	private static final String GET_ALL_STMT="from ClubVO order by clubId";
	private static final String GET_ONE_STMT_SQL="from ClubVO where clubId = ?";
	@Override
	public List<ClubActRelationVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ClubActRelationVO getOne(ClubActRelationVO cmlVO) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void insert(ClubActRelationVO cmlVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void update(ClubActRelationVO cmlVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(ClubActRelationVO cmlVO) {
		// TODO Auto-generated method stub
		
	}


}
