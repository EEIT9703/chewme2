<img id="img_header"
	src="<%=request.getContextPath()%>/image/nophoto.png"
	class="img-responsive" width="150" height="150">
<div class="form-group">
	<label class="btn btn-info" for="memPhoto"> <input
		id="memPhoto" name="memPhoto" style="display: none;" type="file"
		value="${param.memPhoto}"> <i class="fa fa-folder-open-o"></i>
		上傳圖片
	</label>
</div>
<div class="form-group">
	<input type="text" name="memberId" id="memberId" tabindex="1"
		class="form-control" placeholder="帳號" value="${param.memberId}">
	<span id="idsp" style="color: red;"></span>
</div>
<div class="form-group">
	<input type="text" name="memName" id="memName" tabindex="1"
		class="form-control" placeholder="真實姓名" value="${param.memName}">
	<span id="name" style="color: red;"></span>
</div>
<div class="form-group">
	<input type="text" name="memNickN" id="memNickN" tabindex="1"
		class="form-control" placeholder="暱稱" value="${param.memNickN}">
	<span id="nickn" style="color: red;"></span>
</div>
<div class="form-group">
	<input type="password" name="memPwd" id="memPwd" tabindex="2"
		class="form-control" placeholder="密碼" value="${param.memPwd}">
	<span id="pwd" style="color: red;"></span>
</div>
<div class="form-group">
	<input type="date" name="memBirthday" id="memBirthday" tabindex="2"
		class="form-control" value="${param.memBirthday}" placeholder="生日"><span
		id="bd" style="color: red;"></span>
</div>
<div class="form-group">
	<input type="email" name="memMail" id="memMail" tabindex="1"
		class="form-control" placeholder="信箱" value="${param.memMail}">
	<span id="mail" style="color: red;"></span>
</div>

<div class="form-group">
	<input type="text" name="memAddr" id="memAddr" tabindex="1"
		class="form-control" placeholder="地址" value="${param.memAddr}">
	<span id="addr" style="color: red;"></span>
</div>
<div class="form-group">
	<input type="text" name="memPhone" id="memPhone" tabindex="1"
		class="form-control" placeholder="電話" value="${param.memPhone}">
	<span id="phone" style="color: red;"></span>
</div>
<div class="form-group">
	<textarea name="memIntr" id="memIntr" tabindex="1" class="form-control"
		placeholder="自我介紹" style="resize:none;"></textarea>
	<span id="intr" style="color: red;"></span>
</div>
<div class="form-group">
	<div class="row">
		<div class="col-sm-3 col-sm-offset-3">
			<input type="hidden" name="action" value="insert"> <input
				type="submit" name="register-submit" id="register-submit"
				tabindex="4" class="form-control btn btn-register" value="送出">
		</div>
		<div class="col-sm-3 col-sm-offset-0">
			<input type="reset" name="register-submit" id="register-submit"
				tabindex="4" class="form-control btn btn-register" value="清除">
		</div>
	</div>
</div>