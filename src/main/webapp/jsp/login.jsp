<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>璐小鹿欢迎您登陆~</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="<%= request.getContextPath()%>/css/dlstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="login-boxtitle">
		<a href="home.html"><img alt="logo" src="<%= request.getContextPath()%>/images/logobig.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg"><span></span><img src="<%= request.getContextPath()%>/images/big.jpg" /></div>
			<div class="login-box">
				<h3 class="title">登录商城</h3>
				<div class="clear"></div>
				<form method="post"  action="<%= request.getContextPath()%>/UserController/login.do" >
					<div class="login-form" style="background-color: #f8f8f8">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label>
							<input type="text" name="username" id="user" placeholder="邮箱/手机/用户名">
                		</div>
                		<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label>
							<input type="password" name="password" id="password" placeholder="请输入密码">
                		</div>
          			</div>
           
	         		<div class="login-links">
						<a  class="am-fr">忘记密码</a>
						<a href="<%= request.getContextPath()%>/jsp/register.jsp" class="zcnext am-fr am-btn-default">注册</a>
						<br />
	         		</div>
					<div class="am-cf">
						<input type="submit" name="submit" value="登 录" class="am-btn am-btn-primary am-btn-sm">
					</div>
				 </form>
				<div class="partner">		
					<h3>合作账号</h3>
					<div class="am-btn-group"><ul>
						<li><a><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
						<li><a><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
						<li><a><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
						</ul>
					</div>
				</div>	
			</div>
		</div>
	</div>
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
</body>
</html>