<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>璐小鹿的购物车~</title>
	<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/css/cartstyle.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/css/optstyle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.js"></script>
	<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
	<script src="<%= request.getContextPath()%>/js/myjs/shopcar.js"></script>
</head>
<body>
	<div hidden="hidden">${allmoney}</div>
	<div id="shopcarbox" hidden="hidden">${shopcar}</div>
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
	
		<!--购物车 -->
		<div class="concent">
			<form action="<%=request.getContextPath() %>/OrderController/pay.do?" method="post">
			<div id="cartTable">
				<div class="cart-table-th">
					<div class="wp">
						<div class="th th-chk">
							<div id="J_SelectAll1" class="select-all J_SelectAll">
	
							</div>
						</div>
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
						<div class="th th-op">
							<div class="td-inner">操作</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
	
			
	
				<div class="item-list">
					<div class="bundle  bundle-last ">
						<div class="bundle-hd">
							<div class="bd-promos">
								<div class="bd-has-promo">小鹿乱撞&nbsp;&nbsp;&nbsp;<span class="bd-has-promo-content">一鹿有你</span>&nbsp;&nbsp;</div>
								<div class="act-promo">
									<a href="#" target="_blank">感谢您的惠顾~<span class="gt">&gt;&gt;</span></a>
								</div>
							</div>
						</div>
						<div class="clear"></div>
						<div class="bundle-main" id="shopcarlist">
							
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
	
			<div class="float-bar-wrapper">
				
<!-- 				<div id="J_SelectAll2" class="select-all J_SelectAll"> -->
						<div class="cart-checkbox" style="float: left;margin-left: 10px">
							<input onchange="allxz()" style="float:left;" class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
							<span style="display: inline-block;float: left;margin-top: 16px;margin-left: 10px">全选&nbsp;/&nbsp;全不选</span>
						</div>
						
<!-- 				</div> -->
				
				<div class="float-bar-right">
					<div class="amount-sum">
						<span class="txt">已选商品</span>
						<em id="J_SelectedItemsCount"></em><span class="txt">件</span>
						<div class="arrow-box">
							<span class="selected-items-arrow"></span>
							<span class="arrow"></span>
						</div>
					</div>
					<div class="price-sum">
						<span class="txt">合计:</span>
						<strong class="price">¥<em id="J_Total">${allmoney}</em></strong>
					</div>
					<div class="btn-area">
<%-- 						<a href="<%=request.getContextPath() %>/OrderController/pay.do?usercode=${user.code}" id="J_Go" class="submit-btn submit-btn-disabled" > --%>
<!-- 							<span >结&nbsp;算</span></a> -->
						<input type="submit" value="结算" style="background-color: #F40; border: 0px;font-size: 16px;color: white;"/>
					</div>
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
		</form>
		</div>
	
	</body>
</html>