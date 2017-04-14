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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>首页</title>
</head>
<body>
	<header class="header">
	<div class="fix_nav">
		<div
			style="max-width: 768px; margin: 0 auto; height: 44px; position: relative; background: #000000;">
			<form action="/m_search/list" method="get" id="searchform"
				name="searchform">
				<div class="navbar-search left-search">
					<input type="text" id="keyword" name="keyword" value=""
						placeholder="搜索商品" class="form-control">
				</div>
				<div class="nav-right">
					<input type="button" value="搜索" onclick="searchproduct();"
						class="img-responsive"
						style="text-align: center; background: #ccc; border-radius: 5px; border: none; height: 34px; vertical-align: middle; clear: both; padding: 0px; width: 42px;" />
				</div>
			</form>
		</div>
	</div>
	</header>

	<div class="container">
		<div class="row">
			<div id="slide">
				<div class="hd">
					<ul>
						<li class="on">1</li>
						<li class="on">2</li>
						<li class="on">3</li>
					</ul>
				</div>
				<div class="bd">
					<div class="tempWrap" style="overflow: hidden; position: relative;">
						<ul
							style="width: 3840px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translateX(-768px);">
							<li
								style="display: table-cell; vertical-align: top; width: 768px;">
								<a href="http://m.legendshop.cn/m_search/list?categoryId=36"
								target="_blank"> <img src="img/scroll1.jpg" alt="电视"
									ppsrc="img/scroll1.jpg">
							</a>
							</li>
							<li
								style="display: table-cell; vertical-align: top; width: 768px;">
								<a href="http://m.legendshop.cn/m_search/list?categoryId=38"
								target="_blank"> <img src="img/scroll2.jpg" alt="电饭煲"
									ppsrc="img/scroll2.jpg">
							</a>
							</li>
							<li
								style="display: table-cell; vertical-align: top; width: 768px;">
								<a href="http://m.legendshop.cn/m_search/list?categoryId=38"
								target="_blank"> <img src="img/scroll3.jpg" alt="电脑办公"
									ppsrc="img/scroll3.jpg">
							</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<script charset="utf-8" src="js/TouchSlide.js"></script>

		<script type="text/javascript">
			TouchSlide({
				slideCell : "#slide",
				titCell : ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
				mainCell : ".bd ul",
				effect : "left",
				autoPlay : true,//自动播放
				autoPage : true, //自动分页
				switchLoad : "_src" //切换加载，真实图片路径为"_src"
			});
		</script>
		<div class="row category">
			<a href="<%= basePath%>/getHot" class="col-xs-3"> <img
				class="img-responsive" src="image/m-index_12.png">
				<h4>热门</h4>
			</a> <a href="<%= basePath%>/getNew" class="col-xs-3"> <img
				class="img-responsive" src="image/m-index_14.png">
				<h4>新品</h4>
			</a> <a href="/theme/allThemes" class="col-xs-3"> <img
				class="img-responsive" src="image/m-index_22.png">
				<h4>专题列表</h4>
			</a> <a href="<%= basePath%>/getBand" class="col-xs-3"> <img class="img-responsive"
				src="image/m-index_26.png">
				<h4>品牌</h4>
			</a>
		</div>

		<div class="row">

			<!--产品块-->
			<div class="tb_box">
				<h2 class="tab_tit">
					<a class="more"
						href="">更多</a>
					1F 电视区
				</h2>

				<c:if test="${dianshi == null || fn.length(dianshi) == 0}">
					<h2 class="tab_head">空空如也，请耐心等待上线</h2>
				</c:if>
				<c:forEach items="${dianshi}" var="item" varStatus="status">
				<c:choose>
					 <c:when test="${( (status.index / 3) % 2 ) == 0}">
							<c:if test="${(status.index) % 3 == 0 && ( (status.index / 3) % 2 ) == 0}">
								<div class="tb_type tb_type_even clearfix">
							</c:if>
							<c:if test="${(status.index) % 3 == 0}">
								<a class="tb_floor" href="<%= basePath%>/product/view/${item.prodId}"> <img
									src="<%= basePath%>/${item.imgUrls[0]}"
									style="width: 100%;">
									<p align="center" style="color: black; font-size: 12px">${item.prodName}</p>
									<p align="center" style="color: red; font-size: 14px">${item.prodPrize} 元</p>
								</a>
							</c:if>
	
							<c:if test="${(status.index) % 3 == 1}">
								<a class="th_link" href="<%= basePath%>/product/view/${item.prodId}"> <img class="tb_pic"
									src="<%= basePath%>/${item.imgUrls[0]}"
									style="width: 100%;">
									<p align="center" style="color: black; font-size: 12px">${item.prodName}</p>
									<p align="center" style="color: red; font-size: 14px">${item.prodPrize} 元</p>
								</a>
							</c:if>
	
							<c:if test="${(status.index) % 3 == 2}">
								<a class="th_link tb_last" href="<%= basePath%>/product/view/${item.prodId}"> <img
									class="tb_pic" src="<%= basePath%>/${item.imgUrls[0]}"
									style="width: 100%;">
									<p align="center" style="color: black; font-size: 12px">${item.prodName}</p>
									<p align="center" style="color: red; font-size: 14px">${item.prodPrize} 元</p>
								</a>
							</c:if>
	
							<c:if test="${ ( status.index % 3 ) == 2 && ( (status.index / 3) % 2 ) == 0}">
								</div>
							</c:if>
						
						</c:when>
					
						<c:otherwise>
							<c:if test="${(status.index) % 3 == 0 && ( (status.index / 3) % 2 ) == 1}">
								<div class="b_type clearfix">
							</c:if>
						
							<c:if test="${(status.index) % 3 == 0}">
								<a class="tb_floor" href="<%= basePath%>/product/view/${item.prodId}"> <img
									src="<%= basePath%>/${item.imgUrls[0]}"
									style="width: 100%;">
									<p align="center" style="color: black; font-size: 12px">${item.prodName}</p>
									<p align="center" style="color: red; font-size: 14px">${item.prodPrize} 元</p>
								</a>
							</c:if>
	
							<c:if test="${(status.index) % 3 == 1}">
								<a class="th_link" href="<%= basePath%>/product/view/${item.prodId}"> <img class="tb_pic"
									src="<%= basePath%>/${item.imgUrls[0]}"
									style="width: 100%;">
									<p align="center" style="color: black; font-size: 12px">${item.prodName}</p>
									<p align="center" style="color: red; font-size: 14px">${item.prodPrize} 元</p>
								</a>
							</c:if>
	
							<c:if test="${(status.index) % 3 == 2}">
								<a class="th_link tb_last" href="<%= basePath%>/product/view/${item.prodId}"> <img
									class="tb_pic" src="<%= basePath%>/${item.imgUrls[0]}"
									style="width: 100%;">
									<p align="center" style="color: black; font-size: 12px">${item.prodName}</p>
									<p align="center" style="color: red; font-size: 14px">${item.prodPrize} 元</p>
								</a>
							</c:if>
						
							<c:if test="${ ( status.index % 3 ) == 2 && ( (status.index / 3) % 2 ) == 1}">
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
			</c:forEach>

		</div>
		<!--产品块-->
		<!-- 		<div class="tb_box">
				<h2 class="tab_tit">
					<a class="more"
						href="http://m.legendshop.cn/m_search/list?categoryId=38">更多</a>
					服饰鞋帽
				</h2>

				<div class="tb_type clearfix">
					<a class="tb_floor" href="views.html"> <img
						src="img/0bbbb6bf-0d00-45c0-92f7-347377f2edb5.jpg"
						style="width: 100%;">
					</a> <a class="th_link" href="views.html"> <img class="tb_pic"
						src="img/0d86960d-20b5-4dd3-afee-8453b5ea5e95.jpg"
						style="width: 100%;">
					</a> <a class="th_link tb_last" href="views.html"> <img
						class="tb_pic" src="img/1e13498f-419d-4ebd-a3b2-d0ad95ceaa39.jpg"
						style="width: 100%;">
					</a>
				</div>
			</div> -->
		<!--产品块-->
		<!-- <div class="tb_box">
				<h2 class="tab_tit">
					<a class="more"
						href="http://m.legendshop.cn/m_search/list?categoryId=35">更多</a>
					数码办公
				</h2>

				<div class="tb_type tb_type_even clearfix">
					<a class="tb_floor" href="views.html"> <img
						src="img/bd6771d9-f220-454d-83b2-d58d2046d23a.jpg"
						style="width: 100%;">
					</a> <a class="th_link" href="views.html"> <img class="tb_pic"
						src="img/04ef50d9-97f0-4fea-8359-ee21376df392.jpg"
						style="width: 100%;">
					</a> <a class="th_link tb_last" href="views.html"> <img
						class="tb_pic" src="img/d07a93ef-cdff-4b21-a12b-d817890aa6d6.jpg"
						style="width: 100%;">
					</a>
				</div>
			</div> -->
	</div>

	</div>

	<div class="foot_index">
		<div class="foot_index_tit">赵楷佳</div>
		<div class="foot_index_rx">服务热线：13728734092</div>
	</div>

	<footer class="footer">
	<div class="foot-con">
		<div class="foot-con_2">
			<a href="<%= basePath%>/index" class="active"> <i class="navIcon home"></i> <span
				class="text">首页</span>
			</a> <a href="<%= basePath%>/category"> <i class="navIcon sort"></i> <span
				class="text">分类</span>
			</a> <a href="<%= basePath%>/shopcart"> <i class="navIcon shop"></i> <span
				class="text">购物车</span>
			</a> <a href="<%= basePath%>/userhome"> <i class="navIcon member"></i> <span
				class="text">我的</span>
			</a>
		</div>
	</div>
	</footer>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#slide img").each(function() {
				var img_src = $(this).attr("_src");
				$(this).attr("src", img_src);
			});
		});

		function searchproduct() {
			var keyword = document.getElementById("keyword").value;
			if (keyword == undefined || keyword == null || keyword == "") {
				alert("请输入搜索关键字！");
				return false;
			}
			document.getElementById("searchform").submit();
		}
	</script>
</body>
</html>