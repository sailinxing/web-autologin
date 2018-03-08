<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*" %>
<%@ page import="com.lixinxin.domain.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date;" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
		<div id="father">
			<div>
				<img id="show" src="img/baidu.png" style="display: none;"/>
			</div>
			<div id="logo" >
				<div id="logo1">
					<img alt="找不到图片" src="img/mylogo.png" />
				</div>
				<div id="logo2">
					<c:if test="${empty user}">
					请登录!
						<a href="${pageContext.request.contextPath }/login.jsp" target="_blank">登录</a>
					</c:if>
					<c:if test="${!empty user}">
						<c:if test="${empty time}">
						您是第一次登录!
						</c:if>
						<c:if test="${!empty time}">
						您上次登录的时间是：${time}
						</c:if>
						<%
						// 记录上次登录时间
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						Date date = new Date();
						String time = sdf.format(date);
						session.setAttribute("time", time);
						%>
					欢迎您,${user.name}！您是第${Count}位访客;
						<a href="${pageContext.request.contextPath }/quitServlet" >退出</a>
					</c:if>
					
					<a href="${pageContext.request.contextPath}/register.jsp" target="_blank">注册</a>
					<a href="${pageContext.request.contextPath}/showShoppingCarServlet" target="_blank">购物车</a>
				</div>
			</div>
			<div class="clear"/>
			<div id="navigation">
				<ul>
					<a href="#"><li>首页</li></a>
					<a href="#"><li>手机</li></a>
					<a href="${pageContext.request.contextPath}/showProductsServlet" target="_blank"><li>家用电器</li></a>
					<a href="#"><li>鞋帽箱包</li></a>
				</ul>				
			</div>
			<div>
				<img id="roll" src="img/b1.jpg" alt="找不到此照片" width="100%"/>
			</div>
			<div>				
				<img src="img/tittle1.png" alt="找不到此照片" width="100%"/>								
			</div>
			<div style="width:100%;">
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
			<div style="width:100%;">
				<c:forEach items="${listProduct }" var="product">
					<div style="width:220px;height: 250px;padding-top:10px;text-align:center;border:1px solid black;float: left;"><br/>
						<img style="width:150px;height:150px;text-align: center;" src=${product.pimage} />
						<p>${product.pname}<br/>${product.shop_price}</p>
					</div>
				</c:forEach>		
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
				<p>Copyright &copy;2010-2017 千锋商城 版权所有</p>
			</div>
		</div>
	</body>
	<script>
			var i=1;
			window.onload=function(){
				setInterval(fn,1000);	
				var timer=setTimeout(shad,5000);
			};
			function fn(){				
				var roll=document.getElementById("roll");
				roll.src="img/b"+i+".jpg";
				i++;
				if(i==5){
					i=1;
				}
			}
			var ad=document.getElementById("show");
			function shad(){				
				ad.style.display="block";
				clearTimeout(timer);
				var timer=setTimeout(hidad,5000);
			}
			function hidad(){
				ad.style.display="none";
				clearTimeout(timer);
			}
	</script>
</html>
