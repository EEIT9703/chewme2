<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row">										
						<div class="col-md-4">
							<div class="thumbnail">
								<div class="product-item">
									<div class="pi-img-wrapper">									
										<img id="act_photo" src="data:image/png;base64,${activityVO.act_photo}"
											class="img-responsive" alt="">
										<div>
											<a href="#" class="btn">View</a>
										</div>
									</div>
									<h3>
										<a href="shop-item.html" id="act_name">${activityVO.act_name}</a>
									</h3>
									<div class="pi-price" id="act_current">${activityVO.act_current}</div>
									<a href="javascript:;" class="btn add2cart">Add to cart</a>
									<div class="sticker sticker-new"></div>																
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>