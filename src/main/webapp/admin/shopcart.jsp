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
<script charset="utf-8" src="<%=basePath %>/js/jquery.min.js?v=01291"></script>
<script charset="utf-8" src="<%=basePath %>/js/global.js?v=01291"></script>
<script charset="utf-8" src="<%=basePath %>/js/bootstrap.min.js?v=01291"></script>
<script charset="utf-8" src="<%=basePath %>/js/template.js?v=01291"></script>

<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css?v=01291">
<link rel="stylesheet" href="<%=basePath %>/css/style.css?v=1?v=01291">
<link rel="stylesheet" href="<%=basePath %>/css/member.css?v=01291">
<link rel="stylesheet" href="<%=basePath %>/css/order3.css?v=01291">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no" name="format-detection">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport"
	content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
<%-- <script charset="utf-8" src="<%=basePath %>/js/shopCart.js"></script> --%>
<title>购物车</title>
</head>
<body>
	<div class="fanhui_cou">
		<div class="fanhui_1"></div>
		<div class="fanhui_ding">顶部</div>
	</div>
	<header class="header header_1">
	<div class="fix_nav">
		<div class="nav_inner">
			<a class="nav-left back-icon" href="javascript:location.href = document.referrer">返回</a>
			<div class="tit">购物车</div>
		</div>
	</div>
	</header>
	<div class="container ">
		<div class="row rowcar">
			<c:if test="${shopcart == null || fn.length(shopcart) == 0}">
				<img src="<%= basePath%>/image/3.22.gif">
			</c:if>
			<c:forEach items="${shopcart}" var="item" varStatus="status">
				<ul class="list-group">
				<li class="list-group-item text-primary">
					<div class="icheck pull-left mr5">
						<input type="checkbox" class="ids"
							prodStatus="1" itemkey="${item.prodId}" itemName="${item.prodName}" /> <label class="checkLabel"> <span></span>
						</label>
					</div> ${item.bandName}
				</li>
				<li class="list-group-item hproduct clearfix">
					<div class="p-pic">
						<a href="<%=basePath %>/product/view/${item.prodId}"><img class="img-responsive"
							src="<%=basePath %>/${item.imgUrl}"></a>
					</div>
					<div class="p-info">
						<a href="<%=basePath %>/product/view/${item.prodId}"><p class="p-title">${item.prodName}</p></a>
						<p class="p-attr" style="color:grey;">
							<span>${item.prodDetail}</span>
						</p>
						<p class="p-origin">
							<a class="close p-close"
								onclick="deleteShopCart('${item.prodName}','${item.prodId}')"
								href="javascript:void(0);">×</a> <em class="price">¥${item.prodPrize}</em>
						</p>
					</div>
				</li>
				<li class="list-group-item clearfix">
					<div class="pull-left mt5">
						<span class="gary">小计：</span> <em class="red productTotalPrice">¥ ${item.prodPrize * item.prodCount}</em>
					</div>
					<div class="btn-group btn-group-sm control-num">
						<a onclick="disDe(this)" href="javascript:void(0);"
							class="btn btn-default"><span
							class="glyphicon glyphicon-minus gary"></span></a> <input type="tel"
							class="btn gary2 Amount" readonly="readonly" value="${item.prodCount}"
							maxlength="4" prodId="${item.prodId}" maxProdSum = "${item.prodSum}"> <a
							onclick="increase(this)" href="javascript:void(0);"
							class="btn btn-default"><span
							class="glyphicon glyphicon-plus gary"></span></a>
					</div>
				</li>
			</ul>
			
			</c:forEach>
		</div>
	</div>
	<div class="fixed-foot">
		<div class="fixed_inner">
			<div class="pay-point">
				<div class="icheck pull-left mr10">
					<input type="checkbox" checked="checked" id="buy-sele-all"
						value="1"> <label for="buy-sele-all"> <span
						class="mt10"></span>全选
					</label>
				</div>
				<p>
					合计：<em class="red f22">¥<span id="totalPrice">00.00</span></em>
				</p>
			</div>
			<div class="buy-btn-fix">
				<a href="javascript:submitShopCart();"
					class="btn btn-danger btn-buy">去结算</a>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	
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

	<footer class="footer">
	<div class="foot-con">
		<div class="foot-con_2">
			<a href="<%= basePath%>/index"> <i class="navIcon home"></i> <span
				class="text">首页</span>
			</a> <a href="<%= basePath%>/category"> <i class="navIcon sort"></i> <span
				class="text">分类</span>
			</a> <a href="<%= basePath%>/shopcart"  class="active"> <i class="navIcon shop"></i> <span
				class="text">购物车</span>
			</a> <a href="<%= basePath%>/userhome"> <i class="navIcon member"></i> <span
				class="text">我的</span>
			</a>
		</div>
	</div>
	</footer>
<script type="text/javascript">

$(document).ready(function(){
	
	console.log("lalalla");
	
	//返回顶部
	$(window).scroll(function(){
		if($(this).scrollTop()>30){
			$(".fanhui_cou").fadeIn(1500);
			
		}else{
			$(".fanhui_cou").fadeOut(1500);
			
		}
	});
	$(".fanhui_cou").click(function(){
		$("body,html").animate({scrollTop:0},200);
		return false;
	});
	
	//勾选
    $(".checkLabel").click(function(){
    	var flag = $(this).prev().is(':checked');
    	if(flag){
            $(this).prev().attr("checked",false);
            
            $("#buy-sele-all").attr("checked", false); //将全选勾除
            $("#buy-sele-all").val(0);
            
        }else{
        	
            $(this).prev().attr("checked",true);
            
            //如果全部都选中了，将全选勾选
            var groupUL = $(".container").find("ul[class='list-group']").get();
            var checkUL = $(".container").find("div[class='icheck pull-left mr5'] :checkbox:checked").get();
            if(groupUL.length == checkUL.length){
            	$("#buy-sele-all").attr("checked", true);
            	$("#buy-sele-all").val(1);
            }
        }
    	
      //计算总价
	  calculateTotal();
    });
    
    // 全选，全不选
    $("#buy-sele-all").click(function() {
        var flag = $(this).val();

        if(flag ==1){
            $(this).val(0);
             $(".ids").attr("checked", false);
        }else{
            $(this).val(1);
            $(".ids").attr("checked", true);
        }
        
      //计算总价
  	  calculateTotal();
    });
    
	  //计算总价
	//  calculateTotal();
	});

//相加
function increase(obj){
	var _this = $(obj);
	var _count_obj=_this.prev();
	var count =Number($(_count_obj).val());
	var prod_id=$(_count_obj).attr("prodId");
	var prod_max_sum=$(_count_obj).attr("maxProdSum");
	
    var _num=parseInt(count)+1;
	var re = /^[1-9]+[0-9]*]*$/;  
	if( isNaN(_num) || ! re.test(_num)) {
	 	return ;
	}else if(_num >= prod_max_sum){
		 floatNotify.simple("超过商品库存量");
		return;
	}
	
	var result = changeShopCartNumber(_num,prod_id);
	if(result){
		$(_count_obj).val(count*1+1);
		var cash = $(_this).parent().parent().prev().find("em[class='price']").html().substring(1);//单价
		var total_cash =  $(_this).parent().prev().find("em[class='red productTotalPrice']").html().substring(1);//商品小计

		var e_cash = Math.round((Number(total_cash)+Number(cash))*100)/100;
		var pos_decimal = e_cash.toString().indexOf('.');
		if (pos_decimal < 0)
		{
			e_cash += '.00';
		}
		$(_this).parent().prev().find("em").html("¥"+e_cash);
		
		//计算总价
		calculateTotal();
	}
	
}

//减
function disDe(obj){
	var _this = $(obj);
	var _count_obj=_this.next();
	var count =Number($(_count_obj).val());
	var prod_id=$(_count_obj).attr("prodId");
	var _num=parseInt(count)-1;
	
	var re = /^[1-9]+[0-9]*]*$/;  
	if( isNaN(_num) || ! re.test(_num)) {
	 	return ;
	}else if(_num==0){
		return ;
	}
	var result = changeShopCartNumber(_num,prod_id);
	if(result){
		$(_count_obj).val(count*1-1);
		var cash = $(_this).parent().parent().prev().find("em[class='price']").html().substring(1);//单价
		var total_cash =  $(_this).parent().prev().find("em[class='red productTotalPrice']").html().substring(1);//商品小计		
		var e_cash = Math.round((Number(total_cash)-Number(cash))*100)/100;
		var pos_decimal = e_cash.toString().indexOf('.');
		if (pos_decimal < 0)
		{
			e_cash += '.00';
		}
		$(_this).parent().prev().find("em").html("¥"+e_cash);
		
		//计算总价
		calculateTotal();
	}
}
//更新购物车商品数量
function changeShopCartNumber(_num,_prodId){
	var config = false;
	$.ajax({
		url: "${ctx}"+"/changeShopCartNum", 
		data: {"num":_num,"prodId":_prodId},
		type:'post', 
		async : false, //默认为true 异步   
		dataType : 'json', 
		error:function(data){
		},  
		success:function(result){
			config = true;
		}
	});
	return config;
}

//计算总价
function calculateTotal(){
	var allCash = 0;
	var list = $(".container").find("ul[class='list-group']").get();
	for(var i=0;i<list.length;i++){
		var selected = $(list[i]).find("div[class='icheck pull-left mr5']>:checkbox").is(":checked");
		if(selected){
			var cash = $(list[i]).find("em[class='price']").html().substring(1);//取单价
			var count = $(list[i]).find("input[class='btn gary2 Amount']").val();//取数量
			allCash += Number(cash)*Number(count);
		}
	}
	
	allCash = Math.round(Number(allCash)*100)/100;
	var pos_decimal = allCash.toString().indexOf('.');
	if (pos_decimal < 0)
	{
		allCash += '.00';
	}
	$("#totalPrice").html(allCash);
}

//删除购物车商品
function deleteShopCart(_basketName,_prodId){
		$.ajax({
			url: "${ctx}"+"/deleteShopCart", 
			data: {"prodId":_prodId},
			type:'post', 
			async : true, //默认为true 异步   
			dataType : 'json', 
			error:function(data){
			},   
			success:function(data){
				if(data.code == 0){
					location.reload();
					return;
				}else{
					floatNotify.simple("删除失败");
					return false;
				}
				
			}   
		});         
}


function submitShopCart(){
	
	var array = $(".ids:checked").get();
	if(array.length==0){
		floatNotify.simple("请选择要结算的商品");
		return;
	}
	
    var shopCartStr = "";
    var shopCartName = "";
	for(var i in array){
		if(i!=0){
			shopCartStr =shopCartStr+",";
			shopCartName = shopCartName+",";
		}
		var prod_id = $(array[i]).attr("itemkey");
		var prod_name = $(array[i]).attr("itemName");
		shopCartStr=shopCartStr + prod_id;
		shopCartName = shopCartName + prod_name;
	}
	
	var totalSum = $('#totalPrice').html();
	
	var string = "<p>商品名称："+ shopCartName +"</p>" + "<p style=\"color:red\">商品序列号："+ shopCartStr +"</p>"
	              +"<p style=\"color:red\">总金额："
	             + totalSum +"</p>" ;
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
				var f = document.createElement("form");
				document.body.appendChild(f);
				var i = document.createElement("input");
				i.type = "hidden";
				f.appendChild(i);
				i.value = shopCartName;
				i.name = "prodName";
				
				var i = document.createElement("input");
				i.type = "hidden";
				f.appendChild(i);
				i.value = shopCartStr;
				i.name = "prodId";
				
				var i = document.createElement("input");
				i.type = "hidden";
				f.appendChild(i);
				i.value = totalSum;
				i.name = "moneySum";
				f.action = "${ctx}/orderDetail";
				f.method = "post";
				f.submit();
			}
		}
	}); 
	
	
	
	
}

function toBuy() {
	
	var array = $(".ids:checked").get();
	var totalSum = $('#totalPrice').html();
	if(array.length==0){
		floatNotify.simple("请选择要结算的商品");
		return;
	}
	
    var shopCartStr = "";
    var shopCartName = "";
	for(var i in array){
		if(i!=0){
			shopCartStr =shopCartStr+",";
			shopCartName = shopCartName+",";
		}
		var prod_id = $(array[i]).attr("itemkey");
		var prod_name = $(array[i]).attr("itemName");
		shopCartStr=shopCartStr + prod_id;
		shopCartName = shopCartName + prod_name;
	}
	
	
	jQuery.ajax({
		url : '${ctx}' + "/shopCarToBuy",
		data : {
			"prodName" : shopCartName,
			"prodId" : shopCartStr,
			"moneySum" : totalSum
		},
		type : 'post',
		async : false, //默认为true 异步   
		dataType : 'json',
		error : function(data) {
		},
		success : function(retData) {
			if(retData.code == 0) {
				window.location.href='${ctx}'+"/shopCartrade";
			} 
		}
	});
}

function abstractForm(URL, shopCartIds){
	   var temp = document.createElement("form");        
	   temp.action = URL;        
	   temp.method = "post";        
	   temp.style.display = "none";        
	   var opt = document.createElement("textarea");        
	   opt.name = 'shopCartItems';        
	   opt.value = shopCartIds;        
	   temp.appendChild(opt);        
	   document.body.appendChild(temp);        
	   temp.submit();        
	   return temp;  
}
	

</script>
</body>
</html>