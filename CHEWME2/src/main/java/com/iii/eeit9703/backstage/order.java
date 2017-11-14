package com.iii.eeit9703.backstage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.json.JSONArray;

import com.iii.eeit9703.actEditor.model.ScheduleDAO;
import com.iii.eeit9703.actEditor.model.ScheduleDAO_Hibernate;
import com.iii.eeit9703.actEditor.model.ScheduleVO;
import com.iii.eeit9703.crawler.model.AttrVO;
import com.iii.eeit9703.crawler.model.SearchHibernateDAO;
import com.iii.eeit9703.order.OrderDAO_hibernate;
import com.iii.eeit9703.order.OrderVO;

public class order {

	public static void main(String[] args) {
		SearchHibernateDAO daoAttr = new SearchHibernateDAO();		
		ScheduleDAO_Hibernate daoSch =new ScheduleDAO_Hibernate();
		List<ScheduleVO> listsSch =daoSch.getAll();	
		int[] sche =new int[listsSch.size()];
		
		int i=0;
	
		for(ScheduleVO scheduleVO:listsSch){		
				sche[i]=scheduleVO.getAttractionID();				
				i++;					
		}
	
		Map<Integer,Integer> map_fav = new TreeMap<Integer,Integer>();
		
		for(int x = 0; x < sche.length; x++) { 
			if(map_fav.containsKey(sche[x])) { 
				Integer count = (Integer) map_fav.get(sche[x]); 
				count++; 
				map_fav.put(sche[x], count);
				} 
			
			else { 
				map_fav.put(sche[x], 1);
					} 
			
		}
	
		List<Entry<Integer,Integer>> list =new ArrayList<Entry<Integer,Integer>>(map_fav.entrySet());
		Collections.sort(list, new Comparator<Map.Entry<Integer, Integer>>() {
			  public int compare(Map.Entry<Integer, Integer> o1,
			      Map.Entry<Integer, Integer> o2) {
			    return (o2.getValue() - o1.getValue());
			  }
			});	
		
		
		//Map<String,Integer> map1 = new TreeMap<String,Integer>();
		List attr_name=new ArrayList();
		List attr_number=new ArrayList();
			int count=0;
			String[] attr =new String[count+5];
			int[] attr_total =new int[count+5];
			for (Map.Entry<Integer, Integer> entry : list) {
			if(count<5){
			System.out.println(entry.getKey());	
			AttrVO attrVO=daoAttr.findByPKInt(entry.getKey());
			System.out.println(attrVO.getAttractionID());
			attr[count]=attrVO.getName();
			attr_total[count]=entry.getValue();		
			// map1.put(attrVO.getName(), entry.getValue());
			// sec.add(map1);
			 }
			 count++;
		   }
	 			
			for(int j=0;j<attr.length;j++){
				attr_name.add(attr[j]);
				attr_number.add(attr_total[j]);			
			}
			
			HashMap<String,Object> map1 =new HashMap<String,Object>();					
			map1.put("categories", attr_name);
			map1.put("number", attr_number);
			

		
	
		
		
	}


}


//map.put("data0", list.get(0).toString());
//map.put("data1", list.get(1).toString());
//map.put("data2", list.get(2).toString());
//map.put("data3", list.get(3).toString());
//map.put("data4", list.get(4).toString());
//map.put("data5", list.get(5).toString());
//map.put("data6", list.get(6).toString());
//map.put("data7", list.get(7).toString());
//map.put("data8", list.get(8).toString());
//map.put("data9", list.get(9).toString());
//map.put("data10", list.get(10).toString());
//map.put("data11", list.get(11).toString());
//System.out.println(map.get("one"));
//System.out.println(map.get("data"));
//System.out.println(map.get("data1"));
//System.out.println(map.get("data2"));
//System.out.println(map.get("data3"));
//System.out.println(map.get("data4"));
//System.out.println(map.get("data5"));
//System.out.println(map.get("data6"));
//System.out.println(map.get("data7"));
//System.out.println(map.get("data8"));
//System.out.println(map.get("data9"));
