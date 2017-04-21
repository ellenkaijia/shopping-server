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
<script charset="utf-8" src="js/jquery.min.js?v=01291"></script>
<script charset="utf-8" src="js/global.js?v=01291"></script>
<script charset="utf-8" src="js/bootstrap.min.js?v=01291"></script>
<script charset="utf-8" src="js/template.js?v=01291"></script>

<link rel="stylesheet" href="css/bootstrap.css?v=01291">
<link rel="stylesheet" href="css/style.css?v=1?v=01291">
<link rel="stylesheet" href="css/member.css?v=01291">
<link rel="stylesheet" href="css/order3.css?v=01291">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no" name="format-detection">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport"
	content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
<title>品牌</title>
<script charset="utf-8" src="js/category.js?v=01291"></script>
</head>
<body>
	<header class="header">
	<div class="fix_nav">
		<div class="nav_inner">
			<a class="nav-left back-icon" href="javascript:history.go(-1);">返回</a>
			<div class="tit">品牌</div>
			<div class="sousuo" id="sousou">
				<img src="images/sou.png">
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
						<img src="images/order_top_l.png">
					</div>
				</div>
				<div class="order_sou">
					<form action="" method="get" id="searchform"
						name="searchform">
						<input name="keyword" id="keyword" placeholder="搜索商品" type="text"
							value=""> <span class="pro_sou" style="cursor: pointer;"
							onclick="searchproduct();"><img src="images/Search.png"></span>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row" id="row_5">
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
						<!-- <li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/899329e3-9ec3-466b-856f-15f2a91b72a4.jpg"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/276aed28-5c4c-4ded-9070-59719e583ee5.jpg"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/01d5dc75-9e5d-405f-bf93-5793fec72e24.jpg"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/a5b3890a-7d78-4bac-be54-45febc984835.jpg"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/e6657ca7-c4c5-43fc-9bd6-29999102fc61.jpg"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/7865e470-0296-4f6b-98aa-30ab9824358d.jpg"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/b5804b78-d14c-4e34-bd39-244183f92997.jpg"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/ee767da6-119b-4463-a376-72eb0f495629.png"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/917b4ded-1980-4602-8ad6-a5fa95a9b3b9.jpg"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/ef8d9883-7711-4142-8533-5d7cf91082e4.png"
								style="height: 39px;" />
						</a></li>
						<li><a href="category_list.html"> <img alt="图片大小为200*105"
								src="img/a265b462-4d22-4914-951b-4068d533be6b.png"
								style="height: 39px;" />
						</a></li> -->
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>