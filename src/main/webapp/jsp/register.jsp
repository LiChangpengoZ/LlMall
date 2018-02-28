<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>璐小鹿欢迎您注册~</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="<%= request.getContextPath()%>/css/dlstyle.css" rel="stylesheet" type="text/css">
<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>
<body>

	<div class="login-boxtitle">
		<a href="home/demo.html"><img alt="" src="<%= request.getContextPath()%>/images/logobig.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg"><span></span><img src="../images/big.jpg" /></div>
			<div class="login-box">
				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">账号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">
							<form method="post"  action="<%= request.getContextPath()%>/UserController/reg.do" >		
							  <div class="user-email">
									<label for="email"><i class="am-icon-envelope-o"></i></label>
									<input type="email" name="username" id="email" placeholder="请输入邮箱账号">
             				  </div>										
              				 <div class="user-pass">
						  		  <label for="password"><i class="am-icon-lock"></i></label>
						  		  <input type="password" name="password" id="password" placeholder="设置密码">
               				</div>										
             				
               					
               				<div class="am-form-group" style="background-color: white;">
								<label class="am-radio-inline" style="margin-left: 5px">
									<input type="radio" value="0" name="isseller">
								</label>
								普通用户
								<label class="am-radio-inline">
									<input type="radio" value="1" name="isseller">
								</label>
								商家用户
							</div>
							<div class="clear"></div>
							<div class="am-form-group" style="background-color: white;">
<!-- 								<i style="margin-left: 8px" class="am-icon-legal" aria-hidden="true"> -->
									<input type="text" name="img" style="width: 50%;padding-left: 20px" class="" id="doc-ipt-email-1" placeholder="输入验证码">
									<img style="float: right;margin-right: 30px;margin-top: 10px" class="yzmimg" src="<%= request.getContextPath()%>/UserController/authCode.do" alt="验证码" onclick="this.src='<%= request.getContextPath()%>/UserController/authCode.do?'+Math.random();" />
<!-- 								</i> -->
							</div>
							<div class="am-cf" >
								<input type="submit" name="submit" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
							</div>
              			</form>
              				<div class="login-links">
								<label for="reader-me">
									<input id="reader-me" type="checkbox" checked="checked"> 点击表示您同意商城《服务协议》
								</label>
					  		</div>
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
	</div>			
	</body>
</html>