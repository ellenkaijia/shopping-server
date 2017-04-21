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

<title>维修管理</title>

<link href="<%= basePath %>/base/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="<%= basePath %>/base/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css?v=01291">
<link href="<%= basePath %>/base/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%= basePath %>/base/css/addstyle.css" rel="stylesheet" type="text/css">
<script src="<%= basePath %>/base/js/jquery.min.js"
	type="text/javascript"></script>
<script src="<%= basePath %>/base/js/amazeui.js"></script>
<script charset="utf-8" src="<%=basePath %>/js/bootstrap.min.js?v=01291"></script>

</head>
<body style="background: #fff;">
	<!--例子-->
	<div class="" style="background: #fff;" id="doc-modal-1">
		<div class="add-dress">
			<!--标题 -->
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-danger am-text-lg">填写维修单</strong> / <small>Add&nbsp;address</small>
					&nbsp;
					&nbsp;
					&nbsp;
					&nbsp;
					<a class="am-text-danger am-text-lg" onclick="javascript:location.href = document.referrer">返回</a>
				</div>
			</div>
			<hr />

			<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
				<form class="am-form am-form-horizontal">
					<input type="hidden" id="prodId" value="${prodId}">
					<input type="hidden" id="orderId" value="${orderId}">
					<div class="am-form-group">
						<label for="user-name" class="am-form-label">联系人</label>
						<div class="am-form-content">
							<input type="text" id="user-name" placeholder="联系人 必填">
						</div>
					</div>

					<div class="am-form-group">
						<label for="user-phone" class="am-form-label">手机号码</label>
						<div class="am-form-content">
							<input id="user-phone" id="user-phone" placeholder="手机号必填"
								type="email">
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-address" class="am-form-label">所在地</label>
						<div class="am-form-content address">
							<select data-am-selected id="whatProvince">
								<option value="a">广东省</option>
							</select> <select data-am-selected id="whatCity">
								<option value="a">汕头市</option>
							</select> <select data-am-selected id="whatArea">
								<option value="a">潮阳区</option>
								<option value="b">潮南区</option>
							</select>
						</div>
					</div>

					<div class="am-form-group">
						<label for="user-intro" class="am-form-label">详细地址</label>
						<div class="am-form-content">
							<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
							<small>100字以内写出你的详细地址,必填...</small>
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-intro" class="am-form-label">故障原因</label>
						<div class="am-form-content">
							<textarea class="" rows="3" id="what-problem" placeholder="输入故障原因"></textarea>
							<small>100字以内写下产品故障原因,必填...</small>
						</div>
					</div>

					<div class="am-form-group">
						<div class="am-u-sm-9 am-u-sm-push-3">
							<a class="am-btn am-btn-danger" disable="true"
								onclick="addRepair()">提交</a> <a 
								class="am-close am-btn am-btn-danger" data-am-modal-close onclick="javascript:location.href = document.referrer">取消</a>
						</div>
					</div>
				</form>
			</div>

		</div>

	</div>


 	<script type="text/javascript">
 	function addRepair() {
		var whatProvince = $("#whatProvince option:selected").html();
		var whatCity = $("#whatCity option:selected").html();
		var whatArea = $("#whatArea option:selected").html();
		var moreAddress = $("#user-intro").val();
		var whatProblem = $("#what-problem").val();
		var userName = $("#user-name").val();
		var userPhone = $("#user-phone").val();
		var prodId = $("#prodId").val();
		var orderId = $("#orderId").val();
		
		var userAddress = whatProvince + whatCity + whatArea + moreAddress;
		var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
		
		if(whatProblem == "" || moreAddress == "" || userName == "" || userPhone == "" || !myreg.test(phone)) {
			 floatNotify.simple("输入有误");
			return;
		}
		
		jQuery.ajax({
			url : '${ctx}' + "/addRepair",
			data : {
				"userName" : userName,
				"userAddress" : userAddress,
				"userPhone" : userPhone,
				"prodId" : prodId,
				"orderId" : orderId,
				"whatProblem" : whatProblem
 			},
			type : 'post',
			async : false, //默认为true 异步   
			dataType : 'json',
			error : function(data) {
			},
			success : function(retData) {
				if (retData.code == 0) {
					floatNotify.simple("提交成功,请返回");
					$("#prodId").val("");
				} else if(retData.code == -98){
					floatNotify.simple("表单失效,请返回");
				}
			}
		});
		
	} 
 	
 	</script>

</body>
</html>