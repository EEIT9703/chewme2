<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



  <form id="formCreditCard" method="post" accept-charset="UTF-8"
 action="<%=request.getContextPath()%>/allpay">

MerchantID 商店代號: 
<input type="text" name="ID" value="2017101255669922" /><br />

MerchantTradeNo 商店交易編號: 
<input type="text" name="product" value="java" /><br />

MerchantTradeDate 商店交易時間: 
<input type="text" name="money" value="1500" /><br />


<input type="submit" value="送出訂單" />

</form>




</body>
</html>