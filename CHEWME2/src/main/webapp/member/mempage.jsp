<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.member.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<style>
.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 0.5s;
    }
</style>
</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<form action="memEditor.do">
	<table>
	<tr>
	<td>會員編號:${LoginOK.memId }</td></tr>
			<tr>
				<td>會員帳號:${LoginOK.memberId }</td>
			</tr>
			<tr>
				<td>會員姓名:${LoginOK.memName }</td>
			</tr>
			<tr>
				<td>會員暱稱:${LoginOK.memNickN }</td>
			</tr>
			<tr>
				<td>會員密碼:${LoginOK.memPwd }</td>
			</tr>
			<tr>
				<td>會員生日:${LoginOK.memBirthday }</td>
			</tr>
			<tr>
				<td>會員信箱:${LoginOK.memMail }</td>
			</tr>
			<tr>
				<td>會員地址:${LoginOK.memAddr }</td>
			</tr>
			<tr>
				<td>會員電話:${LoginOK.memPhone }</td>
			</tr>
			<tr>
				<td>自我介紹:${LoginOK.memIntr }</td>
			</tr>
		</table>
	<input type="hidden" name="memId" value="${LoginOK.memId }">
	<input type="button" value="修改" onclick="location.href='<%=request.getContextPath()%>/member/memeditor.jsp'">
	</form>
	<div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
		    <div class="col-md-9">
		    <div class="jumbotron">
			<div class="page-header">
				<h3>我的社團</h3>
			</div>
			<!-- 每頁不同的內容從這裡開始 -->
			<input type="hidden" id="memId" value="${LoginOK.memId}">
                   <table id="memClubTable"  class="table table-striped custab">
                       <thead>
                          <tr>
                             <th>社團編號</th>
                             <th>社團名稱</th>
                          </tr>
                       </thead>
                       <tbody align="center">                 
                       </tbody>
                       <tfoot>                                     
                       </tfoot>
                   </table>

		</div>
		    </div>
		    </div>
		    </div>
		    	<script src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
<script>
$(function(){
	var id=document.getElementById("memId").value;
	loadmemClub(id);   
	   function loadmemClub(id){
	    $.getJSON('<%=request.getContextPath()%>/ListMemClub',{'memId':id},function(datas){
	    	  //datas = [] array
	    	  console.log(datas)
	    	  var fragment = $(document.createDocumentFragment());
	    	  $.each(datas,function(idx,smc){
	    		  //product = {}
	    		  var cell1 = $('<td></td>').text(smc.clubId)
	    		  //var cell2 = $('<td></td>').text(smc.clubName)
	    		  var cell2 = $('<td></td>').html("<a href='<%=request.getContextPath()%>/club/clubClientView.do?action=chooseClub&clubId="+smc.clubId+"'>"+smc.clubName+"</a>")
	    		  var row = $('<tr></tr>').append([cell1,cell2]);
	    		  
	    		  fragment.append(row);
	    	  });
	    	  $('#memClubTable>tbody').html(fragment);	  
	    })
	   }
	})
</script>
</body>
</html>