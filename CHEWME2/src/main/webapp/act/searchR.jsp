<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
  <div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row" id="div1">
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="" src="data:image/png;base64,${activityVO.act_photo}" id=""/>
								<div class="caption">
									<p>${activityVO.act_name}</p>
									<p>
										<a class="btn btn-primary" href="#" id="act_name">${activityVO.act_name}</a>
										<a class="btn btn-primary" href="#" id="act_groups">成團人數:${activityVO.act_groups}</a>
									</p>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>