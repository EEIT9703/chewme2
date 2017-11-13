<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="login-form"
	action="<%=request.getContextPath()%>/member/login.do" method="post"
	role="form" style="display: block;">
	<div class="row">
		<div align="center">
			<a
				href="https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email&redirect_uri=http://localhost:8081/CHEWME2/googlelogin.do&response_type=code&state=/profile&client_id=237459292600-4nc82k5o9iq1caepr82fsukrcpsflah0.apps.googleusercontent.com">
				<img src="<%=request.getContextPath()%>/image/google_sign_in.png"
				style="width: 350px; height: 70px;" />
			</a>
		</div>
	<div class="login-or">
		<hr class="hr-or">
		<h4 style="color:#AAAAAA">------------------------------OR------------------------------</h4>
	</div>
	</div>
	<div class="form-group">
		<input type="text" id="userId" name="userId"
			value="${sessionScope.user}" tabindex="1" class="form-control"
			placeholder="帳號">
	</div>
	<div class="form-group">
		<input type="password" id="password" name="pswd"
			value="${sessionScope.password}" tabindex="2" class="form-control"
			placeholder="密碼">
	</div>
	<div class="g-recaptcha"
		data-sitekey="6LfFkTYUAAAAAMK1w_K82sMGOy-BWkq-YBYMn5-J"></div>
	<div class="form-group text-center">
		<label> <input type="checkbox" tabindex="3" name="rememberMe"
			class="recaptcha"
			<c:if test='${sessionScope.rememberMe==true}'>checked='checked'</c:if>
			value="true"> 記住密碼
		</label>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<button type="submit" name="login-submit" id="login-submit"
					tabindex="4" class="form-control btn btn-login">登入</button>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-lg-12">
				<div class="text-center">
					<a data-toggle="modal" data-target="#gridSystemModal" tabindex="5"
						class="forgot-password">Forgot Password?</a>
				</div>
			</div>
		</div>
	</div>
</form>