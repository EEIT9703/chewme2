<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 


<div class="col-md-4  margin_bottom30">
           <div class="thumbnail">

                  

			<a href="<%=request.getContextPath()%>/act/show.jsp">			
				<img class="img-responsive center-block" src="data:image/png;base64,${activityVO.act_photo}" height="250">
			</a>
           		<input type="hidden" class="id">  
				<div class="blog-content bg-white">
				<h3 id="act_name" class="act_name"></h3>
				<p>Category : <a href="javascript::;" id="a1">Nature</a></p>
				<p>旅遊介紹<a href="javascript::;"  class="heading_color"> Continue Reading</a></p>
				<hr>
				<p><span>Share : 
				<a href="javascript: void(window.open('http://www.facebook.com/share.php?u='.concat(encodeURIComponent('http://www.web.com.tw/activity/index.html'))));"><i class="fa fa-facebook margin_left10" aria-hidden="true"></i></a>
				<a href="javascript"><i class="fa fa-twitter margin_left10" aria-hidden="true"></i></a>
				<a href="javascript"><i class="fa fa-google-plus margin_left10" aria-hidden="true"></i></a>
				 </span> </p>
				 
                <span class="pull-right">
				
               <button class="btn btn-info btn-sm">
              <span class="glyphicon glyphicon-heart-empty"></span> 加入收藏
              </button>             
              </span>
              	</div>
			</div>
		</div>



