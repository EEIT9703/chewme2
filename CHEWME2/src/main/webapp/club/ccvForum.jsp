
<div class="row">
	<div class="col"></div>
	<div class="col-md-3">
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button"
				id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="true">
				Dropdown <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li role="separator" class="divider"></li>
				<li><a href="#">Separated link</a></li>
			</ul>
		</div>
	</div>
	<div class="col-md-3">
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button"
				id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="true">
				Dropdown <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li role="separator" class="divider"></li>
				<li><a href="#">Separated link</a></li>
			</ul>
		</div>
	</div>
	<div class="col-md-6"></div>
	<div class="row">
		<div class="col"></div>
	</div>
</div>

<c:forEach var="issue" items="${issue_list}">
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Panel title</h3>
	</div>
	<div class="panel-body">
		<ul class="list-group">
			<li class="list-group-item">
				<div class="row">
					<div class="col-xs-1 col-sm-1 col-md-1">
						<img src="http://via.placeholder.com/50x50"></img>
					</div>
					<div class="col-xs-10 col-sm-10 col-md-11">
						<div class="well">...</div>
					</div>

				</div>
			</li>
			<li class="list-group-item">
				<div class="row">
					<div class="col-xs-1 col-sm-1 col-md-1 col-md-offset-1">
						<img src="http://via.placeholder.com/50x50"></img>
					</div>
					<div class="col-xs-10 col-sm-10 col-md-10">
						<div class="well">...</div>
					</div>
				</div>
			</li>
			<li class="list-group-item">
				<div class="row">
					<div class="col-xs-1 col-sm-1 col-md-1 col-md-offset-1">
						<img src="http://via.placeholder.com/50x50"></img>
					</div>
					<div class="col-xs-10 col-sm-10 col-md-10">
						<div class="well">...</div>
					</div>
				</div>
			</li>			
			<li class="list-group-item">
				<div class="row">
					<div class="col-xs-1 col-sm-1 col-md-1 col-md-offset-1">
						<img src="http://via.placeholder.com/50x50"></img>
					</div>
					<div class="col-xs-10 col-sm-10 col-md-10">
						<div class="well">...</div>
					</div>

				</div>
			</li>
			<li class="list-group-item">
				<div class="row">
					<div class="col-xs-1 col-sm-1 col-md-1 col-md-offset-1">
						<img src="http://via.placeholder.com/50x50"></img>
					</div>
					<div class="col-xs-10 col-sm-10 col-md-9">
						<textarea class="full" style="resize: none;"></textarea>
					</div>
					<div class="col-xs-1 col-sm-1 col-md-1"></div>
						<button type="submit"class="btn btn-primary btn-md"
										name="comment">送出</button>
					<div class="container"></div>

				</div>
			</li>		
		</ul>
	</div>
</div>
</c:forEach>