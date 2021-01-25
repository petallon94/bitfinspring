<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/chat/bootstrap.css">
<link rel="stylesheet" href="css/chat/custom.css">
<meta charset="UTF-8">
<title>실시간 채팅</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>실시간 채팅</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="paner-collapse collapse in">
							<div class="portlet-body chat-widget" style="overflow-y:auto; width:565px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-mute small">2021년 1월 22</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="/image/scappy.jpg">
											</a>
									 		<div class="media-body">
												<h4 class="media-heading">
													김철남<span class="small pull-right">오전 12:23</span>
												</h4>
											</div>
											<p>의사선생님 문의하고싶어요</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="/image/scappy.jpg">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													이병원<span class="small pull-right">오전 12:25</span>
												</h4>
											</div>
											<p>어떤게 궁금하신가요?</p>
										</div>
									</div>
								</div>
								<div class="portlet-footer">
									<div class="row">
										<div class="form-group col-xs-4">
											<input style="height: 40px;" type="text" id="chatName" class="form-control" placeholder="${mdto.mnick}" >
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>