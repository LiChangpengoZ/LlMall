<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付支付~</title>
	<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/css/cartstyle.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/css/jsstyle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/address.js"></script>	
	<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
	<script src="<%= request.getContextPath()%>/js/myjs/pay.js"></script>
</head>
<body>
	<span id="jproduct" hidden="hidden">${jproduct}</span>
	<span id="jaddress" hidden="hidden">${jaddress}</span>
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
		<div class="concent">
			<!--地址 -->
			<div class="paycont">
				<div class="address">
					<h3>确认收货地址 </h3>
					<div class="control">
						<a class="tc-btn createAddr theme-login am-btn am-btn-danger">地址管理</a>
					</div>
					<div class="clear"></div>
					<ul id="address">
						
					</ul>
	
					<div class="clear"></div>
				</div>
				
	
				<!--订单 -->
				<div class="concent">
					<div id="payTable">
						<h3>确认订单信息</h3>
						<div class="cart-table-th">
							<div class="wp">
	
								<div class="th th-item">
									<div class="td-inner">商品信息</div>
								</div>
								<div class="th th-price">
									<div class="td-inner">单价</div>
								</div>
								<div class="th th-amount">
									<div class="td-inner">数量</div>
								</div>
								<div class="th th-sum">
									<div class="td-inner">金额</div>
								</div>
								
							</div>
						</div>
						<div class="clear"></div>
	
						<div class="item-list">
							<div class="bundle  bundle-last">
	
								<div class="bundle-main" id="prodectlist">
									
										
	
								</div>
							</div>	
						</div>
						<div class="clear"></div>
						</div>
						</div>
						<div class="clear"></div>
						<div class="pay-total">
					
						
						<!--信息 -->
						<div class="order-go clearfix" id="hid" >
							<div class="pay-confirm clearfix">
								<div class="box">
									<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
										<span class="price g_price ">
	                                  <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee"></em>
										</span>
									</div>
	
									<div id="holyshit268" class="pay-address">
	
										<p class="buy-footer-address">
											<span class="buy-line-title buy-line-title-type">寄送至：</span>
											<span class="buy--address-detail">
							 				<span class="province" id="sheng"></span>
											<span class="city" id="shi"></span>
											<span class="dist" id="qu"></span>
											<span class="street" id="full"></span>
											</span>
										</p>
										<p class="buy-footer-address">
											<span class="buy-line-title" >收货人：</span>
											<span class="buy-address-detail">   
	                                       <span class="buy-user" id="recipe">艾迪 </span>
											<span class="buy-phone" id="telephone">15871145629</span>
											</span>
										</p>
									</div>
								</div>
	
								<div id="holyshit269" class="submitOrder">
									<div class="go-btn-wrap">
										<form method="post"  action="<%= request.getContextPath()%>/OrderController/submit.do">
									 		<input type="text" name="usercode" id="usercode" value="" hidden="hidden" />
									 		<input type="text" name="productcode" id="productcode" value="" hidden="hidden" />
									 		<input type="text" name="number" id="number" value="" hidden="hidden" />
									 		<input type="text" name="money" id="money" value="" hidden="hidden" />
									 		<input type="text" name="addresscode" id="addresscode" value="" hidden="hidden" />
									 		<input class="btn-go" style="border: 0px;float: right;" type="submit" value="提交订单"/>
									 	</form>	
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
	
					<div class="clear"></div>
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

	</body>
</html>