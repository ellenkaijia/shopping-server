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
<script charset="utf-8" src="<%= basePath%>/js/jquery.min.js?v=01291"></script>
<script charset="utf-8" src="<%= basePath%>/js/global.js?v=01291"></script>
<script charset="utf-8" src="<%= basePath%>/js/bootstrap.min.js?v=01291"></script>
<script charset="utf-8" src="<%= basePath%>/js/template.js?v=01291"></script>

<link rel="stylesheet" href="<%= basePath%>/css/bootstrap.css?v=01291">
<link rel="stylesheet" href="<%= basePath%>/css/style.css?v=1?v=01291">
<link rel="stylesheet" href="<%= basePath%>/css/member.css?v=01291">
<link rel="stylesheet" href="<%= basePath%>/css/order3.css?v=01291">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no" name="format-detection">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport"
	content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
<title>分类</title>
<script charset="utf-8" src="<%= basePath%>/js/category.js?v=01291"></script>
</head>
<body>
	<header class="header">
	<div class="fix_nav">
		<div class="nav_inner">
			<a class="nav-left back-icon" href="javascript:history.go(-1);">返回</a>
			<div class="tit">分类</div>
			<div class="sousuo" id="sousou">
				<img src="<%= basePath%>/images/sou.png">
			</div>
		</div>
	</div>
	</header>
	<div
		style="overflow: hidden; position: fixed; width: 100%; z-index: 10000; top: 0px;">
		<div class="order_top_count" style="display: none;">
			<div class="order_top">
				<div class="order_a_l">
					<div id="nav-left_ll">
						<img src="<%= basePath%>/images/order_top_l.png">
					</div>
				</div>
				<div class="order_sou">
					<form action="/m_search/list" method="get" id="searchform"
						name="searchform">
						<input name="keyword" id="keyword" placeholder="搜索商品" type="text"
							value=""> <span class="pro_sou" style="cursor: pointer;"
							onclick="searchproduct();"><img src="<%= basePath%>/images/Search.png"></span>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--  
<div class="sou_count">
	<div class="sou_cou_i sou_none">
			<div class="sou_cou_h sou_cou_h1">猜你喜欢</div>
			<a href="http://wx.aimbeauty.cn/product.html?cps_id=92491&amp;k=%E7%B2%BE%E5%8D%8E"><div class="sou_cou_h2">精华</div></a>
	</div>
	<div class="sou_cou_i">
			<a href="http://wx.aimbeauty.cn/product.html?cps_id=92491&amp;k=%E9%9D%A2%E8%86%9C"><div class="sou_cou_h">面膜</div></a>
			<a href="http://wx.aimbeauty.cn/product.html?cps_id=92491&amp;k=%E6%B4%81%E9%9D%A2"><div class="sou_cou_h2">洁面</div></a>
	</div>
	<div class="sou_cou_i ">
			<a href="http://wx.aimbeauty.cn/product.html?cps_id=92491&amp;k=%E9%98%B2%E6%99%92%E9%9C%9C"><div class="sou_cou_h">防晒霜</div></a>
			<a href="http://wx.aimbeauty.cn/product.html?cps_id=92491&amp;k=%E8%A1%A5%E6%B0%B4"><div class="sou_cou_h2">补水</div></a>
	</div>
</div>
-->

	<div class="container">
		<div class="row" id="row_5">
			<div class="sort-arat" style="margin-top: 10px;">
				<ul>
					<c:if test="${sort == null || fn:length(sort) <= 0}">
							<li><p stye="color:black; text-align:center" >空空如也</p></li>
					</c:if>
					<c:forEach items="${sort}" var="item" varStatus="status">
								<li><a href="<%= basePath%>/getSortCategoryList/${item.sortId}"> <img alt="图片大小为200*105"
									src="<%= basePath%>/${item.imgUrl}"
									style="height: 90px;" />
									<p>${item.sortName}</p>
							</a></li>
					</c:forEach>
					<!-- <li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/9cb5861c-5ff8-42b8-8c9b-0f6b4a53cde9.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">礼品箱包</div>
					</a></li>
					<li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/65bd9fc8-7f5e-4dba-b083-0c05b1bc9b96.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">家居家装</div>
					</a></li>
					<li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/2e7b0a93-2da2-437e-adde-ffba0cfbe218.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">数码办公</div>
					</a></li>
					<li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/f91ac28f-b66c-45e0-9752-41bcfa0302c7.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">服饰鞋帽</div>
					</a></li>
					<li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/ce94d818-bc17-4028-9c5f-cd22e6661d83.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">家用电器</div>
					</a></li>
					<li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/977a1fc2-0ee7-4f73-a7f6-eea5b73f642b.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">个护化妆</div>
					</a></li>
					<li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/8d502712-32ed-4301-a4e7-45b1ea4aaa77.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">厨房餐饮</div>
					</a></li>
					<li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/2cf2f1f9-df47-47bc-be52-c5d70af53778.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">珠宝手表</div>
					</a></li>
					<li><a href="category_list.html"> <img alt="图片大小为100*100"
							style="width: initial; height: 100px;"
							src="img/1613e012-64fa-444a-b4de-83ebd804b0d6.jpg">
							<div
								style="width: 90%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; text-align: center; margin: auto;">运动健康</div>
					</a></li> -->
			</div>

			<div class="mt10 white-bg">
				<h4 class="sort-tit">品牌分类</h4>
				<div class="sort-arat brand-areat">
					<ul>
						<c:if test="${band == null || fn:length(band) <= 0}">
							<li><p stye="color:black; text-align:center" >空空如也</p></li>
						</c:if>
						<c:forEach items="${band}" var="item" varStatus="status">
								<li><a href="<%= basePath%>/getBandCategoryList/${item.bandId}"> <img alt="图片大小为200*105"
									src="<%= basePath%>/${item.imgUrl}"
									style="height: 60px;" />
									<p>${item.bandName}</p>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer">
	<div class="foot-con">
		<div class="foot-con_2">
			<a href="<%= basePath%>/index"> <i class="navIcon home"></i> <span
				class="text">首页</span>
			</a> <a href="<%= basePath%>/category" class="active"> <i class="navIcon sort"></i> <span
				class="text">分类</span>
			</a> <a href="<%= basePath%>/shopcart"> <i class="navIcon shop"></i> <span
				class="text">购物车</span>
			</a> <a href="<%= basePath%>/userhome"> <i class="navIcon member"></i> <span
				class="text">我的</span>
			</a>
		</div>
	</div>
	</footer>
</body>
</html>