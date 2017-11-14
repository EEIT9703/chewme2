<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<p></p>
	<div class="panel panel-default" style="width: 80%">
		<div class="panel-body">${clubVOForView.clubName}的簡介</div>
		<div id="briefpanel">
			<div class="panel-footer"><p>${clubVOForView.brief}</p></div>
		</div>
		<div id="briefdiv" hidden>
			<textarea id="brieftextarea"  rows="4" cols="50">${clubVOForView.brief}</textarea>
			<button id="briefbutton" >更改</button>
		</div>
	</div>
</div>
