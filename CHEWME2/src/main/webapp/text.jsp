<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.course-library___2cxpz #page-wrapper___3sTSR {
    min-height: 1px;
    padding-left: 18px;
    padding-right: 20px;
    margin-top: 40px;
    position: absolute;
    left: 240px;
    top: 70px;
}
.course-library___2cxpz .course-list-container___1wNin {
    float: left;
    position: relative;
    width: 100%;
    margin-top: 20px;
    margin-left: -8px;
}
.course-library___2cxpz .course-card___1TDmk {
    float: left;
    position: relative;
    margin-right: 22px;
    margin-bottom: 5px;
    width: 228px;
}

.card___3QUMZ {
    position: relative;
    margin: 0 10px 20px;
    text-decoration: none;
    overflow: hidden;
    cursor: pointer;
    -webkit-box-shadow: 0 2px 5px rgba(0,0,0,.8);
    -moz-box-shadow: 0 2px 5px rgba(0,0,0,.8);
    box-shadow: 0 2px 5px rgba(0,0,0,.8);
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -ms-border-radius: 3px;
    -o-border-radius: 3px;
    border-radius: 3px;
    width: 230px;
    height: 230px;
}

.card___3QUMZ .overlay___k1FUh {
    position: absolute;
    top: 0;
    left: 0;
    color: #fff;
    overflow: hidden;
    width: 230px;
    height: 460px;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-direction: column;
    flex-direction: column;
    -webkit-transition: all .6s cubic-bezier(.4,0,.2,1);
    -moz-transition: all .6s cubic-bezier(.4,0,.2,1);
    -o-transition: all .6s cubic-bezier(.4,0,.2,1);
    transition: all .6s cubic-bezier(.4,0,.2,1);
}

.card___3QUMZ .overlay___k1FUh .box1___3KpeP {
    height: 130px;
}

.card___3QUMZ .overlay___k1FUh .box1___3KpeP .difficultLevel___2noHb {
    position: absolute;
    padding: 3px 10px;
    margin: 8px 0 0 8px;
    font-size: 12px;
}
.label-primary {
    background-color: #006C8F;
}
.label {
    display: inline;
    padding: .2em .6em .3em;
    font-size: 75%;
    font-weight: bold;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25em;
}

* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.card___3QUMZ .overlay___k1FUh .box2___2d81V {
    height: 100px;
    position: relative;
    color: #fff;
    background-color: #5c5c5c;
    padding: 10px 15px 15px 12px;
    height: 130px;
}

.card___3QUMZ .heading___3U6-V {
    height: 50px;
    margin: 0 0 6px;
    font-size: 18px;
    word-wrap: break-word;
    overflow: hidden;
}

.card___3QUMZ .secondary___bbksv {
    height: 40px;
    overflow: hidden;
    display: none;
    font-size: 14px;
    color: #ccc;
}

.card___3QUMZ .overlay___k1FUh .box2___2d81V .discountPrice___ol9CD {
    color: #717071;
    position: absolute;
    right: 10%;
    bottom: 14%;
    font-size: 12px;
    float: none;
}
.card___3QUMZ .overlay___k1FUh .box2___2d81V .price___153fL {
    color: #000;
    display: none;
}

.card___3QUMZ .overlay___k1FUh .box3___2jvgx {
    height: 100px;
    position: relative;
    color: #fff;
    background-color: rgba(196,73,128,.9);
    padding: 16px 20px 0;
}
.card___3QUMZ .overlay___k1FUh .box3___2jvgx .heading-info___1K3xL {
    height: 30px;
    margin: 0 0 6px;
    font-size: 18px;
}

.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.card___3QUMZ .overlay___k1FUh .box3___2jvgx .collection___2VH__ .btncollection___15LpO {
    display: none;
    position: absolute;
    right: 75px;
    bottom: 30px;
    background-color: #fff;
    color: #0b0a0b;
    line-height: 30px;
    font-size: 14px;
    width: 100px;
    height: 30px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -ms-border-radius: 3px;
    -o-border-radius: 3px;
    border-radius: 3px;
    text-align: center;
    margin-top: -10px;
}

.card___3QUMZ .overlay___k1FUh .box3___2jvgx .icon___2Dgtd {
    position: absolute;
    right: 20px;
    bottom: 20px;
    width: 50px;
    height: 50px;
}

</style>
</head>
<body>
<div id="page-wrapper___3sTSR">
<div calss="course-list-container___1wNin">
<div class="course-card___1TDmk">
<div class="card___3QUMZ">
<img src="image/101.jpg" width=300px height=300px>
<div class="overlay___k1FUh">
	<div class="box1___3KpeP">
		<span class="label label-primary difficultLevel___2noHb" >基礎</span>
	</div>
	<div class="box2___2d81V">
		<div class="heading___3U6-V">
		88pgojapgj'
		
		</div>
		<div class="secondary___bbksv">
		vhhaghashjdrjsrhseg		
		</div>
		<div>
			<span class="discountPrice___ol9CD">8888</span>
			<span class="price___153fL">9999</span>
		</div>
	</div>
	
	<div class="box3___2jvgx">
		<div class="heading-info___1K3xL">
		<span>
				<i class=>
				
				
				</i>		
		
		</span>
		</div>
	<div class="collection___2VH__" data-iscollection="false">
	<span class="isvg loaded icon___2Dgtd"></span>
	<div class="btncollection___15LpO">加入收長</div>
	</div>
	
	</div>
	
	
</div>

</div>
</div>
</body>
</html>