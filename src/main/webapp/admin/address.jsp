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
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link href="<%= basePath %>/base/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="<%= basePath %>/base/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="<%= basePath %>/base/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%= basePath %>/base/css/addstyle.css" rel="stylesheet" type="text/css">
<script src="<%= basePath %>/base/js/jquery.min.js"
	type="text/javascript"></script>
<script src="<%= basePath %>/base/js/amazeui.js"></script>

</head>

<body>
	<!--头 -->
	<!-- <header> <article>
	<div class="mt-logo">
		顶部导航条
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="#" target="_top" class="h">亲，请登录</a> <a href="#"
							target="_top">免费注册</a>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="#" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="#" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
					</div>
			</ul>
		</div> -->

		<!--悬浮搜索框-->

		<!-- <div class="nav white">
			<div class="logoBig">
				<li><img src="../images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div> -->

		<!-- <div class="clear"></div>
	</div>
	</div>
	</article> </header> -->

	<!-- <div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div> -->
	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
							&nbsp;
							&nbsp;
							&nbsp;
							&nbsp;
							<a class="am-text-danger am-text-lg" onclick="javascript:location.href = document.referrer">返回</a>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<c:if test="${addressList == null || fn:length(addressList) <= 0}">
							<p style="text-align:center">没有更多地址</p>
						</c:if>
						<c:forEach items="${addressList}" var="item" varStatus="status">
							<c:choose>
								<c:when test="${item.status == 1}">
									<li class="user-addresslist defaultAddr"><span
										class="new-option-r" addressId="${item.id}"><i class="am-icon-check-circle"></i>默认地址</span>
										<p class="new-tit new-p-re">
											<span class="new-txt">${item.userName}</span> <span class="new-txt-rd2">${item.userPhone}</span>
										</p>
										<div class="new-mu_l2a new-p-re">
											<p class="new-mu_l2cw">
												<span class="title">地址：</span>
												<span class="street">${item.userAddress}</span>
											</p>
										</div>
										<div class="new-addr-btn">
											  <a href="javascript:void(0);"
												onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
										</div></li>
								</c:when>
								
								<c:otherwise>
									<li class="user-addresslist"><span class="new-option-r" addressId="${item.id}"><i
											class="am-icon-check-circle"></i>设为默认</span>
										<p class="new-tit new-p-re">
											<span class="new-txt">${item.userName}</span> <span class="new-txt-rd2">${item.userPhone}</span>
										</p>
										<div class="new-mu_l2a new-p-re">
											<p class="new-mu_l2cw">
												<span class="title">地址：</span>
												<span class="street">${item.userAddress}</span>
											</p>
										</div>
										<div class="new-addr-btn">
											<a href="javascript:void(0);"
												onclick="delClick(this);" addressId="${item.id}"><i class="am-icon-trash"></i>删除</a>
										</div></li>
								</c:otherwise>
							</c:choose>
						
						</c:forEach>
						
					<!-- 	<li class="user-addresslist defaultAddr"><span
							class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">小叮当</span> <span class="new-txt-rd2">159****1622</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">湖北</span>省
									<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
										class="street">雄楚大道666号(中南财经政法大学)</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="#"><i class="am-icon-edit"></i>编辑</a> <span
									class="new-addr-bar">|</span> <a href="javascript:void(0);"
									onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
							</div></li>

						<li class="user-addresslist"><span class="new-option-r"><i
								class="am-icon-check-circle"></i>设为默认</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">小叮当</span> <span class="new-txt-rd2">159****1622</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">湖北</span>省
									<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
										class="street">雄楚大道666号(中南财经政法大学)</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="#"><i class="am-icon-edit"></i>编辑</a> <span
									class="new-addr-bar">|</span> <a href="javascript:void(0);"
									onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
							</div></li>
						<li class="user-addresslist"><span class="new-option-r"><i
								class="am-icon-check-circle"></i>设为默认</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">小叮当</span> <span class="new-txt-rd2">159****1622</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">湖北</span>省
									<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
										class="street">雄楚大道666号(中南财经政法大学)</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="#"><i class="am-icon-edit"></i>编辑</a> <span
									class="new-addr-bar">|</span> <a href="javascript:void(0);"
									onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
							</div></li>
							
							<li class="user-addresslist"><span class="new-option-r"><i
								class="am-icon-check-circle"></i>设为默认</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">小叮当</span> <span class="new-txt-rd2">159****1622</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">湖北</span>省
									<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
										class="street">雄楚大道666号(中南财经政法大学)</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="#"><i class="am-icon-edit"></i>编辑</a> <span
									class="new-addr-bar">|</span> <a href="javascript:void(0);"
									onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
							</div></li> -->
					</ul>
					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal">

									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" placeholder="收货人 必填">
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" id="user-phone" placeholder="手机号必填" type="email">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">
											<select data-am-selected id="whatProvince">
												<option value="a">广东省</option>
											</select> <select data-am-selected id="whatCity">
												<option value="a" >汕头市</option>
											</select> <select data-am-selected id="whatArea">
												<option value="a" >潮阳区</option>
												<option value="b">潮南区</option>
											</select>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro"
												placeholder="输入详细地址"></textarea>
											<small>100字以内写出你的详细地址,必填...</small>
										</div>
									</div>

									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<a class="am-btn am-btn-danger" disable="true" onclick="addAddress()">保存</a> <a
												href="javascript: void(0)"
												class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
								var id = $(this).attr("addressId");
								jQuery.ajax({
									url : '${ctx}' + "/updateAddressStatus",
									data : {
										"id" : id
									},
									type : 'post',
									async : false, //默认为true 异步   
									dataType : 'json',
									error : function(data) {
									},
									success : function(retData) {
										if (retData.code == 0) {
											$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
										}
									}
								});
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
						
						function addAddress() {
							var whatProvince = $("#whatProvince option:selected").html();
							var whatCity = $("#whatCity option:selected").html();
							var whatArea = $("#whatArea option:selected").html();
							var moreAddress = $("#user-intro").val();
							var userName = $("#user-name").val();
							var userPhone = $("#user-phone").val();
							
							var userAddress = whatProvince + whatCity + whatArea + moreAddress;
							
							if(moreAddress == "" || userName == "" || userPhone == "") {
								return;
							}
							
							jQuery.ajax({
								url : '${ctx}' + "/addAddress",
								data : {
									"userName" : userName,
									"userAddress" : userAddress,
									"userPhone" : userPhone
								},
								type : 'post',
								async : false, //默认为true 异步   
								dataType : 'json',
								error : function(data) {
								},
								success : function(retData) {
									if (retData.code == 0) {
										location.reload();
									}
								}
							});
							
						} 
						
						function delClick(_object) {
							var id = $(_object).attr("addressId");
							
							jQuery.ajax({
								url : '${ctx}' + "/deleteAddress",
								data : {
									"id" : id
								},
								type : 'post',
								async : false, //默认为true 异步   
								dataType : 'json',
								error : function(data) {
								},
								success : function(retData) {
									if (retData.code == 0) {
										location.reload();
									}
								}
							});
							
						}
						
					</script>

				<div class="clear"></div>

			</div>
			<!--底部-->
			<div class="footer">
				<!-- <div class="footer-hd">
					<p>
						<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div> -->
				<div class="footer-bd">
					<p>
						 <a href="#">赵楷佳</a> <em>© 2017版权所有 13728734092</em>
					</p>
				</div>
			</div>
		</div>

		<!-- <aside class="menu">
		<ul>
			<li class="person"><a href="index.html">个人中心</a></li>
			<li class="person"><a href="#">个人资料</a>
				<ul>
					<li><a href="information.html">个人信息</a></li>
					<li><a href="safety.html">安全设置</a></li>
					<li class="active"><a href="address.html">收货地址</a></li>
				</ul></li>
			<li class="person"><a href="#">我的交易</a>
				<ul>
					<li><a href="order.html">订单管理</a></li>
					<li><a href="change.html">退款售后</a></li>
				</ul></li>
			<li class="person"><a href="#">我的资产</a>
				<ul>
					<li><a href="coupon.html">优惠券 </a></li>
					<li><a href="bonus.html">红包</a></li>
					<li><a href="bill.html">账单明细</a></li>
				</ul></li>

			<li class="person"><a href="#">我的小窝</a>
				<ul>
					<li><a href="collection.html">收藏</a></li>
					<li><a href="foot.html">足迹</a></li>
					<li><a href="comment.html">评价</a></li>
					<li><a href="news.html">消息</a></li>
				</ul></li>

		</ul>

		</aside> -->
	</div>


</body>

</html>