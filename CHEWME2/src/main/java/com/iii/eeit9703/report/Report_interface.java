package com.iii.eeit9703.report;

import java.util.List;
import java.util.Set;

public interface Report_interface {

	 public void insert(ReportVO reportVO);
     public void update(ReportVO reportVO);
     public void delete(ReportVO reportVO);
     public ReportVO findByPrimaryKey(ReportVO reportVO);
     public List<ReportVO> getAll();
     //查詢某部門的員工(一對多)(回傳 Set)
     //public List<ReportVO> getMemByActId(ReportVO reportVO);

	
}