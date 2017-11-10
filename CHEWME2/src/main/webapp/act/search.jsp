<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.activity.model.*"%>



<!-- <script src="js/bootstrap.min.js"></script> -->


	
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/bootstrap-select.min.css" rel="stylesheet">
<script	src="<%=request.getContextPath()%>/js/bootstrap-select.min.js"></script>
<style>

body { background-color:#ddd; }
.blog-row {margin-top:50px; }
.margin_bottom30 { margin-bottom:30px; }
.margin_left10 {margin-left:10px; }
.blog-content {padding:10px; }
.bg-white {background-color:#fff;}

.product_buttons {
  -webkit-font-smoothing: antialiased;
  -moz-font-smoothing: antialiased;
  font-smoothing: antialiased;
}

.add_to_cart:hover {
  color: #4DC8D3;;
  background: rgba(255, 255, 255, 0.5);
}

.product_buttons button {
    color: #252525;
    background: rgba(255, 255, 255, 1);
    font-size: 1em;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    border: 1px solid #000;
  }


</style>

<%-- 	<header><%@ include file="../header.jsp"%></header> --%>
	
	
	<div class="container">
	<div class="row">
           <table>
        	<tr>
        		<td>
        			<select name="county" class="selectpicker" style="width:20px;" id="select1">
        				<option>行程</option>
						<option>景點</option>
        			</select>
        		</td>
        		<td>
            		<input type="text" class="search-query form-control" placeholder="搜尋" id="text" name="tags" autofocus style="width:800px;"/> 
            	</td>
            	<td>               
                		<button class="btn btn-info" type="submit" id="search">
                			<span class=" glyphicon glyphicon-search"></span>
                		</button>
                	<input type="hidden" name="action" value="search">
            	</td>   
            	 	
            </tr>    
            </table>  
	</div>
</div>
	




	<jsp:useBean id="actSvc" scope="page" class="com.iii.eeit9703.activity.model.ActService" />


    <div class="container">             	
	<div class="row" id="div1">
          <c:forEach var="activityVO" items="${actSvc.all}">
           <div class="col-md-4  margin_bottom30">
           <div class=title>
			<input type="hidden" id="${activityVO.actID}">  
			</div>
           <div class="thumbnail">


           
<%-- 			<a href="<%=request.getContextPath()%>/act/showAct.jsp">			 --%>
<!-- 				</a>	 -->

<%--            <input type="hidden" class="id" id="${activityVO.actID}">  --%>
 
			<a href="<%=request.getContextPath()%>/act/ActivitySearch?action=searchone&name=${activityVO.actID}">	
				<img class="img-responsive center-block" src="data:image/png;base64,${activityVO.act_photo}" height="250">
			</a>	
<%-- 				<input type="hidden" class="id" value="${activityVO.actID}"> 				 --%>
				<div class="blog-content bg-white">
				<h3 id="act_name" class="act_name">${activityVO.act_name}</h3>
				<p>Category : <a href="javascript::;">Nature</a></p>
				<p>旅遊介紹<a href="javascript::;"  class="heading_color">  Continue Reading</a></p>
				<hr>
				<p><span>Share : 
				<a href="javascript::;"><i class="fa fa-facebook margin_left10" aria-hidden="true"></i></a>
				<a href="javascript::;"><i class="fa fa-twitter margin_left10" aria-hidden="true"></i></a>
				<a href="javascript::;"><i class="fa fa-google-plus margin_left10" aria-hidden="true"></i></a>
				 </span> 

				<span class="pull-right">
				
              <button class="btn btn-info btn-sm">
              <span class="glyphicon glyphicon-heart-empty inputCar"></span> 加入收藏
              </button>             
              </span>

				</div>
				</div>
			</div>
			</c:forEach>
			</div>
			</div>
	

<script>




</script>

<script src="<%=request.getContextPath()%>/act/js/search.js"></script>
<script src="<%=request.getContextPath()%>/js/FontAwesomeCdnConfig.js"></script>

