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
<link rel="stylesheet" href="<%= basePath %>/css/order3.css?v=01291"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no" name="format-detection">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1;user-scalable=no;">
<title>会员登录</title>
<script charset="utf-8" src="js/randomimage.js?v=01291"></script>
<script charset="utf-8" src="js/login.js?v=01291"></script>
<script type="text/javascript">
		var error = '';
</script>
</head>
<body class="" style="background-color:#fff">
<header class="header">
    <div class="fix_nav">
        <div style="max-width:768px;margin:0 auto;background:#000000;position: relative;">
            <a class="nav-left back-icon" href="javascript:history.back();">返回</a>
            <div class="tit" style="font-size:18px;">会员登陆</div>
        </div>
    </div>
</header>
<div class="maincontainer">
   <div class="container itemdetail mini-innner">
    <div class="row">
        <div class="col-md-12 tal mt20">
            <form  id="theForm"  name="theForm" class="form-signin"  action="/p/j_spring_security_check" method="POST" >
            <input type="hidden" id="returnUrl" name="returnUrl" value="http://m.legendshop.cn/p/orderDetails"/>
              
              <input name="j_username" id="username" type="text" style="margin-bottom: -2px;-webkit-appearance:none; " class="form-control" placeholder="手机号码" message="账号" required="true"  tabindex="1" >
              <input id="pwd" name="j_password" type="password" class="form-control" placeholder="请输入密码" message="密码" required="true" style="-webkit-appearance:none;" autocomplete="off"  tabindex="2" >
              <input id="name" name="j_name" type="text" class="form-control" placeholder="请输入用户名" message="用户名" required="true" style="-webkit-appearance:none;" autocomplete="off"  tabindex="3" >
              <br>
              <div class="clear"></div>
		      <div class="col-xs-6 p0">
			         <input id="checkCode" name="j_checkCode" type="text" class="form-control" placeholder="请输入验证码" message="验证码" required="true" style="-webkit-appearance:none;" autocomplete="off"  tabindex="4" >
		      </div>
		      <div class="col-xs-5 p0" style="margin-left:10px;">
		             <button type="button" id="btnSendCode" class="btn btn-info btn-block" onclick="sendMessage()" tabindex="5" >获取验证码</button>
		      </div>
		       <div class="clear"></div>
		      <br>
                <div class="col-xs-6 p0"><button type="button" class="btn btn-info btn-block" onclick="userRegister();"  tabindex="5" >注册</button></div>
                <div class="col-xs-5 p0" style="margin-left:10px;"><button type="button" class="btn btn-default btn-block" onclick="window.location.href='<%= basePath%>/login'"  tabindex="6" >登录</button></div>
            </form>
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
							<div class="modal-body" id = "modalTitle">您尚未登录，无法加入购物车</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>

<script type="text/javascript">
var contextPath = '';
var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数
$(document).ready(function(){
      $('#pwd').attr('disabled',true);
      $("#checkCode").attr("disabled", true);
      $("#btnSendCode").attr("disabled", true);
	  $("#username").blur(function(){
		  var phone = $('#username').val();  
		  var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
		  if(phone == ''){
			  $('#modalTitle').html("手机号码不能为空");
			  $('#myModal').modal('show');
			  $('#pwd').attr('disabled',true);
		      $("#checkCode").attr("disabled", true);
		      $("#btnSendCode").attr("disabled", true);
			  return;
		  } else if(!myreg.test(phone)) {
			  $('#modalTitle').html("手机号码不符合格式");
			  $('#myModal').modal('show');
			  $('#pwd').attr('disabled',true);
		      $("#checkCode").attr("disabled", true);
		      $("#btnSendCode").attr("disabled", true);
			  return;
		  }
		  jQuery.ajax({
				url : "${ctx}/checkPhone",
				data : {
					"phone" : $('#username').val()
				},
				type : 'post',
				async : false, //默认为true 异步   
				dataType : 'json',
				error : function(data) {
					$('#modalTitle').html("服务器出错");
					$('#myModal').modal('show');
				},
				success : function(retData) {
					if (retData.code == 0) {
						$('#modalTitle').html("该手机号码已经被注册");
						$('#myModal').modal('show');
						 $('#pwd').attr('disabled',true);
						 $("#checkCode").attr("disabled", true);
						 $("#btnSendCode").attr("disabled", true);
					} else if (retData.code == -99) {
						$('#pwd').attr('disabled',false);
						$("#checkCode").attr("disabled", false);
						$("#btnSendCode").attr("disabled", false);
					}
				}
			});
	  });
	});
	
function sendMessage() {
	 curCount = count;
	 //设置button效果，开始计时
     $("#btnSendCode").attr("disabled", "true");
     $("#btnSendCode").html("请在" + curCount + "秒内输入");
     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
     jQuery.ajax({
			url : "${ctx}/sendSms",
			data : {
				"phone" : $('#username').val()
			},
			type : 'post',
			async : false, //默认为true 异步   
			dataType : 'json',
			error : function(data) {
				$('#modalTitle').html("服务器错误");
				$('#myModal').modal('show');
			},
			success : function(retData) {
				if (retData.code == -99) {
					$('#modalTitle').html(retData.message);
					$('#myModal').modal('show');
					 $('#pwd').attr('disabled',true);
					 $("#checkCode").attr("disabled", true);
					 $("#btnSendCode").attr("disabled", true);
				} else if (retData.code == 0) {
					floatNotify.simple("验证码发送成功");
					$('#pwd').attr('disabled',false);
					$("#checkCode").attr("disabled", false);
					$("#btnSendCode").attr("disabled", false);
				}
			}
		});
}

//timer处理函数
function SetRemainTime() {
     if (curCount == 0) {                
          window.clearInterval(InterValObj);//停止计时器
          $("#btnSendCode").removeAttr("disabled");//启用按钮
          $("#btnSendCode").html("重新发送验证码");
     }
     else {
          curCount--;
          $("#btnSendCode").html("请在" + curCount + "秒内输入");
     }
}

function userRegister() {
	
	var checkcode,pwd,name;
	checkcode = $("#checkCode").val();
	pwd = $("#pwd").val();
	name = $("#name").val();
	if(checkcode == '') {
		$('#modalTitle').html("请输入验证码");
		$('#myModal').modal('show');
		return;
	}
	if(pwd == ''){
		$('#modalTitle').html("请输入密码");
		$('#myModal').modal('show');
		return;
	}
	if(name == ''){
		$('#modalTitle').html("请输入用户名");
		$('#myModal').modal('show');
		return;
	}
	jQuery.ajax({
		url : "${ctx}/registerGo",
		data : {
			"userPhone" : $('#username').val(),
			"checkCode" : checkcode,
			"userPassword" : pwd,
			"userName" : name
		},
		type : 'post',
		async : false, //默认为true 异步   
		dataType : 'json',
		error : function(data) {
			$('#modalTitle').html("服务器出错");
			$('#myModal').modal('show');
		},
		success : function(retData) {
			$('#modalTitle').html(retData.message);
			$('#myModal').modal('show');
		}
	});
	
}

</script>
</body>
</html>
