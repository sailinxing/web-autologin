<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lixinxin.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/style.css" />
	</head>
	<body>
		<div id="father">
			<div id="logo" >
				<div id="logo1">
					<img alt="找不到图片" src="img/mylogo.png" />
				</div>
				<div id="logo2">
					<a href="#">登录</a>
					<a href="register.html" target="_blank">注册</a>
					<a href="#">购物车</a>
				</div>
			</div>
			<div class="clear"/>
			<div id="navigation">
				<ul>
					<a href="#"><li>首页</li></a>
					<a href="#"><li>手机</li></a>
					<a href="#"><li>家用电器</li></a>
					<a href="#"><li>鞋帽箱包</li></a>
				</ul>				
			</div>
			<div>
				<img src="img/b1.jpg" alt="找不到此照片" width="100%"/>
			</div>
			<div>				
				<img src="img/tittle1.png" alt="找不到此照片" width="100%"/>							
			</div>
			<div style="width:100%;">
				<%-- <%
				List<Product> list=(List<Product>)request.getAttribute("productList");
				for(Product product:list){					
					out.print("<div style='width:220px;height: 250px;padding-top:10px;text-align:center;border:1px solid black;float: left;'><br/>");
					out.print("<img style='width:150px;height:150px;text-align: center;' src='"+product.getPimage()+"' />");
					out.print("<p>"+product.getPname()+"<br/>"+product.getShop_price()+"</p>");
					out.print("</div>");					
				}
				%> --%>
				<c:forEach items="${listProduct }" var="product">
					<div style="width:220px;height: 250px;padding-top:10px;text-align:center;border:1px solid black;float: left;"><br/>
						<img style="width:150px;height:150px;text-align: center;" src=${product.pimage} />
						<p>${product.pname}<br/>${product.shop_price}</p>
					</div>
				</c:forEach>
			</div>				
			<div class="clear"/> 
			 <div>
				<img alt="找不到照片" src="img/tittle2.png" width="100%"/>
			</div> 
			<div>
				<img alt="找不到照片" src="img/bottom.png" width="100%"/>
			</div>
			<div class="last">
				<a href="#">关于我们</a>
				<a href="#">联系我们 </a>
				<a href="#">招贤纳士</a>
				<a href="#">法律声明</a>
				<a href="#">友情链接</a>
				<a href="#">支付方式</a>
				<a href="#">配送方式</a>
				<a href="#">广告声明</a>				
			</div>
			<div class="last">
				<p>Copyright o2010-2017 千锋商城 版权所有</p>
			</div>
		</div>
	</body>
</html>
