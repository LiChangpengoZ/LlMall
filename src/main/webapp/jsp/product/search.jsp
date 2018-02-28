<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>璐小鹿给您展示商品~</title>
<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath()%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath()%>/css/seastyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%= request.getContextPath()%>/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/script.js"></script>
		<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
		<script src="<%= request.getContextPath()%>/js/myjs/search.js"></script>
</head>
<body>
		<div id="hiddenbox" hidden="hidden" >${result}</div>
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
					<a  href="#"></a>
					<form method="post"  action="<%= request.getContextPath()%>/ProductController/search.do">
						<input id="searchInput" name="productname" type="text" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" name="searchbtn" class="submit am-btn" value="搜索"  type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>
			<b class="line"></b>
           <div class="search">
			<div class="search-list">
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
			
				
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
	                  	<div class="theme-popover">														
							<div class="searchAbout">
								<span class="font-pale">相关搜索：</span>
								<a title="坚果" href="#">坚果</a>
								<a title="瓜子" href="#">瓜子</a>
								<a title="鸡腿" href="#">豆干</a>

							</div>
							<div class="clear"></div>
                        </div>
							<div class="search-content" style="width: 100%;">
								<div class="sort">
								<ul>
									<li class="first"><a title="综合">小鹿乱撞</a></li>
									<li><a title="销量">一鹿有你</a></li>
									<li><a title="价格">我不是露露</a></li>
									<li class="big"><a title="评价" href="#">我是六个核桃</a></li>
								</ul>
								</div>
								<div class="clear"></div>

								<ul id="product" class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
									
								</ul>
							</div>
							
							<div class="clear"></div>
							<!--分页 -->
							<ul id="limit" class="am-pagination am-pagination-right">
								
							</ul>

						</div>
					</div>
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
	</body>
</html>