<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <div class="row">
    	<div class="col-md-12" id="div1">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail" >
					<h4 class="text-center"><span class="label label-info"></span></h4>
					<img src="data:image/png;base64,${activityVO.act_photo}" id="act_photo" class="img-responsive">
					<div class="caption">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<h3>Galaxy S5</h3>
							</div>
							<div class="col-md-6 col-xs-6 price">
								<h3>
								<label>$649.99</label></h3>
							</div>
						</div>
						<p>${activityVO.act_name}</p>
						<div class="row">
							<div class="col-md-6">
								<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
							</div>
							<div class="col-md-6">
								<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
						</div>

						<p> </p>
					</div>
				</div>
			</div>
					</div>
				</div>
			</div>