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
<title>微信支付成功</title>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1.0, width=device-width, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/wxzf.css">
<script src="js/jquery.js"></script>
</head>
<body >
<div class="header">
  <div class="all_w" style="position:relative; z-index:1;">
    <div class="ttwenz" style=" text-align:center; width:100%;">
      <h4>交易详情</h4>
      <h5>微信安全支付</h5>
    </div>
    <a href="javascript:history.go(-2);" class="fh_but">返回</a> </div>
</div>

<div class="zfcg_box ">
<div class="all_w">
<img src="images/cg_03.jpg" > 支付成功 </div>

</div>
<div class="cgzf_info">
<div class="wenx_xx">
  <div class="mz">铭华电器商城</div>
  <div class="wxzf_price">${moneySum}</div>
</div>

<div class="spxx_shop">
 <div class=" mlr_pm">
 
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>商   品</td>
    <td align="right">联通手机缴费</td>
  </tr>
   <tr>
    <td>交易时间</td>
    <td align="right">${nowDate}</td>
  </tr>
   <tr>
    <td>支付方式</td>
    <td align="right">招商银行</td>
  </tr>
   <tr>
    <td>交易单号</td>
    <td align="right">${orderId}</td>
  </tr>
</table>

 </div>

</div>
</div>


<div class="wzxfcgde_tb"><img src="images/cg_07.jpg" ></div>
  
</body>
</html>