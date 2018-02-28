<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情~</title>
<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/css/orstyle.css" rel="stylesheet" type="text/css">
<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
<script src="<%= request.getContextPath()%>/js/myjs/orderinfo.js"></script>
</head>
<div hidden="hidden">${success}</div>
<div hidden="hidden" id="jorderlist1">${jallList}</div>
<body>
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

				<div class="user-orderinfo">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                  <em class="u-progress-stage-bg"></em>
                                  <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                  <em style="display: block;" class="stage-name">拍下商品</em>
                               </span>
							<span class="step-2 step">
                                  <em class="u-progress-stage-bg"></em>
                                  <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                  <em style="display: block;" class="stage-name">卖家发货</em>
                               </span>
							<span class="step-3 step">
                                  <em class="u-progress-stage-bg"></em>
                                  <i class="u-stage-icon-inner">3<em class="bg"></em></i>
                                   <em style="display: block;" class="stage-name">确认收货</em>
                               </span>
							<span class="step-4 step">
                                  <em class="u-progress-stage-bg"></em>
                                  <i class="u-stage-icon-inner">4<em class="bg"></em></i>
                                   <em style="display: block;" class="stage-name">交易完成</em>
                               </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<div class="order-infoaside" style="margin-left: 200px">
						<div class="order-logistics">
							<a href="logistics.html">
								<div class="latest-logistics">
									<p class="text">已签收,签收人是${success.arecipe}签收，感谢使用天天快递，期待再次为您服务</p>
									<div class="time-list">
										<span class="date">2017-12-19</span><span class="week">周六</span><span class="time">15:35:42</span>
									</div>
									<div class="inquire">
										<span class="package-detail">物流：天天快递</span>
										<span class="package-detail">快递单号: </span>
										<span class="package-number">373269427868</span>
									</div>
								</div>
								<span class="am-icon-angle-right icon"></span>
							</a>
							<div class="clear"></div>
						</div>
						<div class="order-addresslist">
							<div class="order-address">
								<div class="icon-add">
								</div>
								<p class="new-tit new-p-re">
									<span class="new-txt">${success.arecipe}</span>
									<span class="new-txt-rd2">${success.atelephone}</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">收货地址：</span>
										<span class="province">${success.asheng}</span>
										<span class="city">${success.ashi}</span>
										<span class="dist">${success.aqu}</span>
										<span class="street">${success.afull}</span></p>
								</div>
							</div>
						</div>
					</div>
					<div class="order-infomain">

						<div class="order-top">
							<div class="th th-item">
								<div class="td-inner">商品</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-number">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-operation">
								<div class="td-inner">商品操作</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">合计</div>
							</div>
							<div class="th th-status">
								<div class="td-inner">交易状态</div>
							</div>
							<div class="th th-change">
								<div class="td-inner">交易操作</div>
							</div>
						</div>

						<div class="order-main" id="orderlist">
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
</body>
</html>