<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>亲!您的订单~</title>
<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/css/orstyle.css" rel="stylesheet" type="text/css">
<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
<script src="<%= request.getContextPath()%>/js/myjs/order.js"></script>
</head>
<body>
	<div id="jorderlist" hidden="hidden">${jorderlist}</div>	
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
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
			    <b class="line"></b>
			</div>
		</article>
	</header>
	<div class="nav-table">
	<div class="long-title"><span class="all-goods">全部分类</span></div>
	<div class="nav-cont">
		<ul>
			<li class="index"><a href="<%=request.getContextPath() %>/jsp/index.jsp" target="_top" class="h">首页</a></li>
            <li class="qc"><a href="#">闪购</a></li>
            <li class="qc"><a href="#">限时抢</a></li>
            <li class="qc"><a href="#">团购</a></li>
            <li class="qc last"><a href="#">大包装</a></li>
		</ul>
	</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap" style="margin-left: 0px;">
				<div class="user-order">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
					</div>
					<hr/>
					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>
						</ul>
						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<span class="td-inner">商品</span>
									</div>
									<div class="th th-price">
										<span class="td-inner">单价</span>
									</div>
									<div class="th th-number">
										<span class="td-inner">数量</span>
									</div>
									<div class="th th-operation">
										<span class="td-inner">商品操作</span>
									</div>
									<div class="th th-amount">
										<span class="td-inner">合计</span>
									</div>
									<div class="th th-status">
										<span class="td-inner">交易状态</span>
									</div>
									<div class="th th-change">
										<span class="td-inner">交易操作</span>
									</div>
								</div>
								<div class="order-main">
									<div class="order-list">
										<!--交易成功-->
										<div class="order-status5" id="orderlist">
										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--底部-->
				<div class="footer">
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
			</div>
		</div>
	</div>	
	</body>
</html>