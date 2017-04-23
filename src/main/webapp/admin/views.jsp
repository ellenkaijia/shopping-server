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
<script charset="utf-8" src="${ctx}/js/jquery.min.js?v=01291"></script>
<script charset="utf-8" src="${ctx}/js/global.js?v=01291"></script>
<script charset="utf-8" src="${ctx}/js/bootstrap.min.js?v=01291"></script>
<script charset="utf-8" src="${ctx}/js/template.js?v=01291"></script>

<link rel="stylesheet" href="${ctx}/css/bootstrap.css?v=01291">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet" href="${ctx}/css/style.css?v=1?v=01291">
<link rel="stylesheet" href="${ctx}/css/member.css?v=01291">
<link rel="stylesheet" href="${ctx}/css/order3.css?v=01291">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no" name="format-detection">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport"
	content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
<title>产品详情</title>
<link rel="stylesheet" href="${ctx}/css/productDetail.css?v=01291">
<script charset="utf-8" src="${ctx}/js/TouchSlide.js?v=01291"></script>
<script charset="utf-8" src="${ctx}/js/prodDetail.js?v=01291"></script>
<style type="text/css">
.details_con li .tb-out-of-stock {
	border: 1px dashed #bbb;
	color: #bbb;
	cursor: not-allowed;
}

.no-selected {
	background: #ffe8e8 none repeat scroll 0 0;
	border: 2px solid #be0106;
	margin: -1px;
}
</style>
</head>
<body>
	<div class="fanhui_cou">
		<div class="fanhui_1"></div>
		<div class="fanhui_ding">顶部</div>
	</div>

	<header class="header">
	<div class="fix_nav">
		<div
			style="max-width: 768px; margin: 0 auto; background: #000; position: relative;">
			<a class="nav-left back-icon" href="javascript:window.location.href='${ctx}/index'">返回</a>
			<div class="tit">商品详细</div>
		</div>
	</div>
	</header>
	<input type="hidden" id="prodId" value="663" />
	<input id="currSkuId" value="" type="hidden" />
	<div class="container">
		<div class="row white-bg">
			<div id="slide">
				<div class="hd">
					<ul>
						<li>1</li>
					</ul>
				</div>
				<div class="bd">
					<div class="tempWrap" style="overflow: hidden; position: relative;">
						<ul
							style="width: 3072px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms;">
							<li
								style="display: table-cell; vertical-align: middle; max-width: 768px;">
								<a href="#"><img
									style="max-width: 100vw; max-height: 80vw; margin: auto;"
									src="<%= basePath%>/${productDetail.imgUrls[0]}"></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row gary-bg">
			<div class="white-bg p10 details_con">
				<h1 class="item-name" id="prodName">${productDetail.prodName}</h1>
				<ul>
					<li><label>商城价格：</label> <span class="price">¥<span
							class="price" id="prodCash">${productDetail.prodPrize}</span></span></li>
					<li id="choose_0" index="0"><label id="propName" propname="颜色">颜色：</label>
						<dl>
							<dd class="check" key="208:635" valId="635">
								黑色<span></span>
							</dd>
							<!-- <dd key="208:636" valId="636">
								红色<span></span>
							</dd>
							<dd key="208:661" valId="661">
								黄色<span></span>
							</dd> -->
						</dl></li>
					<li><label>数量：</label>
						<div class="count_div" style="height: 30px; width: 130px;">
							<a onclick="disDe(this)" href="javascript:void(0);" class="minus"></a> <input
								type="text" class="count" prodPrize = "${productDetail.prodPrize}" prodName="${productDetail.prodName}"
								prodId="${productDetail.prodId}" value="1" id="prodCount" maxProdSum = "${productDetail.prodSum}"
								readonly="readonly" /> <a onclick="increase(this)" href="javascript:void(0);"
								class="add"></a>
						</div></li>
				</ul>
			</div>
			<div id="goodsContent" class="goods-content white-bg">

				<div class="hd hd_fav">
					<ul>
						<li class="on">图文详情</li>
						<li class="">规格参数</li>
						<li class="">评价(0)</li>
					</ul>
				</div>

				<div class="tempWrap" style="overflow: hidden; position: relative;">
					<div
						style="width: 2304px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translateX(0px);"
						class="bd">
						<ul
							style="display: table-cell; vertical-align: top; max-width: 768px; width: 100%;"
							class="property">
							<c:forEach items="${productDetail.imgUrls}" var="item"
								varStatus="status">
								<div class="prop-area" style="min-height:300px;overflow: hidden;">
								<img src="<%= basePath%>/${item}" alt="" />
								<%-- <div
									style="margin: 0 auto; min-height: 300px; overflow: hidden;">
									<img style="display: inline-block" src="<%= basePath%>/${item}"
										alt="" />
								</div> --%>
								</div>
							</c:forEach>
						</ul>
						<ul class="txt-imgs"
							style="display: table-cell; vertical-align: top; max-width: 768px; width: 100%;">
							<div class="desc-area" style="padding: 0px 10px 0 10px;">
								<li style="height: 30px;">
									<div id="ajax_loading"
										style="margin: 10px auto 15px; text-align: center;">
										<img src="images/loading.gif"
											style="width: auto; display: block; margin: auto;">
									</div>
								</li>
							</div>
						</ul>
						<ul
							style="display: table-cell; vertical-align: top; max-width: 768px; width: 100%;"
							class="appraise" rel="1" status="1">
							<div style="height: 30px;">
								<div id="ajax_loading"
									style="margin: 10px auto 15px; text-align: center;">
									<img src="images/loading.gif"
										style="width: auto; display: block; margin: auto;"/>
								</div>
							</div>
							<div class="wap_page" style="display: none;"
								onclick="next_comments(this)">
								<span>下一页</span>
							</div>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="fixed-foot">
		<div class="fixed_inner">
			<a class="btn-fav" href="javascript:void(0);"
				onclick="addInterest(this,'${productDetail.prodId}');" status = "${isFavor}">
				 <c:choose>
				 	 <c:when test="${isFavor == -99}">
				 	 	<i class="i-fav" class="i-fav-active"></i><span>收藏</span>
				 	 </c:when>
				 	 <c:otherwise>
				 	 	<i class="i-fav"></i><span>已收藏</span>
				 	 </c:otherwise>
				 </c:choose> 
			</a> <a class="cart-wrap" href="<%= basePath %>/shopcart"> <i class="i-cart"></i> <span>购物车</span>
				<span class="add-num" id="totalNum">${shopCarCount}</span>
			</a>
			<div class="buy-btn-fix">
				<a class="btn btn-info btn-cart" onclick="addShopCart();"
					href="javascript:void(0);">加入购物车</a> <a
					class="btn btn-danger btn-buy" onclick="buyNow();"
					href="javascript:void(0);">立即购买</a>

				<!-- Button trigger modal -->
			<!-- 	<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#myModal">Launch demo
					modal</button> -->
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
				
				<!-- Modal -->
				<div class="modal fade" id="buyModal" tabindex="-1" role="dialog"
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
							<div class="modal-body" id="buyBody">商品详情</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" id="buttonToBuy" onclick="toBuy()">
								去买单</button>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Modal -->
				<div class="modal fade" id="addAddressModal" tabindex="-1" role="dialog"
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
							<div class="modal-body" id="addAddressBody">商品详情</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" id="addAdressId" onclick="addAdress()">
								去添加</button>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>

	<div class="clear"></div>

	<footer class="footer">
	<div class="foot-con">
		<div class="foot-con_2">
			<a href="<%=basePath%>/index"> <i class="navIcon home"></i> <span
				class="text">首页</span>
			</a> <a href="<%=basePath%>/category"> <i class="navIcon sort"></i> <span
				class="text">分类</span>
			</a> <a href="<%=basePath%>/shopcart"> <i class="navIcon shop"></i> <span
				class="text">购物车</span>
			</a> <a href="<%=basePath%>/userhome"> <i class="navIcon member"></i>
				<span class="text">我的</span>
			</a>
		</div>
	</div>
	</footer>
	<script type="text/javascript">
		var contextPath = '';
		var currProdId = '663';
		var prodName = '';
		var skuDtoList = eval('${productDetail}');
		//var skuDtoList = eval('[{"amountDetail":{"cash":179,"num":1,"price":179,"promotionPrice":179,"totalAmount":179},"name":"艾吉贝2015新款多层收纳真皮单肩斜挎包女包头层牛皮斜跨小包包女","price":179,"properties":"208:636","skuId":1358,"status":1},{"amountDetail":{"cash":179,"num":1,"price":179,"promotionPrice":179,"totalAmount":179},"name":"艾吉贝2015新款多层收纳真皮单肩斜挎包女包头层牛皮斜跨小包包女","price":179,"properties":"208:661","skuId":1359,"status":1},{"amountDetail":{"cash":179,"num":1,"price":179,"promotionPrice":179,"totalAmount":179},"name":"艾吉贝2015新款多层收纳真皮单肩斜挎包女包头层牛皮斜跨小包包女","price":179,"properties":"208:635","skuId":1360,"status":1}]');
		var propValueImgList = eval('[{"imgList":["img/d15bbf94-615d-4b11-9ed8-cb9e2365f12b.jpg","img/f77cb899-e3a5-4ecd-a5dc-af5e2037935f.jpg","img/30259b99-d6ce-44a8-acb8-d6a64278bc88.jpg","img/d2cd16e6-71f0-4c42-b57e-30e417e8a28f.jpg","img/2c06d677-b2ac-459e-8dd0-1c16437333fe.jpg"],"valueId":635},{"imgList":["img/ed971163-f1bf-45e8-b63a-50cf514df3e1.jpg","img/c8117d09-63bc-4e96-adce-89dc7d2017a3.jpg","img/30259b99-d6ce-44a8-acb8-d6a64278bc88.jpg","img/d2cd16e6-71f0-4c42-b57e-30e417e8a28f.jpg","img/01de5ef6-3763-4cfe-bda8-c412266e14c7.jpg"],"valueId":661},{"imgList":["img/53698282-4ff7-4daa-bb4c-4bcaa14b00fc.jpg","img/d2cd16e6-71f0-4c42-b57e-30e417e8a28f.jpg","img/78743cc9-5d29-4289-b0a1-0d5df79e63c7.jpg","img/1c9cc5cf-4ef5-4474-b4ae-7b2f1efa88f0.jpg","img/01de5ef6-3763-4cfe-bda8-c412266e14c7.jpg"],"valueId":636}]');
		var allSelected = true;
		var prodLessMsg = '商品缺货';
		var failedOwnerMsg = '您是商品主人, 不能购买此商品。';
		var failedBasketMaxMsg = '已达到购物车最大数量, 不能购买此商品。';
		var failedBasketErrorMsg = '购物车错误, 不能购买此商品。';
		var photoPath = "";
		var distUserName = '';
		
		/* jQuery(document).ready(function() {
			// 详情数量减少
			alert(":::");
			$('.details_con .minus').click(function() {
				alert("fafs");
				var _index = $(this).parent().parent().index() - 1;
				var _count = $(this).parent().find('.count');
				var _val = _count.val();
				if (_val > 1) {
					_count.val(_val - 1);
					$('.details_con .selected span').eq(_index).text(_val - 1);

				}
				if (_val <= 2) {
					$(this).addClass('disabled');
				}

			});

			// 详情数量添加
			$('.details_con .add').click(function() {
				var _index = $(this).parent().parent().index() - 1;
				var _count = $(this).parent().find('.count');
				var _val = _count.val();
				$(this).parent().find('.minus').removeClass('disabled');
				_count.val(_val - 0 + 1);
				$('.details_con .selected span').eq(_index).text(_val - 0 + 1);

			});

		});
 */

		//插件：图片轮播
		TouchSlide({
			slideCell : "#slide",
			titCell : ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
			mainCell : ".bd ul",
			effect : "left",
			autoPlay : false,//自动播放
			autoPage : true, //自动分页
			switchLoad : "_src" //切换加载，真实图片路径为"_src"
		});

		var scrollTop = 0;
		TouchSlide({
			slideCell : "#goodsContent",
			startFun : function(i, c) {
				var prodId = $("#prodId").val();
				if (i == 1) {//规格参数
					var th = jQuery("#goodsContent .bd ul").eq(i);
					if (!th.hasClass('hadGoodsContent')) {
						queryParameter(th, prodId);
					}

					if ($(window).scrollTop() > scrollTop) {
						$(window).scrollTop(scrollTop);
					}

				} else if (i == 2) {//评价
					var th = jQuery("#goodsContent .bd ul").eq(i);

					if (!th.hasClass('hadConments')) {
						queryProdComment(th, prodId);
					}

					if ($(window).scrollTop() > scrollTop) {
						$(window).scrollTop(scrollTop);
					}
				} else {
					if (scrollTop == 0) {
						$(window).scrollTop(scrollTop);
						var hd_fav = $('.hd_fav');
						var position = hd_fav.position();

						scrollTop = position.top;
					}
				}
			},
		});
		
		function loginTo() {
			window.location.href="${ctx}/login"; 
		}

		function addAdress() {
			window.location.href = '${ctx}/' + "getAddressList";
		}
		
		//加入购物车
		function addShopCart(value) {

			var prodId = "${productDetail.prodId}";

			var prodCount = $("#prodCount").val();//购买数量
			jQuery.ajax({
				url : "${ctx}/addShopCart",
				data : {
					"prodId" : prodId,
					"prodCount" : prodCount
				},
				type : 'post',
				async : false, //默认为true 异步   
				dataType : 'json',
				error : function(data) {
				},
				success : function(retData) {
					if(retData.status == "OFFLINE") {
						$('#buttonToLogin').show();
						$('#myModal').modal('show');
						
					} else if(retData.code == -99){
						$('#buttonToLogin').hide();
						$('#modalTitle').html(retData.message);
						$('#myModal').modal('show');
					} else if(retData.code == 0){
						$('#buttonToLogin').hide();
						$('#modalTitle').html(retData.message);
						$('#myModal').modal('show');
						var basketCount = $("#totalNum").html();
						$("#totalNum").html(
							Number(basketCount) + Number(prodCount));
					}
				}
			});
		}
		var globalStatus;
		function addInterest(obj,prodId){
			var _this = $(obj);
			var status = $(_this).attr("status");
			var reqData;
			
			if(status == -99) { //可以收藏
				globalStatus = 1;
			} else {
				globalStatus = 2;
			}
			
			jQuery.ajax({
				url : '${ctx}' + "/addInterest",
				data : {
					"prodId" : prodId,
					"status" :globalStatus
				},
				type : 'post',
				async : false, //默认为true 异步   
				dataType : 'json',
				error : function(data) {
					floatNotify.simple("服务器出错");
				},
				success : function(retData) {
					if(retData.status == "OFFLINE"){
						$('#buttonToLogin').show();
						$('#modalTitle').html("您尚未登录，无法收藏");
						$('#myModal').modal('show');
					} else if(retData.code == 0){
						//更换样式
						if(retData.data == -98) {
							_this.find("span").html("已收藏");
							_this.find("i").addClass("i-fav-active");
						} else {
							_this.find("i").removeClass("i-fav-active");
							_this.find("span").html("收藏");
						}
						floatNotify.simple(retData.message);
						$(_this).attr("status",retData.data);
					} else {
						floatNotify.simple(retData.message);
						$(_this).attr("status",retData.data);
					}
				}
			});
		}
		
		//立即购买
		function buyNow() {
			
			var prodPrize = $("#prodCount").attr("prodPrize");
			var prodName = $("#prodCount").attr("prodName");
			var prodId = $("#prodCount").attr("prodId");
			var prodCount = $("#prodCount").val();//购买数量
			
			var string = "<p>商品名称："+ prodName +"</p>" + "<p style=\"color:red\">商品序列号："+ prodId +"</p>"
			             + "<p>商品颜色：黑色 </p>" + "<p>购买数量："+ prodCount +"</p>" +"<p style=\"color:red\">总金额："
			             + prodPrize*prodCount +"</p>" ;
			jQuery.ajax({
				url : '${ctx}' + "/tryToBuy",
				type : 'post',
				async : false, //默认为true 异步   
				dataType : 'json',
				error : function(data) {
				},
				success : function(retData) {
					if(retData.status == "OFFLINE") {
						$('#modalTitle').html("您尚未登录，不能买单哦");
						$('#buttonToLogin').show();
						$('#myModal').modal('show');
					} else {
						
						isHaveAddress(prodName, prodId, prodCount, prodPrize);
						/* var f = document.createElement("form");
						document.body.appendChild(f);
						var i = document.createElement("input");
						i.type = "hidden";
						f.appendChild(i);
						i.value = prodName;
						i.name = "prodName";
						
						var i = document.createElement("input");
						i.type = "hidden";
						f.appendChild(i);
						i.value = prodId;
						i.name = "prodId";
						
						var i = document.createElement("input");
						i.type = "hidden";
						f.appendChild(i);
						i.value = prodCount;
						i.name = "prodCount";
						
						var i = document.createElement("input");
						i.type = "hidden";
						f.appendChild(i);
						i.value = prodPrize*prodCount;
						i.name = "moneySum";
						f.action = "${ctx}/oneOrderDetail";
						f.method = "post";
						f.submit(); */
					}
				}
			});
		}
		
		function isHaveAddress( prodName, prodId, prodCount, prodPrize) {
			
			jQuery.ajax({
				url : '${ctx}' + "/isHaveAddress",
				type : 'post',
				async : false, //默认为true 异步   
				dataType : 'json',
				error : function(data) {
				},
				success : function(retData) {
					if(retData.code == -99) {
						$('#addAddressBody').html("您还没有添加默认地址");
						$('#addAddressModal').modal('show');
					} else {
						var f = document.createElement("form");
						document.body.appendChild(f);
						var i = document.createElement("input");
						i.type = "hidden";
						f.appendChild(i);
						i.value = prodName;
						i.name = "prodName";
						
						var i = document.createElement("input");
						i.type = "hidden";
						f.appendChild(i);
						i.value = prodId;
						i.name = "prodId";
						
						var i = document.createElement("input");
						i.type = "hidden";
						f.appendChild(i);
						i.value = prodCount;
						i.name = "prodCount";
						
						var i = document.createElement("input");
						i.type = "hidden";
						f.appendChild(i);
						i.value = prodPrize*prodCount;
						i.name = "moneySum";
						f.action = "${ctx}/oneOrderDetail";
						f.method = "post";
						f.submit();
					}
				}
			}); 
			
			
		}
		
		function toBuy() {
			
			var prodName = $("#prodCount").attr("prodName");
			var prodPrize = $("#prodCount").attr("prodPrize");
			var prodId = $("#prodCount").attr("prodId");
			var prodCount = $("#prodCount").val();//购买数量
			
			jQuery.ajax({
				url : '${ctx}' + "/productBuy",
				data : {
					"prodName" : prodName,
					"prodId" : prodId,
					"buyCount" : prodCount,
					"moneySum" : prodPrize * prodCount
				},
				type : 'post',
				async : false, //默认为true 异步   
				dataType : 'json',
				error : function(data) {
				},
				success : function(retData) {
					if(retData.code == 0) {
						window.location.href='${ctx}'+"/trade";
					} 
				}
			});
		}
		
		//相加
		function increase(obj){
			var _this = $(obj);
			var _count_obj=_this.prev();
			var count =Number($(_count_obj).val());
			var prod_max_sum=$(_count_obj).attr("maxProdSum");
			
		    var _num=parseInt(count)+1;
			var re = /^[1-9]+[0-9]*]*$/;  
			if( isNaN(_num) || ! re.test(_num)) {
			 	return ;
			}else if(_num >= prod_max_sum){
				 floatNotify.simple("超过商品库存量");
				return;
			}
			$(_count_obj).val(_num);
		}

		//减
		function disDe(obj){
			var _this = $(obj);
			var _count_obj=_this.next();
			var count =Number($(_count_obj).val());
			var _num=parseInt(count)-1;
			
			var re = /^[1-9]+[0-9]*]*$/;  
			if( isNaN(_num) || ! re.test(_num)) {
			 	return ;
			}else if(_num==0){
				return ;
			}
			$(_count_obj).val(count*1-1);
				
		}
	</script>
</body>
</html>
<style>
.modal-backdrop {
	z-index: 0
}
</style>