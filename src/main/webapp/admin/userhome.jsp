<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"
	scope="session" />
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script charset="utf-8" src="<%=basePath%>/js/jquery.min.js?v=01291"></script>
<script charset="utf-8" src="<%=basePath%>/js/global.js?v=01291"></script>
<script charset="utf-8" src="<%=basePath%>/js/bootstrap.min.js?v=01291"></script>
<script charset="utf-8" src="<%=basePath%>/js/template.js?v=01291"></script>

<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.css?v=01291">
<link rel="stylesheet" href="<%=basePath%>/css/style.css?v=1?v=01291">
<link rel="stylesheet" href="<%=basePath%>/css/member.css?v=01291">
<link rel="stylesheet" href="<%=basePath%>/css/order3.css?v=01291">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no" name="format-detection">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport"
	content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
<title>会员中心</title>
<script type="text/javascript">
	$(document).ready(function() {
		var attr = parseInt($(".member_m_pic_1").height());
		var attr3 = parseInt($(".member_m_z_1").height());
		var h = attr - attr3;
		var clientWidth = document.body.clientWidth;
		$(".member_mp_t_img img").css("width", clientWidth * 0.3);
		$(".member_mp_t_img img").css("height", clientWidth * 0.3);

		handleUserPic();
	});

	function handleUserPic() {
		var th = $(".member_m_pic").outerHeight(true);
		if (th < 60) {
			setTimeout("handleUserPic", 500);
		} else {
			$(".member_m_pic .img-circle").css("height", th * 0.9);
			$(".member_m_pic .img-circle").css("width", th * 0.9);
		}

	}
</script>
</head>
<body>
	<div class="maincontainer">
		<div class="container" style="max-width: 768px; margin: 0 auto;">
			<div class="row">
				<c:choose>
				   <c:when test="${status == 0}">  
				        <div class="member_top member_top_1">
							<div class="member_top_bg">
								<img src="<%= basePath%>/images/member_bg.png">
							</div>
							<div class="member_m_pic member_m_pic_1">
								<img class="img-circle" src="<%= basePath%>/images/noavatar.png">
							</div>
							<div class="member_m_z member_m_z_1">
								<div class="member_m_x"><a href="<%=basePath%>/login" style="color:white">未登录</a></div>
							</div>
						</div>     
				   </c:when>
				   <c:otherwise> 
				   	    <div class="member_top member_top_1">
							<div class="member_top_bg">
								<img src="<%= basePath%>/images/member_bg.png">
							</div>
							<div class="member_m_pic member_m_pic_1">
								<img class="img-circle" src="<%= basePath%>/images/picBg.jpg">
							</div>
							<div class="member_m_z member_m_z_1">
								<div class="member_m_x">${user.userName}</div>
							</div>
							<div class="member_m_r"><a href="<%=basePath%>/userToAddAddress" style="color:white">收货地址&gt;</a>
							</div>
						</div>   
				   </c:otherwise>
				</c:choose>
			
				<div class="list-group mb10">
					<a href="<%= basePath%>/userOrder/0" class="list-group-item tip">
						<div class="list_group_img">
							<img src="<%= basePath%>/images/member_img16.png">
						</div> 我的订单 <span class="gary pull-right">查看全部</span>
					</a>
					<div class="list-group-item p0 clearfix">
						<div class="col-xs-3 p0">
							<a class="order_tab_link" href="<%= basePath%>/userOrder/1"> <em
								class="order_img"> <img src="<%= basePath%>/images/order_bg_3.png"></em>待付款

							</a>
						</div>
						<div class="col-xs-3 p0">
							<a class="order_tab_link" href="<%= basePath%>/userOrder/2"> <em
								class="order_img"> <img src="<%= basePath%>/images/order_bg_2.png"></em>待发货
							</a>
						</div>
						<div class="col-xs-3 p0">
							<a class="order_tab_link" href="<%= basePath%>/userOrder/3"> <em
								class="order_img"> <img src="<%= basePath%>/images/order_bg_1.png"></em>待收货
							</a>
						</div>
						<div class="col-xs-3 p0">
							<a class="order_tab_link" href="<%= basePath%>/userOrder/4"> <em
								class="order_img"> <img src="<%= basePath%>/images/order_bg.png"></em>已完成
							</a>
						</div>
					</div>
				</div>
				<div class="list-group mb10 member_list_group clearfix">
					<a href="<%= basePath%>/myCollection" class="list-group-item col-xs-4">
						<div class="m_img">
							<img src="<%= basePath%>/images/order_bg_5.png">
						</div>
						<p class="m_name">我的收藏</p> <span class="red">${favorCount}</span>
					</a> <a href="<%= basePath%>/myRepair" class="list-group-item col-xs-4">
						<div class="m_img">
							<img src="<%= basePath%>/images/order_bg_8.png">
						</div>
						<p class="m_name">我的保修</p> <span class="red">&nbsp;&nbsp;</span>
					</a> <a href="<%= basePath%>/noBuyRepair" class="list-group-item col-xs-4">
						<div class="m_img">
							<img src="<%= basePath%>/images/order_bg_4.png">
						</div>
						<p class="m_name">申请维修</p> <span class="red">&nbsp;&nbsp;</span>
					</a> <a href="" class="list-group-item col-xs-4">
						<div class="m_img">
							<img src="<%= basePath%>/images/order_bg_7.png">
						</div>
						<p class="m_name">系统消息</p> <span class="red">&nbsp;&nbsp;</span>
					</a>

				</div>

				<div class="list-group mb10">
					<a onclick="tanchu()" class="list-group-item tip">
						<div class="list_group_img">
							<img src="<%= basePath%>/images/order_bg_10.png">
						</div> 常见问题
					</a> <a onclick="tanchu()" class="list-group-item tip">
						<div class="list_group_img">
							<img src="<%= basePath%>/images/order_bg_9.png">
						</div> 意见反馈
					</a>
				</div>
				
				<c:choose>
				   <c:when test="${status == 0}">  
				         <div class="list-group mb10" style="text-align:center;">
							<a href="<%= basePath%>/login" class="list-group-item" style>
								登录 
							</a>
						</div>    
				   </c:when>
				   <c:otherwise> 
				   	   <div class="list-group mb10" style="text-align:center;">
							<a onclick="logout()" class="list-group-item" style>
								退出登录 
							</a>
						</div>
				   </c:otherwise>
				</c:choose>
			</div>
		</div>
		<div style="display: none;" class="modal fade" id="myModalmin"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form class="form-horizontal" role="form" data-method="formAjax">
						<div class="modal-header member_tc_top">
							<button type="button" class="close member_tc_xx"
								data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">&nbsp;&nbsp;</h4>
						</div>
						<div style="overflow: hidden; width: 100%; padding-top: 20px;">
							<div style="">
								<div class="member_mp_t_img">
									<img src="<%= basePath%>/images/noavatar.png">
								</div>
								<div class="member_mp_t_m">赵楷佳</div>
								<div class="member_mp_t_m_m">
									<img src="img/a909bfc1-cada-4008-81c0-556ff86aace1.jpg">
								</div>
								<div class="member_mp_t_tit">用微信扫一扫二维码</div>
							</div>
						</div>
						<div style="height: 60px;"></div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">提示</h4>
							</div>
							<div class="modal-body" id="modalTitle">您尚未登录，无法加入购物车</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>
		
		<footer class="footer">
		<div class="foot-con">
			<div class="foot-con_2">
				<a href="<%= basePath%>/index"> <i class="navIcon home"></i> <span
					class="text">首页</span>
				</a> <a href="<%= basePath%>/category"> <i class="navIcon sort"></i> <span
					class="text">分类</span>
				</a> <a href="<%= basePath%>/shopcart"> <i class="navIcon shop"></i> <span
					class="text">购物车</span>
				</a> <a href="<%= basePath%>/userhome" class="active"> <i class="navIcon member"></i> <span
					class="text">我的</span>
				</a>
			</div>
		</div>
		</footer>
	</div>
	
	<script type="text/javascript">
		function logout() {
			jQuery.ajax({
				url : "${ctx}/logout",
				type : 'post',
				async : false, //默认为true 异步   
				dataType : 'json',
				error : function(data) {
					$('#modalTitle').html("服务器崩溃");
					$('#myModal').modal('show');
				},
				success : function(retData) {
					$('#modalTitle').html(retData.message);
					$('#myModal').modal('show');
					location.reload();
				}
			});
		}
		
		function tanchu() {
			$('#modalTitle').html("请联系：赵楷佳 13728734092");
			$('#myModal').modal('show');
		}
	</script>
</body>
</html>