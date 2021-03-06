<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>恭喜您购物成功~</title>
<link rel="stylesheet"  type="text/css" href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath()%>/css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%= request.getContextPath()%>/basic/js/jquery-1.7.min.js"></script>
</head>
<body>
<!--顶部导航条 -->
<div class="am-container header">
  <ul class="message-l">
				<li>
					<div class="topMessage">
						<div class="menu-hd">
						<c:if test="${empty sessionScope.user}">
							<a href="<%=request.getContextPath() %>/jsp/login.jsp"  class="h">亲，请登录</a>&nbsp;
							<a href="<%=request.getContextPath() %>/jsp/register.jsp" >免费注册</a>
						</c:if>
						<c:if test="${ not empty sessionScope.user }" >
							<a href="#" target="_top" class="h">${user.username}</a>
							<a href="<%=request.getContextPath() %>/UserController/cacnel.do" class="h">退出登录</a>
						</c:if>
						
							
						</div>
					</div>
				</li>
			</ul>
  		<ul class="message-r">
			<li>
				<div class="topMessage home">
					<div class="menu-hd"><a href="<%=request.getContextPath() %>/jsp/index.jsp" target="_top" class="h">商城首页</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng"><a href="<%=request.getContextPath() %>/UserController/addressShow.do" ><i class="am-icon-user am-icon-home"></i>地址管理</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng"><a href="<%=request.getContextPath() %>/UserController/loadOrder.do" ><i class="am-icon-user am-icon-reorder"></i>订单管理</a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="<%=request.getContextPath() %>/OrderController/showShopCar.do?actions=other&usercode=${user.code}" ><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
				</div>
			</li>
		</ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
   <div class="logoBig">
		<a href="<%=request.getContextPath() %>/jsp/index.jsp" target="_top" class="h">
			<img src="<%= request.getContextPath()%>/images/logobig.png" />
		</a>
	</div>
    
    <div class="search-bar pr">
		<a href="#"></a>
		<form method="post"  action="<%= request.getContextPath()%>/ProductController/search.do">
			<input id="searchInput" name="productname" type="text" placeholder="搜索" autocomplete="off">
			<input id="ai-topsearch" name="searchbtn" class="submit am-btn" value="搜索"  type="submit">
		</form>
	</div>   
</div>

<div class="clear"></div>



<div class="take-delivery">
 <div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em>${success.money}</em></li>                      
     </ul>
     <div class="user-info">
         <p>收货人：${success.arecipe}</p>
         <p>联系电话：${success.atelephone}</p>
         <p>收货地址：${success.asheng} ${success.ashi} ${success.aqu} ${success.afull}</p>
       </div>
            <span> 请认真核对您的收货信息，如有错误请联系客服</span>
     <div class="option">
       <span class="info">璐小鹿祝您购物愉快~</span>
     </div>
    </div>
  </div>
</div>


<div class="footer" >
 <div class="footer-hd">
 <p>
						<a>小鹿乱撞</a>
						<b>|</b>
						<a>一鹿有你</a>
						<b>|</b>
						<a>我不是露露</a>
						<b>|</b>
						<a>我是六个核桃</a>
					</p>
 </div>
 
</div>
</body>
</html>