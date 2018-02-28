<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
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
	<script src="<%= request.getContextPath()%>/js/myjs/seller.js"></script>
</head>
<body>
	<div id="jonetypelist" hidden="hidden" >${jonetypelist}</div>
	<div id="sellerproduct" hidden="hidden" >${sellerproduct}</div>
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
				<label style="height: 40px;font-size: 50px;text-align: center;font-family:'楷体';color: orangered;letter-spacing: 9px;">卖家商品管理</label>
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
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">商品管理</strong> / <small>Product</small></div>
				</div>
				<hr/>
				<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
					<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active"><a href="#tab1"  onclick="changehid()">所有商品</a></li>
						<li><a href="#tab2" onclick="changehid2()">上传商品</a></li>
					</ul>

					<div class="am-tabs-bd">
<!-- 1 -->
						<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="display: block;">
							<div class="order-top">
								<div class="th th-item">
									<span class="td-inner">商品</span>
								</div>
								<div class="th th-price">
									<span class="td-inner">单价</span>
								</div>
								<div class="th th-number">
									<span class="td-inner">库存</span>
								</div>
								<div class="th th-operation">
									<span class="td-inner">商品修改</span>
								</div>
								<div class="th th-change">
									<span class="td-inner">商品删除</span>
								</div>
							</div>

							<div class="order-main">
								<div class="order-list" id="productlist">
									<!--交易成功-->
									
								</div>
							</div>
						</div>
						<div class="clear"></div>
<!-- 2	 -->
						<div class="am-tab-panel am-fade am-in am-active" id="tab2">
							<div  id="doc-modal-1">
								<div class="add-dress">
									<!--标题 -->
									<div class="am-cf am-padding">
										<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">上传商品</strong> / <small>Add&nbsp;addproduct</small></div>
									</div>
									<hr/>
			
									<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
										<form method="post" enctype="multipart/form-data" action="<%= request.getContextPath()%>/ProductController/insertPro.do" class="am-form am-form-horizontal">
			
											<div class="am-form-group">
												<label for="user-name" class="am-form-label">商品名称</label>
												<div class="am-form-content">
													<input name="productname" type="text" id="user-name" placeholder="商品名称">
												</div>
											</div>
			
											<div class="am-form-group">
												<div class="am-form-inline">
													<div class="am-form-group" style="margin-right: -166px;">
														<label for="user-phone" class="am-form-label">单价</label>
														<div class="am-form-content" style="width: 20%;">
															<input name="money" id="user-phone" placeholder="单价" type="text">
														</div>
													</div>
													<div class="am-form-group">
														<label for="user-phone" class="am-form-label">数量</label>
														<div class="am-form-content" style="width: 20%;">
															<input name="number" id="user-phone" placeholder="数量" type="text">
														</div>
													</div>
												</div>
											</div>
											<div class="am-form-group am-form-file">
												<label for="user-phone" class="am-form-label">上传图片</label>
												<button style="color: black;margin-left:10px ;" type="button" class="am-btn am-btn-default am-btn-sm">
											    <i class="am-icon-cloud-upload"></i > 选择要上传的文件</button>
											  	<input name="file" type="file" multiple>
											</div>
											<div class="am-form-group">
												<label for="user-address" class="am-form-label">所属分类</label>
												<div class="am-form-content address">
													<select id="inone" name="one" onchange="onechange('inone')" style="background-color: white;" data-am-selected >
														
													</select>
													<select id="intwo" name="productTypecode" data-am-selected>
														
													</select>
												
												</div>
											</div>
			
											<div class="am-form-group">
												<label for="user-intro" class="am-form-label">商品描述</label>
												<div class="am-form-content">
													<script type="text/plain" name="descr" id="myEditor" style="width:1000px;height:240px;">    
		
													</script> 
													<script type="text/javascript">  
      													var um = UM.getEditor('myEditor');   
 													</script>  
													<small>100字以内写出你的详细地址...</small>
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
<!-- 3  -->
						<div class="am-tab-panel am-fade am-in am-active" id="tab3">
							<div  id="doc-modal-1">
								<div class="add-dress">
									<!--标题 -->
									<div class="am-cf am-padding">
										<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改商品</strong> / <small>Add&nbsp;updateproduct</small></div>
									</div>
									<hr/>
			
									<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
										<form method="post" enctype="multipart/form-data" action="<%= request.getContextPath()%>/ProductController/updatePro.do" class="am-form am-form-horizontal">
			
											<div class="am-form-group">
												<label for="user-name"  class="am-form-label">商品名称</label>
												<div class="am-form-content">
													<input name="productname" type="text" id="upname" placeholder="商品名称">
												</div>
											</div>
			
											<div class="am-form-group">
												<div class="am-form-inline">
													<div class="am-form-group" style="margin-right: -166px;">
														<label for="user-phone" class="am-form-label">单价</label>
														<div class="am-form-content" style="width: 20%;">
															<input id="upmoney" name="money" placeholder="单价" type="text">
														</div>
													</div>
													<div class="am-form-group">
														<label for="user-phone" class="am-form-label">数量</label>
														<div class="am-form-content" style="width: 20%;">
															<input id="upnumber" name="number" placeholder="数量" type="text">
														</div>
													</div>
												</div>
											</div>
											<div class="am-form-group am-form-file">
												<label for="user-phone" class="am-form-label">上传图片</label>
												<button style="color: black;margin-left:10px ;" type="button" class="am-btn am-btn-default am-btn-sm">
											    <i class="am-icon-cloud-upload"></i > 选择要上传的文件</button>
											  	<input type="file" multiple name="file">
											</div>
											<div class="am-form-group">
												<label for="user-address" class="am-form-label">所属分类</label>
												<div class="am-form-content address">
													<select id="upone" name="one" onchange="onechange('upone')" style="background-color: white;" data-am-selected >
														
													</select>
													<select id="uptwo" name="productTypecode" data-am-selected>
														
													</select>
												
												</div>
											</div>
			
											<div class="am-form-group">
												<label for="user-intro" class="am-form-label">商品描述</label>
												<div class="am-form-content">
													<script type="text/plain" name="descr" id="myEditor2" style="width:1000px;height:240px;">    
		
													</script> 
													<script type="text/javascript">  
      													var um = UM.getEditor('myEditor2');   
 													</script>  
													<small>100字以内写出你的详细地址...</small>
												</div>
											</div>
											<input id="code" name="code" hidden="hidden" >
											<div class="am-form-group">
												<div class="am-u-sm-9 am-u-sm-push-3">
													<input id="submit" name="submit" type="submit" class="am-btn am-btn-danger">
													<input id="close" name="close" type="reset" class="am-close am-btn am-btn-danger">
												</div>
											</div>
											
										</form>
									</div>
								</div>
							</div>
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
	

	</body>
</html>