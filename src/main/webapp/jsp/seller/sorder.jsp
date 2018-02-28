<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>     
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家您好！</title>
	<link href="<%= request.getContextPath()%>/css/orstyle.css" rel="stylesheet" type="text/css"> 
	<link href="<%= request.getContextPath()%>/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet"> 
    <script type="text/javascript" src="<%= request.getContextPath()%>/umeditor/third-party/jquery.min.js"></script>  
    <script type="text/javascript" src="<%= request.getContextPath()%>/umeditor/third-party/template.min.js"></script>  
    <script type="text/javascript" charset="utf-8" src="<%= request.getContextPath()%>/umeditor/umeditor.config.js"></script>  
    <script type="text/javascript" charset="utf-8" src="<%= request.getContextPath()%>/umeditor/umeditor.min.js"></script>  
    <script type="text/javascript" src="<%= request.getContextPath()%>/umeditor/lang/zh-cn/zh-cn.js"></script>  

	<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
	<link href="<%= request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css">
	
	<link href="<%= request.getContextPath()%>/css/addstyle.css" rel="stylesheet" type="text/css">
	<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
	<script src="<%= request.getContextPath()%>/js/myjs/sorder.js"></script>
</head>
<body>
	<div id="jusers" hidden="hidden" >${jusers}</div>
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
						<a href="#" target="_top" class="h">${user.username}</a>&nbsp;
						<a href="<%=request.getContextPath() %>/UserController/cacnel.do" class="h">退出登录</a>
					</c:if>
					</div>
				</div>
			</li>
		</ul>
		<ul class="message-r">
			<li>
				
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng"><a href="<%=request.getContextPath() %>/ProductController/sellerload.do" ><i class="am-icon-user am-icon-product-hunt"></i>商品管理</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng"><a href="<%=request.getContextPath() %>/ProductController/proType.do" ><i class="am-icon-user am-icon-tasks"></i>分类管理</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng"><a href="<%=request.getContextPath() %>/UserController/sellerOrder.do" ><i class="am-icon-user am-icon-reorder"></i>订单管理</a></div>
				</div>
				
			</li>
		</ul>
	</div>

	<!--悬浮搜索框-->
	<div class="nav white">
		<div class="logoBig">
			<img src="<%= request.getContextPath()%>/images/logobig.png" />
		</div>
		<div class="search-bar">
			<form style="border:0px;">
				<label style="height: 40px;font-size: 50px;text-align: center;font-family:'楷体';color: orangered;letter-spacing: 9px;">卖家订单管理</label>
			</form>
		</div>
	</div>
	<div class="clear"></div>
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
						<li class="am-active"><a href="#tab1"  onclick="changehid()">所有订单</a></li>
					</ul>

					<div class="am-tabs-bd">
<!-- 1 -->
						<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="display: block;">
							

							<div class="order-main">
								<form class="am-form-inline" role="form"  method="post"  action="<%= request.getContextPath()%>/UserController/sellerOrder.do">
									起始时间：
									<div class="am-form-group">	
										<div class="am-input-group am-datepicker-date" data-am-datepicker="{format: 'yyyy-mm-dd',viewMode: 'years'}">
										  <input name="sbegintime" style="height: 32px" type="text" class="am-form-field" placeholder="" readonly value="2018-01-01">
										  <span class="am-input-group-btn am-datepicker-add-on">
										    <button style="height: 32px" class="am-btn am-btn-default" type="button"><span class="am-icon-calendar"></span> </button>
										  </span>
										</div>		
									</div>
									结束时间：
									<div class="am-form-group">	
										<div class="am-input-group am-datepicker-date" data-am-datepicker="{format: 'yyyy-mm-dd',viewMode: 'years'}">
										  <input name="sendtime" style="height: 32px" type="text" class="am-form-field" placeholder="结束时间" readonly value="<fmt:formatDate value='<%=new java.util.Date()%>' pattern='yyyy-MM-dd'/>">
										  <span class="am-input-group-btn am-datepicker-add-on">
										    <button style="height: 32px" class="am-btn am-btn-default" type="button"><span class="am-icon-calendar"></span> </button>
										  </span>
										</div>		
									</div>
									
									  <div class="am-form-group">
									    <input name="susername" type="text" class="am-form-field" placeholder="用户名">
									  </div>
									
									  <div class="am-form-group">
									    <input name="sproname" type="text" class="am-form-field" placeholder="产品名">
									  </div>
									
									  
									
									  <button id="sub" type="submit" class="am-btn am-btn-default">查询</button>
									</form>
								
							
								<div class="order-list" id="productlist" style="margin-top: 10px">
									<!--交易成功-->
									
								</div>
							</div>
						</div>
						<div class="clear"></div>

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
	

	</body>
</html>