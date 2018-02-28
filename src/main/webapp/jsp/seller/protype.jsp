<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>         
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类管理~</title>
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
	<script src="<%= request.getContextPath()%>/js/myjs/protype.js"></script>
</head>
<body>
<div id="jonelist" hidden="hidden" >${jonelist}</div>
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
				<label style="height: 40px;font-size: 50px;text-align: center;font-family:'楷体';color: orangered;letter-spacing: 9px;">卖家分类管理</label>
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
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">分类管理</strong> / <small>Type</small></div>
				</div>
				<hr/>
				<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
					<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active"><a href="#tab1"  onclick="changehid()">删除分类</a></li>
						<li><a href="#tab2" >增加分类</a></li>
						<li><a href="#tab3" >修改分类</a></li>
					</ul>

					<div class="am-tabs-bd">
<!-- 1 -->
						<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="height: 600px">
							<div  id="doc-modal-1">
								<div class="add-dress">
									<!--标题 -->
									<div class="am-cf am-padding">
										<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">删除分类</strong> / <small>Delete&nbsp;ProductType</small></div>
									</div>
									<hr/>
			
									<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
										<form method="post" action="<%= request.getContextPath()%>/ProductController/deleteType.do" class="am-form am-form-horizontal">
											<div class="am-form-group">
												<label for="user-address" class="am-form-label">所属分类</label>
												<div class="am-form-content address">
													<select required="required" id="deone" name="parentcode" required="required" onchange="onechange('deone')" style="background-color: white;" data-am-selected >
														
													</select>
													<select required="required" id="detwo" name="code" style="background-color: white;" data-am-selected >
														
													</select>
												</div>
											</div>
											
					
											<div class="am-form-group">
												<div class="am-u-sm-9 am-u-sm-push-3">
													<input name="submit" type="submit" class="am-btn am-btn-danger" value="删除">
													<input name="close" type="reset" class="am-close am-btn am-btn-danger">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
<!-- 2	 -->
						<div class="am-tab-panel am-fade am-in am-active" id="tab2" style="height: 600px">
							<div  id="doc-modal-1">
								<div class="add-dress">
									<!--标题 -->
									<div class="am-cf am-padding">
										<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">增加分类</strong> / <small>Add&nbsp;ProductType</small></div>
									</div>
									<hr/>
			
									<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
										<form method="post" enctype="multipart/form-data" action="<%= request.getContextPath()%>/ProductController/insertType.do" class="am-form am-form-horizontal">
			
											<div class="am-form-group">
												<label for="user-name" class="am-form-label">分类名称</label>
												<div class="am-form-content">
													<input name="typename" type="text" id="user-name" placeholder="分类名称">
												</div>
											</div>
											<div class="am-form-group">
												<label for="user-address" class="am-form-label">所属分类</label>
												<div class="am-form-content address">
													<select required="required" id="inone" name="parentcode" onchange="onechange('inone')" style="background-color: white;" data-am-selected >
														
													</select>
												</div>
											</div>
											<div class="am-form-group">
												<label for="user-name" class="am-form-label">分类排序</label>
												<div class="am-form-content">
													<input name="orderby" type="text" id="user-name" style="width: 64px;margin-right: 10px;display: inline-block;">
													<b>请输入大于2的小数~</b>
												</div>
											</div>
					
											<div class="am-form-group">
												<div class="am-u-sm-9 am-u-sm-push-3">
													<input name="submit" type="submit" class="am-btn am-btn-danger">
													<input name="close" type="reset" class="am-close am-btn am-btn-danger">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
<!-- 3	 -->
						<div class="am-tab-panel am-fade am-in am-active" id="tab3" style="height: 600px">
							<div  id="doc-modal-1">
								<div class="add-dress">
									<!--标题 -->
									<div class="am-cf am-padding">
										<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改分类</strong> / <small>Update&nbsp;ProductType</small></div>
									</div>
									<hr/>
			
									<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
										<form method="post" action="<%= request.getContextPath()%>/ProductController/updateType.do" class="am-form am-form-horizontal">
			
											
											<div class="am-form-group">
												<label for="user-address" class="am-form-label">所属分类</label>
												<div class="am-form-content address">
													<select id="upone" name="parentcode" required="required" onchange="onechange('upone')" style="background-color: white;" data-am-selected >
														
													</select>
													<select id="uptwo" name="code"  style="background-color: white;" data-am-selected >
														
													</select>
													<label style="margin-top: 10px">请选择二级分类，如未选择，默认修改一级分类</label>
												</div>
											</div>
											<div class="am-form-group">
												<label for="user-name" class="am-form-label">分类名称</label>
												<div class="am-form-content">
													<input name="typename" type="text" id="typename" placeholder="分类名称">
												</div>
											</div>
											<div class="am-form-group">
												<label for="user-name" class="am-form-label">分类排序</label>
												<div class="am-form-content">
													<input name="orderby" type="text" id="orderby" style="width: 64px;margin-right: 10px;display: inline-block;">
													<b>请输入大于2的小数~</b>
												</div>
											</div>
											<div class="am-form-group">
												<div class="am-u-sm-9 am-u-sm-push-3">
													<input name="submit" type="submit" class="am-btn am-btn-danger">
													<input name="close" type="reset" class="am-close am-btn am-btn-danger">
												</div>
											</div>
										</form>
									</div>
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
</body>
</html>