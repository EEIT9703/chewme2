<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 


<div class="col-md-12  margin_bottom30">
           <div class="thumbnail">
<%-- 			<a class="url_attr" href="<%=request.getContextPath()%>/attractions/show_attr.jsp">			 --%>
<%-- 				<img class="img-responsive center-block" src="<%=request.getContextPath()%>/image/attr.jpg" style="height:150px;"> --%>
<!-- 			</a> -->
           		<input type="hidden" class="id">    
				<div class="blog-content bg-white">
				<h3 id="act_name" class="act_name"></h3>
				
				<a class="btn btn-info btn-sm" href="<%=request.getContextPath()%>/attractions/show_attr.jsp">
              	<span class="glyphicon glyphicon-heart-empty"></span> 查看
             	</a>  
             	
<!-- 				<p>Category : <a href="javascript::;" id="a1">Nature</a></p> -->
				<p>旅遊介紹<a href="javascript::;"  class="heading_color"> Continue Reading</a></p>
				<hr>
				<p><span>Share : 
				<a href="javascript: void(window.open('http://www.facebook.com/share.php?u='.concat(encodeURIComponent('http://www.web.com.tw/activity/index.html'))));"><i class="fa fa-facebook margin_left10" aria-hidden="true"></i></a>
				<a href="javascript"><i class="fa fa-twitter margin_left10" aria-hidden="true"></i></a>
				<a href="javascript"><i class="fa fa-google-plus margin_left10" aria-hidden="true"></i></a>
				 </span>
				 
                <span class="pull-right">	
              </span>
              	</div>
			</div>
		</div>



