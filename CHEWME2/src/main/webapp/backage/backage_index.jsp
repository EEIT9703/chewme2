<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.structure.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.theme.min.css">
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/datatables.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/Highcharts.js"></script>
	<script src="<%=request.getContextPath()%>/js/exporting.js"></script>	
	<script src="<%=request.getContextPath()%>/js/highcharts-zh_CN.js"></script>
	


	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/metisMenu/metisMenu.min.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/morrisjs/morris.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/dist/css/sb-admin-2.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/datatables.min.css" rel="stylesheet"  type="text/css">
  	
   <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
  	
</head>


<body>
	<header><%@ include file="/header.jsp"%></header>
  		<div id="wrapper">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_index.jsp"><i class="fa fa-dashboard fa-fw"></i>後台首頁</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/ad.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>廣告輪播</a>
                            
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/report.jsp"><i class="fa fa-table fa-fw"></i>檢舉名單</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_activity.jsp"><i class="fa fa-edit fa-fw"></i>活動管理</a>
                        </li> 
                         <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_member.jsp"><i class="fa fa-edit fa-fw"></i>會員管理</a>
                        </li> 
                         <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_attraction.jsp"><i class="fa fa-edit fa-fw"></i>景點管理</a>
                        </li>                          
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Blank Page</a>
                                </li>
                                <li>
                                    <a href="#">Login Page</a>
                                </li>
                            </ul>                       
                        </li>
                    </ul>
                </div>           
            </div> 
            
            
            <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                
                    <h4 >內容區標頭</h4>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
               
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-10">
                    <div class="panel panel-default">
                       
						                        
            					 
							<div id="tabs">
								<ul>
									<li><a href="#tabs-1">年度銷售額</a></li>
									<li><a href="#tabs-2">出遊人數</a></li>
									<li><a href="#tabs-3">人數</a></li>
								</ul>
								<div id="tabs-1"><div id="container" style="min-width:400px;height:400px"></div></div>
								<div id="tabs-2"><div id="container2" style="min-width:400px;height:400px"></div></div>
								<div id="tabs-3"><div id="container3" style="min-width:400px;height:400px"></div></div>
							</div>



						</div>              
                </div>

            </div>      
        </div>     
    </div>
    </div>
  
 	
  	<script>
//   	$(function () {
var cell=new Array();
var cell2=new Array();
var cell3=new Array();
var cell4=new Array();
  		$(function () { 			
  			$.getJSON('<%=request.getContextPath()%>/activity?action=getOrderCharts',{},function(data){
  				console.log(data)
  			
				cell.push({data:data.money,name:'銷售量'})
				cell2.push({data:data.people,name:'總人數'})
				cell3.push({categories:data.categories, crosshair:'true'})
				cell4.push({data:data.number,name:'景點'})
			
  				snedCharts(cell);
				snedCharts2(cell2);
				snedCharts3()
  			});			
  			function snedCharts(cell){

  		    $('#container').highcharts({
  		        chart: {
  		            type: 'column'
  		        },
  		        title: {
  		            text: '年度銷售金額'
  		        },
  		        subtitle: {
  		            text: '數據來源: chewme.com'
  		        },
  		        xAxis: {
  		            categories: [
  		                '一月',
  		                '二月',
  		                '三月',
  		                '四月',
  		                '五月',
  		                '六月',
  		                '七月',
  		                '八月',
  		                '九月',
  		                '十月',
  		                '十一月',
  		                '十二月'
  		            ],
  		            crosshair: true
  		        },
  		        yAxis: {
  		            min: 0,
  		            title: {
  		                text: '總金額 (台幣)'
  		            }
  		        },
  		        tooltip: {
  		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
  		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
  		            '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
  		            footerFormat: '</table>',
  		            shared: true,
  		            useHTML: true
  		        },
  		        plotOptions: {
  		            column: {
  		                pointPadding: 0.2,
  		                borderWidth: 0
  		            }
  		        },
  		        series:cell
//   		        	[{
//   		            name: '銷售',
//   		            data: cell
//   		        }]
  		     });		    
  			} 
  			function snedCharts2(cell2){

  	  		    $('#container2').highcharts({
  	  		        chart: {
  	  		            type: 'column'
  	  		        },
  	  		        title: {
  	  		            text: '年度出遊人數'
  	  		        },
  	  		        subtitle: {
  	  		            text: '數據來源: chewme.com'
  	  		        },
  	  		    xAxis: {
  		            categories: [
  		                '一月',
  		                '二月',
  		                '三月',
  		                '四月',
  		                '五月',
  		                '六月',
  		                '七月',
  		                '八月',
  		                '九月',
  		                '十月',
  		                '十一月',
  		                '十二月'
  		            ],
  		            crosshair: true
  		        },
  	  		        yAxis: {
  	  		            min: 0,
  	  		            title: {
  	  		                text: '人數 (people)'
  	  		            }
  	  		        },
  	  		        tooltip: {
  	  		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
  	  		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
  	  		            '<td style="padding:0"><b>{point.y:.1f} 人</b></td></tr>',
  	  		            footerFormat: '</table>',
  	  		            shared: true,
  	  		            useHTML: true
  	  		        },
  	  		        plotOptions: {
  	  		            column: {
  	  		                pointPadding: 0.2,
  	  		                borderWidth: 0
  	  		            }
  	  		        },
  	  		        series:cell2
//  	   		        	[{
//  	   		            name: '銷售',
//  	   		            data: cell
//  	   		        }]
  	  		     });		    
  	  			}  					
  			
  			function snedCharts3(){

  	  		    $('#container3').highcharts({
  	  		        chart: {
  	  		            type: 'column'
  	  		        },
  	  		        title: {
  	  		            text: '熱門景點'
  	  		        },
  	  		        subtitle: {
  	  		            text: '數據來源: chewme.com'
  	  		        },
  	  		   		 xAxis: cell3,
  	  		        yAxis: {
  	  		            min: 0,
  	  		            title: {
  	  		                text: '人數 (people)'
  	  		            }
  	  		        },
  	  		        tooltip: {
  	  		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
  	  		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
  	  		            '<td style="padding:0"><b>{point.y:.1f} 人</b></td></tr>',
  	  		            footerFormat: '</table>',
  	  		            shared: true,
  	  		            useHTML: true
  	  		        },
  	  		        plotOptions: {
  	  		            column: {
  	  		                pointPadding: 0.2,
  	  		                borderWidth: 0
  	  		            }
  	  		        },
  	  		        series:cell4
//  	   		        	[{
//  	   		            name: '銷售',
//  	   		            data: cell
//  	   		        }]
  	  		     });		    
  	  			}  					
  			
  			
  			
  			
  			
  		}); 		 	
	</script>
  	
</body>
</html>