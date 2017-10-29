package com.iii.eeit9703.activity.model;

import java.io.InputStream;
import java.util.*;

public interface ActivityDAO_interface {
	
<<<<<<< HEAD

=======
	//新增活動
	public void insert (ActivityVO activityVO);
>>>>>>> branch 'master' of https://github.com/EEIT9703/chewme2.git
    //修改活動
	public void update (ActivityVO activityVO);
	//刪除
	public void delete (Integer actID);
	//主鍵
	public ActivityVO findByPrimaryKey(Integer actID);
	//查詢
	public List<ActivityVO>getAll();
	

	

	
	
}
