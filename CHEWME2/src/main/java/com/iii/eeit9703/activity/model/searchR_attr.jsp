<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 


<div class="col-md-12  margin_bottom30">
           <div class="thumbnail">
<%-- 			<a class="url_attr" href="<%=request.getContextPath()%>/attractions/show_attr.jsp">			 --%>
<%-- 				<img class="img-responsive center-block" src="<%=request.getContextPath()%>/image/attr.jpg" style="height:150px;"> --%>
<!-- 			</a> -->
           		<input type="hidden" class="id">    
				<div class="blog-content bg-white" style="background-color:#d9ddde;height:200px;">
				<h2 id="act_name" class="act_name"></h2>
				<div class="intro1"></div>
				
				<a class="btn btn-info btn-sm" href="<%=request.getContextPath()%>/attractions/show_attr.jsp">
              	<span class="glyphicon glyphicon-log-in"></span> 查看
             	</a>  
         
				<hr>
				<div>Share : 
				<a href="javascript: void(window.open('http://www.facebook.com/share.php?u='.concat(encodeURIComponent('http://www.web.com.tw/activity/index.html'))));"><i class="fa fa-facebook margin_left10" aria-hidden="true"></i></a>
				<a href="javascript"><i class="fa fa-twitter margin_left10" aria-hidden="true"></i></a>
				<a href="javascript"><i class="fa fa-google-plus margin_left10" aria-hidden="true"></i></a>
				</div>
				 
                <span class="pull-right">	
              </span>
              	</div>
			</div>
		</div>



