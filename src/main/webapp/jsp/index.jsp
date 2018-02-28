<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>璐小鹿欢迎您来到主页~</title>
	<link href="<%= request. getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="<%= request.getContextPath()%>/css/hmstyle.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/myjs/CONST.js"></script>
	<script src="<%= request.getContextPath()%>/js/myjs/index.js"></script>
</head>
<body>
	<div class="hmtop">
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
			
			
	<div class="banner">
    	<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="<%= request.getContextPath()%>/ProductController/datail.do?code=ad1"><img src="<%= request.getContextPath()%>/images/ad1.jpg" /></a></li>
				<li class="banner2"><a href="<%= request.getContextPath()%>/ProductController/datail.do?code=ad2"><img src="<%= request.getContextPath()%>/images/ad2.jpg" /></a></li>
				<li class="banner3"><a href="<%= request.getContextPath()%>/ProductController/datail.do?code=ad3"><img src="<%= request.getContextPath()%>/images/ad3.jpg" /></a></li>
				<li class="banner4"><a href="<%= request.getContextPath()%>/ProductController/datail.do?code=ad4"><img src="<%= request.getContextPath()%>/images/ad4.jpg" /></a></li>
			</ul>
		</div>
		<div class="clear"></div>	
	</div>						
			
	<div class="shopNav">
		<div class="slideall">    
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
		        				
				<!--侧边导航 -->
				<div id="nav" class="navfull">
					<div class="area clearfix">
						<div class="category-content" id="guide_2">		
							<div class="category">
								<ul class="category-list" id="js_climit_li">
									
									<li class="appliance js_toggle relative first" >
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/cake.png"></i><a class="ml-22" title="点心" id="one1"></a></h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side">
															<dl class="dl-sort" id="two1">
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div>
										<b class="arrow"></b>	
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/cookies.png"></i><a class="ml-22" title="饼干、膨化" id="one2"></a></h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side">
															<dl class="dl-sort" id="two2">
																
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div>
                                           <b class="arrow"></b>
									</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/meat.png"></i><a class="ml-22" title="熟食、肉类" id="one3"></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="two3">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																		<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																		<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                            <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/bamboo.png"></i><a class="ml-22" title="素食、卤味" id="one4"></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="two4">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																		<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																		<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                             <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/nut.png"></i><a class="ml-22" title="坚果、炒货" id="one5"></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="two5">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																		<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																		<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/candy.png"></i><a class="ml-22" title="糖果、蜜饯" id="one6"></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="two6">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																		<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																		<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                            <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/chocolate.png"></i><a class="ml-22" title="巧克力" id="one7"></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="two7">
																	</dl>
																	
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																		<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																		<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/fish.png"></i><a class="ml-22" title="海味、河鲜" id="one8"></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="two8">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																		<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																		<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                             <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/tea.png"></i><a class="ml-22" title="花茶、果茶" id="one9"></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="two9">
																		
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																		<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																		<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative last">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%= request.getContextPath()%>/images/package.png"></i><a class="ml-22" title="品牌、礼包" id="one10"></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="two10">
																	</dl>
																	
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>温馨寄语</span></dt>
																		<dd><a rel="nofollow" title="小鹿乱撞" target="_blank" href="#" rel="nofollow"><span  class="red" >小鹿乱撞</span></a></dd>
																		<dd><a rel="nofollow" title="一鹿有你" target="_blank" href="#" rel="nofollow"><span >一鹿有你</span></a></dd>
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>

											</li>
											
										</ul>
									</div>
								</div>

							</div>
						</div>
						<!--轮播 -->
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>				
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--今日推荐 -->

					<div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" >
							<img src="<%= request.getContextPath()%>/images/2016.png "></img>
							<p>今日<br>推荐</p>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
						<a href="<%= request.getContextPath()%>/ProductController/datail.do?code=tj">
							<div class="info ">
								<h3>真的有鱼</h3>
								<h4>开年福利篇</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%= request.getContextPath()%>/images/tj.png "></img>
							</div>
						</a>	
						</div>						
						<div class="am-u-sm-4 am-u-lg-3 ">
						<a href="<%= request.getContextPath()%>/ProductController/datail.do?code=tj1">
							<div class="info ">
								<h3>囤货过冬</h3>
								<h4>让爱早回家</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%= request.getContextPath()%>/images/tj1.png "></img>
							</div>
						</a>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
						<a href="<%= request.getContextPath()%>/ProductController/datail.do?code=tj2">
							<div class="info ">
								<h3>浪漫情人节</h3>
								<h4>甜甜蜜蜜</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%= request.getContextPath()%>/images/tj2.png"></img>
							</div>
						</a>
						</div>

					</div>
					<div class="clear "></div>
					<!--热门活动 -->

					<div class="am-container activity ">
						<div class="shopTitle ">
							<h4>活动</h4>
							<h3>每期活动 优惠享不停 </h3>
							<span class="more ">
                              <a class="more-link " href="# ">全部活动</a>
                            </span>
						</div>
					
					  <div class="am-g am-g-fixed ">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>	
								<h4>秒杀</h4>							
							<div class="activityMain ">
								<img src="<%= request.getContextPath()%>/images/activity1.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>														
						</div>
						
						<div class="am-u-sm-3 ">
						  <div class="icon-sale two "></div>	
							<h4>特惠</h4>
							<div class="activityMain ">
								<img src="<%= request.getContextPath()%>/images/activity2.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>								
							</div>							
						</div>						
						
						<div class="am-u-sm-3 ">
							<div class="icon-sale three "></div>
							<h4>团购</h4>
							<div class="activityMain ">
								<img src="<%= request.getContextPath()%>/images/activity3.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>							
						</div>						

						<div class="am-u-sm-3 last ">
							<div class="icon-sale "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="<%= request.getContextPath()%>/images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>													
						</div>

					  </div>
                   </div>
					<div class="clear "></div>

					<!--甜点-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>甜品</h4>
							<h3>每一道甜品都有一个故事</h3>
							<div class="today-brands ">
								<a href="# ">桂花糕</a>
								<a href="# ">奶皮酥</a>
								<a href="# ">栗子糕 </a>
								<a href="# ">马卡龙</a>
								<a href="# ">铜锣烧</a>
								<a href="# ">豌豆黄</a>
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多美味</a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodOne ">
						<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
							<a href="# ">
								<span class="outer-con ">
									<span class="title ">
										零食大礼包开抢啦
									</span>	
									<br>				
									<span class="sub-title ">
										当小鱼儿恋上软豆腐
									</span>
								</span>
                                  <img src="<%= request.getContextPath()%>/images/act1.png " />								
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
							<div class="text-two">
								<div class="outer-con ">
									<div class="title ">
										雪之恋和风大福
									</div>									
									<div class="sub-title ">
										仅售：¥13.8
									</div>
									
								</div>
								<a href="# "><img src="<%= request.getContextPath()%>/images/act2.png " /></a>
							</div>
							<div class="text-two last">
								<div class="outer-con ">
									<div class="title ">
										雪之恋和风大福
									</div>
									<div class="sub-title ">
										仅售：¥13.8
									</div>
									
								</div>
								<a href="# "><img src="<%= request.getContextPath()%>/images/act2.png " /></a>
						    </div>
						</div>
		             <div class="am-u-sm-12 am-u-md-4 ">
						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									小优布丁
								</div>
								
								<div class="sub-title ">
									尝鲜价：¥4.8
								</div>
							</div>
							<a href="# "><img src="<%= request.getContextPath()%>/images/act3.png " /></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									小优布丁
								</div>
								
								<div class="sub-title ">
									尝鲜价：¥4.8
								</div>
							</div>
							<a href="# "><img src="<%= request.getContextPath()%>/images/act3.png " /></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									小优布丁
								</div>
								
								<div class="sub-title ">
									尝鲜价：¥4.8
								</div>
							</div>
							<a href="# "><img src="<%= request.getContextPath()%>/images/act3.png " /></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three last ">
							<div class="outer-con ">
								<div class="title ">
									小优布丁
								</div>
								
								<div class="sub-title ">
									尝鲜价：¥4.8
								</div>
							</div>
							<a href="# "><img src="<%= request.getContextPath()%>/images/act3.png " /></a>
						</div>
					</div>

					</div>
                 <div class="clear "></div>
					


                 
					

					<div class="footer ">
						<div class="footer-hd ">
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