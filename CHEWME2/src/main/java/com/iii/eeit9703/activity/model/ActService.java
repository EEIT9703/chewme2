package com.iii.eeit9703.activity.model;

import java.io.InputStream;
import java.sql.Date;
import java.util.List;

public class ActService {

	private ActivityDAO_interface dao;
	
	public ActService(){
		dao = new ActivityDAO();
	}
	
	
	//新增活動
/*	public ActivityVO addAct(String act_name,Integer act_groups,Integer act_current,java.sql.Date BDate,java.sql.Date EDate,Integer activity_state){
		
		ActivityVO activityVO = new ActivityVO();
		
		activityVO.setAct_name(act_name);
		activityVO.setAct_groups(act_groups);
		activityVO.setAct_current(act_current);
		activityVO.setBDate(BDate);
		activityVO.setEDate(EDate);
		activityVO.setActivity_state(activity_state);
		
		dao.insert(activityVO);
		return activityVO;
	}*/
	
	//修改新增活動     工頭把包好的資料交給DAO去工作
	public void updateAct(ActivityVO activityVO,InputStream is){

		dao.update(activityVO,is);

	}
	
	//查詢單一
	public ActivityVO getOneAct(Integer actID){
		return dao.findByPrimaryKey(actID);
	}
	
	//查詢全部
	public List<ActivityVO> getAll(){
		return dao.getAll();
	}

}