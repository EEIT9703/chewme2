package com.iii.eeit9703.activity.model;

import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class ActService {

	private ActivityDAO_interface dao;
	
	public ActService(){
		dao = new ActivityDAO();
	}
	
	

	
	//修改新增活動     工頭把包好的資料交給DAO去工作
	public void updateAct(ActivityVO activityVO){
		dao.update(activityVO);
	}
	
	//上傳預覽圖  編輯簡介
	public void finalAct(ActivityVO activityVO){
		dao.finalAct(activityVO);
	}
	
	//查詢單一
	public ActivityVO getOneAct(Integer actID){
		return dao.findByPrimaryKey(actID);
	}
	
	//查詢全部
	public List<ActivityVO> getAll(){
		return dao.getAll();
	}
	
	public ArrayList<ActivityVO> Search(String act_name){
		return dao.Search(act_name);
	}

}