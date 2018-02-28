<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>璐小鹿祝您购物愉快~</title>

		<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath()%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="<%= request.getContextPath()%>/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="<%= request.getContextPath()%>/css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="<%= request.getContextPath()%>/basic/js/jquery-1.7.min.js"></script>
		<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
		<script src="<%= request.getContextPath()%>/js/myjs/datail.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath()%>/basic/js/quick_links.js"></script>

		<script type="text/javascript" src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/list.js"></script>
</head>
<body>

<div id="hiddenuser" hidden="hidden" >${user.code}</div>
<div id="hiddenproduct" hidden="hidden" >${json.code}</div>

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
	<div class="listMain">

		<!--分类-->
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
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li><a href="#">首页</a></li>
			<li><a href="#">分类</a></li>
			<li class="am-active">内容</li>
		</ol>
		
		<!--放大镜-->

		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">

				<div class="box">
					

					<div class="tb-booth tb-pic tb-s310">
						<a ><img src="<%= request.getContextPath()%>${json.url}"  alt="细节展示放大镜特效"  class="jqzoom" /></a>
					</div>
					<ul class="tb-thumb" id="thumblist">
						<li class="tb-selected">
							<div class="tb-pic tb-s40">
								<a href="#"><img src="<%= request.getContextPath()%>${json.url}" ></a>
							</div>
						</li>
					</ul>
				</div>

				<div class="clear"></div>
			</div>

			<div class="clearfixRight">

				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1>	
						 ${json.productname} 
         			</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
					<ul>
						<li class="price iteminfo_price">
						<dl>	
							<dt>促销价</dt>
							<dd><em>¥</em><b class="sys_item_price"> ${json.money} </b>  </dd>                                 
						</dl>
						</li>
						<li class="price iteminfo_mktprice">
						<dl>
							<dt>原价</dt>
							<dd><em>¥</em><b class="sys_item_mktprice">98.00</b></dd>									
						</dl>
						</li>
					</ul>	
					<div class="clear"></div>
					</div>

					<!--地址-->
					<dl class="iteminfo_parameter freight">
				
					</dl>
					<div class="clear"></div>

					<!--销量-->
					<ul class="tm-ind-panel">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon"><span class="tm-label">月销量</span><span class="tm-count">1015</span></div>
						</li>
						<li class="tm-ind-item tm-ind-sumCount canClick">
							<div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count">6015</span></div>
						</li>
						<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
							<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">640</span></div>
						</li>
					</ul>
					<div class="clear"></div>

					<!--各种规格-->
					<dl class="iteminfo_parameter sys_item_specpara">
						<dt class="theme-login">
							<span class="cart-title">可选规格<span class="am-icon-angle-right"></span>
							</span>
						</dt>
						<dd>
							<!--操作页面-->

							<div class="theme-popover-mask"></div>

							<div class="theme-popover">
								<div class="theme-span"></div>
								<div class="theme-poptit">
									<a href="javascript:;" title="关闭" class="close">×</a>
								</div>
								<div class="theme-popbod dform">
									<form class="theme-signin" name="loginform" action="" method="post">

										<div class="theme-signin-left">

											<div class="theme-options">
												<div class="cart-title">口味</div>
												<ul>
													<li class="sku-line selected">原味<i></i></li>
													<li class="sku-line">奶油<i></i></li>
													<li class="sku-line">炭烧<i></i></li>
													<li class="sku-line">咸香<i></i></li>
												</ul>
											</div>
											<div class="theme-options">
												<div class="cart-title">包装</div>
												<ul>
													<li class="sku-line selected">手袋单人份<i></i></li>
													<li class="sku-line">礼盒双人份<i></i></li>
													<li class="sku-line">全家福礼包<i></i></li>
												</ul>
											</div>
											<div class="theme-options">
												<div class="cart-title number">数量</div>
												<dl>
												<dd id="aaa">
													<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
													<input id="text_box" name="" type="text" value="1" style="width:30px;" />
													<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
													<span id="Stock" class="tb-hidden">库存<span class="stock"> ${json.number}</span>件</span>
												</dd>
												</dl>

											</div>
											<div class="clear"></div>

											<div class="btn-op">
												<div class="btn am-btn am-btn-warning">确认</div>
												<div class="btn close am-btn am-btn-warning">取消</div>
											</div>
										</div>
										<div class="theme-signin-right">
											<div class="img-info">
												<img src="<%= request.getContextPath()%>/images/songzi.jpg" />
											</div>
											<div class="text-info">
												<span class="J_Price price-now">¥39.00</span>
												<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
											</div>
										</div>

									</form>
								</div>
							</div>

						</dd>
					</dl>
					<div class="clear"></div>
					<!--活动	-->
					<div class="shopPromotion gold">
						<div class="hot">
							<dl><dt class="tb-metatit">店铺优惠</dt></dl>
							<div class="gold-list">
								<p>购物满2件打8折，满3件7折<span>优惠多多</span></p>
							</div>
						</div>
						
					</div>
				</div>

				<div class="pay">
					<ul>
					<li style="margin-left: 10px">
						
						<form action="<%= request.getContextPath()%>/OrderController/buy.do" method="post">
							<input type="text" name="pproductname" id="pproductname" value="${json.productname} " hidden="hidden" />
							<input type="text" name="purl" id="purl" value="${json.url }" hidden="hidden" />
							<input type="text" name="pmoney" id="pmoney" value="${json.money }" hidden="hidden" />
							<input type="text" name="number" id="number" value="1" hidden="hidden" />
							<input type="text" name="productcode" id="productcode" value="${json.code}" hidden="hidden" />
							<input style="width: 98px;height: 30px;background-color: #F03726;border: 1px solid #F03726;color: white;" title="加入购物车" type="submit" id="LikBuy"  value="立即购买"/>
						</form>
					</li>
					<li style="margin-left: 20px">
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="addshopcar" title="加入购物车" href="#"><i></i>加入购物车</a>
						</div>
					</li>
					<li>
						<div id="showlabel" style="color: red;margin-left: 10px;margin-top: 3px;font-size: 16px;"></div>	
					</li>
					</ul>
				</div>

			</div>

			<div class="clear"></div>

		</div>

		
		<div class="clear"></div>
		
	
	
		<div class="clear"></div>

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
	</body>
</html>