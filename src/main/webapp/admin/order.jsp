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
<script charset="utf-8" src="<%= basePath %>/js/jquery.min.js?v=01291"></script>
<script charset="utf-8" src="<%= basePath %>/js/global.js?v=01291"></script>
<script charset="utf-8" src="<%= basePath %>/js/bootstrap.min.js?v=01291"></script>
<script charset="utf-8" src="<%= basePath %>/js/template.js?v=01291"></script>

<link rel="stylesheet" href="<%= basePath %>/css/bootstrap.css?v=01291">
<link rel="stylesheet" href="<%= basePath %>/css/style.css?v=1?v=01291">
<link rel="stylesheet" href="<%= basePath %>/css/member.css?v=01291">
<link rel="stylesheet" href="<%= basePath %>/css/order3.css?v=01291">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no" name="format-detection">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport"
	content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
<script charset="utf-8" src="<%= basePath %>/js/jquery.form.js?v=01291"></script>
<title>订单列表</title>
</head>
<body>
	<div class="fanhui_cou">
		<div class="fanhui_1"></div>
		<div class="fanhui_ding">顶部</div>
	</div>
	<header class="header">
	<div class="fix_nav">
		<div class="nav_inner">
			<a class="nav-left back-icon" href="javascript:history.back();">返回</a>
			<div class="tit">订单列表</div>
		</div>
	</div>
	</header>

	<div class="container" id="container2">
		<div class="row">
			
			<div class="item-list" id="container" rel="2" status="0">
				<c:if test="${orders == null || fn.length(orders) == 0}">
					<ul class="list-group">
						<li><p stye="color:black; text-align:center" >目前没有订单</p></li>
					</ul>
				</c:if>
				<c:forEach items="${orders}" var="item" varStatus="status">
					<a 
					href="<%= basePath%>/order/${item.orderId}">
					<div class="hproduct clearfix"
						style="background: #fff; border-top: 0px;">
						<div class="p-pic">
							<img style="max-height: 100px; margin: auto;"
								class="img-responsive"
								src="<%= basePath %>/images/picBg.jpg">
						</div>
						<div class="p-info">
							<p class="p-title">${item.prodName}</p>
							<p class="p-origin">
								<em class="price"><span style="color:black; font-size:10px">单价</span> ¥${item.prodPrize}</em>
							</p>
							<p class="p-origin">
								<em class="price"><span style="color:black; font-size:10px">交易金额</span>  ¥${item.prodPrizeSum}</em>
							</p>
							<p class="p-origin" style="float:right" >
								<span style="color:red; font-size:15px">${item.dateStr}</span>
							</p>
							<p class="p-origin" style="float:right" >
								<span style="color:red; font-size:15px">${item.dateStr}</span>
							</p>
						</div>
					</div>
				</a>
				</c:forEach>
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
								<button type="button" class="btn btn-primary" id="buttonToLogin" onclick="loginTo()">
								去登录</button>
							</div>
						</div>
					</div>
				</div>

	<script type="text/javascript">
		function deleteMyCollection(prodId) {
			 jQuery.ajax({
				url : '${ctx}' + "/removeCollection",
				data : {
					"prodId" : prodId
				},
				type : 'post',
				async : false, //默认为true 异步   
				dataType : 'json',
				error : function(data) {
				},
				success : function(retData) {
					if(retData.code == 0) {
						location.reload();
					}
				}
			}); 
		}
	</script>
	<div class="clear"></div>

</body>
</html>