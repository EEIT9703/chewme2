<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊會員</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script>
  $(function() {
    $("#datepicker").datepicker({
      //可使用下拉式選單 - 月份
      changeMonth : true,
      //可使用下拉式選單 - 年份
      changeYear : true,
      //設定 下拉式選單月份 在 年份的後面
      showMonthAfterYear : true
    });
  });
</script>

</head>
<body>
	<table>
		<tr>
			<td>
				<form action="">
					<fieldset>
						<legend>個人資料</legend>
						<label>帳號:</label> 
						<input type="text" name="memberId"value=""><br /> 
						<label>真實姓名:</label>
						<input type="text" name="mName" value=""><br />
						<label>暱稱:</label> 
						<input type="text" name="mNickN"value=""><br /> 
						<label>密碼:</label> 
						<input type="password" name="mPwd" value=""><br />
						<label>確認:</label> 
						<input type="password" name="mPwdChk" value=""><br />
					</fieldset>
					<fieldset>
						<label>輸入生日:</label> 
						<input type="text" id="datepicker" name="mBirthday" value="">

						<label>輸入信箱:</label> 
						<input type="text" name="mMail" value=""><br /> 
						<label>輸入地址:</label>
<!-- 						<select name="mAddr"> -->
<!-- 							<option value="台北市">台北市</option> -->
<!-- 							<option value="新北市">新北市</option> -->
<!-- 							<option value="桃園市">桃園市</option> -->
<!-- 							<option value="台中市">台中市</option> -->
<!-- 							<option value="台南市">台南市</option> -->
<!-- 							<option value="高雄市">高雄市</option> -->
<!-- 							<option value="基隆市">基隆市</option> -->
<!-- 							<option value="新竹市">新竹市</option> -->
<!-- 							<option value="嘉義市">嘉義市</option> -->
<!-- 							<option value="新竹縣">新竹縣</option> -->
<!-- 							<option value="苗栗縣">苗栗縣</option> -->
<!-- 							<option value="彰化縣">彰化縣</option> -->
<!-- 							<option value="南投縣">南投縣</option> -->
<!-- 							<option value="雲林縣">雲林縣</option> -->
<!-- 							<option value="嘉義縣">嘉義縣</option> -->
<!-- 							<option value="屏東縣">屏東縣</option> -->
<!-- 							<option value="宜蘭縣">宜蘭縣</option> -->
<!-- 							<option value="花蓮縣">花蓮縣</option> -->
<!-- 							<option value="台東縣">台東縣</option> -->
<!-- 							<option value="澎湖縣">澎湖縣</option> -->
<!-- 						</select> -->
						<input type="text" name="mAddr" value=""><br />
					</fieldset>
					<fieldset>
						<label>輸入電話:</label> 
						<input type="text" name="mPhone" value=""><br /> 
						<label>大頭貼:</label> 
						<input type="file" name="mPhoto" value=""><br />
						<label>輸入自我介紹:</label>
						<textarea name="mIntr" value={param.mIntr} cols="40" rows="5"></textarea>
						<br />
					</fieldset>					
					<div>
						<input type="submit" value="送出"> 
						<input type="reset" value="清除">
					</div>
				</form>
			</td>
		</tr>
	</table>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>"
	
</body>
</html>