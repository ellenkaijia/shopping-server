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
<script charset="utf-8" src="js/jquery.form.js?v=01291"></script>
<script charset="utf-8" src="js/prodSort.js?v=01291"></script>
<title>商品列表</title>
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
			<div class="tit">产品列表</div>
		</div>
	</div>
	</header>

	<div class="container" id="container2">
		<div class="row">
			<ul class="mod-filter clearfix">
				<div class="white-bg_2 bb1">

					<li id="default" class="active"><a title="默认排序"
						href="javascript:void(0);">默认</a></li>
					<li id="buys"><a title="点击按销量从高到低排序"
						href="javascript:void(0);">销量 <i class='icon_sort'></i>
					</a></li>
					<li id="comments"><a title="点击按评论数从高到低排序"
						href="javascript:void(0);">评论数 <i class='icon_sort'></i>
					</a></li>
					<li id="cash"><a title="点击按价格从高到低排序"
						href="javascript:void(0);">价格 <i class='icon_sort'></i>
					</a></li>
				</div>
			</ul>
            <input type="hidden" id="ListTotallist" value="1">
			<div class="item-list" id="container" rel="2" status="0">
				 <a
					href="views.html">
					<div class="hproduct clearfix"
						style="background: #fff; border-top: 0px;">
						<div class="p-pic">
							<img style="max-height: 100px; margin: auto;"
								class="img-responsive"
								src="img/ffb9f5ad-27c7-44e0-8a48-634a71872dfb.png">
						</div>
						<div class="p-info">
							<p class="p-title">好德</p>
							<p class="p-origin">
								<em class="price">¥10.00</em>
							</p>
							<p class="mb0">
								<del class="old-price">¥12.00</del>
							</p>
						</div>
					</div>
				</a>  <a href="views.html">
					<div class="hproduct clearfix"
						style="background: #fff; border-top: 0px;">
						<div class="p-pic">
							<img style="max-height: 100px; margin: auto;"
								class="img-responsive"
								src="img/3bec333d-f60a-48a3-999c-371c4fe67134.jpg">
						</div>
						<div class="p-info">
							<p class="p-title">BOSSsunwen正品专柜手包男包钱包皮包卡包商务S15-230643A1T</p>
							<p class="p-origin">
								<em class="price">¥550.00</em>
							</p>
							<p class="mb0">
								<del class="old-price">¥1048.00</del>
							</p>
						</div>
					</div>
				</a> 
			</div>

			<div id="ajax_loading"
				style="display: none; width: 300px; margin: 10px auto 15px; text-align: center;">
				<img src="images/loading.gif">
			</div>
			<div id="ajax_none"
				style="display: none; width: 300px; margin: 10px auto 15px; text-align: center;">
				<p class="p-title"> 没有更多数据了 </p>
			</div>
			<form action='<%=basePath%>/product/${whatCode}' method="post" id="list_form">
				<input type="hidden" id="curPageNO" name="curPageNO" value="0" /> <input
					type="hidden" id="orders" name="orders" value="date,asc" /> 
			    <input type="hidden" id="curPageNum" name="curPageNum" value="3" />
			</form>
		</div>
	</div>

	</script>
	<div class="clear"></div>

</body>
</html>