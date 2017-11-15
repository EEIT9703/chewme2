<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 


<div class="col-md-4  margin_bottom30 activityTemplate" style="height:450px;">
           <div class="thumbnail">
			<a class="url" href="<%=request.getContextPath()%>/act/show.jsp">			
				<img class="center-block img-responsive" src="" height="150">
			</a>
           		<input type="hidden" class="id">  
				<div class="blog-content bg-white">
				<img src="<%=request.getContextPath()%>/image/chewme-logo-3-1.png" width="50" height="50" style="float:left;vertical-align:middle;">
				<h3 id="" class="act_name"></h3>
				
				<a class="btn-sm btn btn-info ">
                <i class="act_price fa fa-usd" aria-hidden="true"></i>
                </a>
                <a class="btn-sm btn btn-info ">
                <span class="act_groups glyphicon glyphicon-user"></span>
                </a>
				<a class="btn-sm btn btn-danger ">
                <span class="act_current glyphicon glyphicon-user"></span>
                </a> 
				<hr>
				<p><span>Share : 
				<a href="javascript::;"><i class="fa fa-facebook margin_left10" aria-hidden="true"></i></a>
				<a href="javascript::;"><i class="fa fa-twitter margin_left10" aria-hidden="true"></i></a>
				<a href="javascript::;"><i class="fa fa-google-plus margin_left10" aria-hidden="true"></i></a>
				 </span>
				 
                <span class="pull-right">
				
               <button class="btn btn-info btn-sm">
              <span class="glyphicon glyphicon-heart-empty"></span> 加入收藏
              </button>             
              </span>
              	</div>
			</div>
		</div>
	



