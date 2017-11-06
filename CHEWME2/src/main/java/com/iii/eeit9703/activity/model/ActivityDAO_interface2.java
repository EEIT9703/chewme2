package com.iii.eeit9703.activity.model;

import java.io.InputStream;
import java.util.*;

public interface ActivityDAO_interface2 {
	

    //修改活動
	public void update (ActivityVO activityVO);
	//上傳預覽圖和內容
	public void finalAct(ActivityVO activityVO);
	//刪除
	public void delete (Integer actID);
	//主鍵
	public ActivityVO findByPrimaryKey(Integer actID);
	//查詢
	public List<ActivityVO>getAll();
	
	public List<ActivityVO> getListByClubId(Integer clubId);
	
	public List<ActivityVO> getListVOBymemId(Integer memId);
	
	public List<ActivityVO> getOwnListVOByMemId(Integer memId); 
	
	
	
}
