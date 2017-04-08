<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<c:set var="version" value="V1.0" scope="session"/>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404——SORRY你要访问的页面弄丢了</title>

<style type="text/css">
	body { background-color:#def0f0;font-family: "微软雅黑";font-weight: ;font: normal 100% Helvetica, Arial,sans-serif 900;}
	a{ text-decoration:none;outline: none; outline:none;}
	*{ margin:0px; padding:0px;}
	a:link {color: #fff; text-decoration: none ;outline:none;}
	a:visited {color: #fff; text-decoration: none;outline:none;}
	a:hover {color: #fff; text-decoration: none;outline:none;}
	.container {margin-left: auto; width: 100%; margin-right: auto; text-align: center; margin-top:50px;}
	.container_1 img { margin-top:5%; height:100px;}
	.container_2 img { margin-top:-2%; height:150px; }
	.container_3 img { width:25%; height:7.5%;}
	.container_3_1 { color:#6bbaa3; font-size:1.5rem; text-align:center;}
	.container_3_2 { color:#6bbaa3; font-size:0.8rem; text-align:center; margin-top: 10px;}
	.maincolumn {margin-left: auto; width: 100%; max-width:640px; margin-right: auto; text-align: center;display:block; margin-top:10px;}
	.maincolumn .maincolumn_bg { width:100%; height:50px; line-height:50px; background-color:#6bbaa3; margin:auto;}
	.maincolumn .maincolumn_bg ul {list-style-type: none;}
	.maincolumn .maincolumn_bg ul li { float:left;  width:25%;}
	.maincolumn .maincolumn_bg ul li a{ font-size: 14px; outline:none; text-decoration: none ;}
	.maincolumn .maincolumn_bg ul li a:hover { width:100%; height:50px; background-color:#47997d; display:block;text-decoration: none ; outline:none;}
} 
</style>

</head>
<body>
<div class="container">
      <div class="container_1"><img src="<%= basePath%>/image/404.png"></div>
      <div class="container_2"><img src="<%= basePath%>/image/3.22.gif"></div>
         <div class="container_3_1"><span>SORRY你要访问的页面弄丢了</span></div>
         <div class="container_3_2"><span>你可以通过以下方式重新访问......</span></div>
      </div>

    <!--导航-->
	<div class="maincolumn">
	  <div class="maincolumn_bg">
         <ul>
           <li><a href="javascript:history.go(-1);">返回上一页</a></li>
           <li><a href="<%= basePath%>/index">返回首页</a></li>
         </ul>
      </div>
	  <div></div>
	</div>
	
</body>
</html>