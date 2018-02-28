<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>亲！您要寄往哪里？</title>
<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath()%>/css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath()%>/css/jsstyle.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath()%>/css/addstyle.css" rel="stylesheet" type="text/css">
<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
<script src="<%= request.getContextPath()%>/js/myjs/myaddress.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/js/address.js"></script>
</head>
<body>
<div id="jaddress" hidden="hidden">${jaddress}</div>	
<!--头 -->
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
	<div class="col-main" style="background-color:white;">
		<div class="main-wrap" >
			<div class="user-address">
				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
				</div>
				<hr/>
				<ul id="addresslist" class="am-avg-sm-1 am-avg-md-3 am-thumbnails">

					

					
				</ul>
				<div class="clear"></div>
				<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
				<!--例子-->
				<div  id="doc-modal-1">

					<div class="add-dress">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
						</div>
						<hr/>

						<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
							<form  method="post"  action="<%= request.getContextPath()%>/UserController/addar.do" class="am-form am-form-horizontal">

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">收货人</label>
									<div class="am-form-content">
										<input name="recipe" type="text" id="user-name" placeholder="收货人">
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">手机号码</label>
									<div class="am-form-content">
										<input name="telephone" id="user-phone" placeholder="手机号必填" type="text" onblur="IsPhone()">
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-address" class="am-form-label">所在地</label>
									<div class="am-form-content address">
										<select name="sheng" data-am-selected id="sheng" onchange="sechange('sheng')">
										</select>
										<select name="shi" data-am-selected id="shi"  onchange="sechange('shi')">
										</select>
										<select name="qu" data-am-selected id="qu"  onchange="sechange('qu')">
										</select>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-intro" class="am-form-label">详细地址</label>
									<div class="am-form-content">
										<textarea name="full" class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
										<small>100字以内写出你的详细地址...</small>
									</div>
								</div>

								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-3">
											<input class="am-btn am-btn-danger" type="submit" name="" id="submit" value="提交" />
											<input class="am-close am-btn am-btn-danger" type="reset" value="重置" />
									</div>
								</div>
							</form>
						</div>

					</div>

				</div>

			</div>
			<div class="clear"></div>
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

	
		<div class="theme-popover" style="padding-right: 50px" >
			<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" placeholder="收货人" id="uprecipe">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input  placeholder="手机号必填" type="text" id="uptelephone">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-address" class="am-form-label">所在地</label>
							<div class="am-form-content address">
								<select name="sheng" data-am-selected id="upsheng" onchange="sechange('upsheng')">
								</select>
								<select name="shi" data-am-selected id="upshi"  onchange="sechange('upshi')">
								</select>
								<select name="qu" data-am-selected id="upqu"  onchange="sechange('upqu')">
								</select>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3"  placeholder="输入详细地址" id="upfull"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<div class="am-btn am-btn-danger close" onclick="updatear()">修改</div>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>
	</body>
</html>