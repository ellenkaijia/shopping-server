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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>结算页面</title>
<link href="<%=basePath %>/base/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath %>/base/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/base/css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/base/css/jsstyle.css" rel="stylesheet" type="text/css" />
<script charset="utf-8" src="<%= basePath %>/js/jquery.min.js?v=01291"></script>
<script type="text/javascript" src="<%=basePath %>/base/js/address.js"></script>

</head>

<body>
	<!--顶部导航条 -->
	 <!--  <div class="am-container header">
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
	</div>  -->

	<!-- 悬浮搜索框 -->

 	<!--  <div class="nav white">
		<div class="logo">
			<img src="../images/logo.png" />
		</div>
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
	</div>   -->
	<div class="concent">
		<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="background: #000000; margin-left:0; margin-right:0;margin-top:0">
			  <p class="" style="font-size:16px;color:#FFFFFF;margin-left:10px">订单详情</p>
			  <nav class="am-titlebar-nav">
			    <a href="javascript:history.back();" class="" style="font-size:16px;color:#FFFFFF">返回 &raquo;</a>
			  </nav>
		</div>
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3 style="margin-left:10px">收货地址</h3>
				<div class="clear"></div>
				<ul>
					<div class="per-border"></div>
					<li class="user-addresslist defaultAddr">

						<div class="address-left">
							<div class="user DefaultAddr">

								<span class="buy-address-detail"> <span class="buy-user">${address.userName}
								</span> <span class="buy-phone">${address.userPhone}</span>
								</span>
							</div>
							<div class="default-address DefaultAddr" id="addressIdFor" addressId="${address.id}">
								<span class="buy-line-title buy-line-title-type">收货地址：</span>
								<span class="buy--address-detail"> 
									${address.userAddress}
									<!--  <span
										class="buy--address-detail">
										 <span class="province">湖北</span>省
										<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
										class="street">雄楚大道666号(中南财经政法大学)
										
										</span>
									</span>  -->
								</span>
							</div>
							<ins class="deftip">默认地址</ins>
						</div>
						<div class="address-right">
							<a href=""> <span
								class="am-icon-angle-right am-icon-lg"></span></a>
						</div>
						<div class="clear"></div>

						<div class="new-addr-btn">
							<a href="#" class="hidden">设为默认</a></span> <a href="javascript:void(0);"
								onclick="delClick(this);">删除</a>
						</div>

					</li>
				</ul>

				<div class="clear"></div>
			</div>
			<!--物流 -->
			<!-- <div class="logistics">
				<h3>选择物流方式</h3>
				<ul class="op_express_delivery_hot">
					<li data-value="yuantong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -468px"></i>圆通<span></span></li>
					<li data-value="shentong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -1008px"></i>申通<span></span></li>
					<li data-value="yunda" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -576px"></i>韵达<span></span></li>
					<li data-value="zhongtong"
						class="OP_LOG_BTN op_express_delivery_hot_last "><i
						class="c-gap-right" style="background-position: 0px -324px"></i>中通<span></span></li>
					<li data-value="shunfeng"
						class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i
						class="c-gap-right" style="background-position: 0px -180px"></i>顺丰<span></span></li>
				</ul>
			</div> -->
			<div class="clear"></div>

			<!--支付方式-->
			<!-- <div class="logistics">
				<h3>选择支付方式</h3>
				<ul class="pay-list">
					<li class="pay card"><img src="../images/wangyin.jpg" />银联<span></span></li>
					<li class="pay qq"><img src="../images/weizhifu.jpg" />微信<span></span></li>
					<li class="pay taobao"><img src="../images/zhifubao.jpg" />支付宝<span></span></li>
				</ul>
			</div> -->
			<div class="clear"></div>

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3 style="margin-left:10px">确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-oplist">
								<div class="td-inner">配送方式</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>


					<c:forEach items="${productList}" var="item" varStatus="status">
						<tr class="item-list">
						<div class="bundle  bundle-last">

							<div class="bundle-main">
								<ul class="item-content clearfix">
									<div class="pay-phone">
										<li class="td td-item">
											<div class="item-pic">
												<a href="#" class="J_MakePoint"> <img style="width:80px; height:80px"
													src="<%= basePath%>/${item.imgUrls[0]}"
													class="itempic J_ItemImg"></a>
											</div>
											<div class="item-info">
												<div class="item-basic-info">
													<a href="#" class="item-title J_MakePoint" prodId="${item.prodId}"
														data-point="tbcart.8.11">${item.prodName}</a>
												</div>
											</div>
										</li>
										<li class="td td-info">
											<div class="item-props">
												<span class="sku-line">颜色：黑色</span> <span
													class="sku-line">包装：箱子</span>
											</div>
										</li>
										<li class="td td-price">
											<div class="item-price price-promo-promo">
												<div class="price-content">
													<em class="J_Price price-now">￥${item.prodPrize}</em>
												</div>
											</div>
										</li>
									</div>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<span class="phone-title">购买数量</span>
												<div class="sl">
													<input class="text_box" name="" type="text"  disabled="true" value="${item.buyCount}"
														style="width: 30px;" /> 
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${item.buyCount * item.prodPrize}</em>
										</div>
									</li>
									<li class="td td-oplist">
										<div class="td-inner">
											<span class="phone-title">配送方式</span>
											<div class="pay-logis">
												人工<b class="sys_item_freprice">免邮</b>
											</div>
										</div>
									</li>

								</ul>
								<div class="clear"></div>

							</div>
					</tr>
					
					</c:forEach>
					
					<div class="clear"></div>
				</div>
			</div>
			<div class="pay-total">
				<!--留言-->
				<div class="order-extra">
					<div class="order-user-info">
						<div id="holyshit257" class="memo">
							<label>买家留言：</label> <input type="text"
								title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
								placeholder="选填,建议填写和卖家达成一致的说明"
								class="memo-input J_MakePoint c2c-text-default memo-close">
							<div class="msg hidden J-msg">
								<p class="error">最多输入500个字符</p>
							</div>
						</div>
					</div>

				</div>
				<div class="clear"></div>
			</div>
			<!--含运费小计 -->
			<div class="buy-point-discharge ">
				<p class="price g_price ">
					合计（含运费） <span>¥</span><em class="pay-sum">${moneySum}</em>
				</p>
			</div>

			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
								<em class="style-large-bold-red " id="J_ActualFee">${moneySum}</em>
							</span>
						</div>

						<div id="holyshit268" class="pay-address">

							<p class="buy-footer-address">
								<span class="buy-line-title buy-line-title-type">寄送至：</span>
								 <span class="buy--address-detail"> 
								 	${address.userAddress}
								</span>
							</p>
							<p class="buy-footer-address">
								<span class="buy-line-title">收货人：</span> <span
									class="buy-address-detail"> <span class="buy-user">${address.userName}
								</span> <span class="buy-phone">${address.userPhone}</span>
								</span>
							</p>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	<div class="footer">
		<div class="footer-bd">
			<p>
				 <a href="#">赵楷佳</a> <em>© 2017版权所有 13728734092</em>
			</p>
		</div>
	</div>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12">
			<form class="am-form am-form-horizontal">

				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" id="user-name" placeholder="收货人">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input id="user-phone" placeholder="手机号必填" type="email">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">所在地</label>
					<div class="am-form-content address">
						<select data-am-selected>
							<option value="a">广东省</option>
						</select> <select data-am-selected>
							<option value="b">汕头市</option>
						</select> <select data-am-selected>
							<option value="b">潮阳区</option>
						</select>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
						<small>100字以内写出你的详细地址...</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<div class="am-btn am-btn-danger">保存</div>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<div class="clear"></div>

	<script type="text/javascript">
		
	</script>

</body>

</html>