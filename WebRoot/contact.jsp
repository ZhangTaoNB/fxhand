<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>关于我们</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/reg.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<!-- 引入封装了failback的接口--initGeetest -->
<script src="http://static.geetest.com/static/tools/gt.js"></script>

<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js">
	
</script>
<!-- cart -->
</head>
<body>
	<!--header-->
		<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1 class="navbar-brand">
					<a href="jump.jsp">fxhand</a>
				</h1>
			</div>
			<!--navbar-header-->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="jump.jsp" >首页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">二手分类<b class="caret"></b></a>
						<ul class="dropdown-menu multi-column columns-4">
							<div class="row">
								<c:forEach var="cg" items="${c }">
								<div class="col-sm-2">
									<h4>${cg.cgname }</h4>
									<ul class="multi-column-dropdown">
										<c:forEach var="cd" items="${cg.cyclassds }">
											<li><a cslass="list" href="cygood!querylist.action?cygoods.cyclassd.cdid=${cd.cdid }">${cd.cdname }</a></li>
										</c:forEach>
									</ul>
								</div>
								</c:forEach>
							</div>
						</ul></li>
					<li><a href="add.jsp" onclick="return fun1()">我要发布</a></li>
					<li><a href="contact.jsp" class="active">关于我们</a></li>
				</ul>
				<!--/.navbar-collapse-->
			</div>
			<!--//navbar-header--> </nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search"></span></a>
					<div class="search">
						<form class="navbar-form" action="cygood!search.action">
							<input type="text" class="form-control" name="content" id="asd"/>
							<button type="submit" class="btn btn-default"
								aria-label="Left Align">搜索</button>
						</form>
					</div>
				</div>
				<c:choose>
					<c:when test="${u.cyuname !=null }">
						<div class="header-right login">
							<a href="#"><span class="glyphicon glyphicon-user"
								aria-hidden="true"></span></a>
							<div id="loginBox">
								<form id="loginForm">
									<h4 style="margin-top: 20px">欢迎您，${u.cyuname}</h4>
									<fieldset id="body">
										<a type="button" id="login" style=" margin: 5px 15px" href="cygood!ugoodlist.action?cygoods.cyusers.cyuid=${u.cyuid }">个人中心</a>
										<a type="button" id="login" style=" margin: 10px 15px" href="cygood!ugoodlist.action?cygoods.cyusers.cyuid=${u.cyuid }#tab-2">我的发布</a>
										<a type="button" id="login" style=" margin: 10px 15px"
											href="cygood!collectlist.action?cycarts.cyusers.cyuid=${u.cyuid}">我的收藏</a>
									</fieldset>
								</form>
							</div>
						</div>
						<div class="header-right cart">
							<a href="logout.jsp" onclick="javascript: return confirm('确定要退出吗？')"><span class="glyphicon glyphicon glyphicon-log-out"
								aria-hidden="true"></span></a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="header-right login">
							<a data-toggle="modal" data-target="#login_view"
								onclick="log_init()"><span class="glyphicon"></span>登录</a>
						</div>
						<div class="header-right login">
							<a data-toggle="modal" data-target="#reg_view"
								onclick="reg_init()"><span class="glyphicon"></span>注册</a>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="modal fade" id="login_view" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h3 class="modal-title" id="myModalLabel"
									style="text-align: center;">用户登录</h3>
							</div>
							<div class="passport-sign">
								<div class="main-form">
									<form class="passport-form passport-form-sign" id="login-form"
										action="cyuser!login.action" method="post">
										<div class="form-item">
											<div class="form-cont">
												<input type="text" name="cyuser.cyuphone" id="phone_login"
													class="passport-txt xl w-full" tabindex="1"
													autocomplete="off" placeholder="请输入手机号">
												<div class="passport-note passport-error-text"
													id="phone_login1"></div>
											</div>
										</div>
										<div class="form-item">
											<div class="form-cont">
												<input type="password" name="cyuser.cyupwd" id="pwd_login"
													class="passport-txt xl w-full" tabindex="2"
													autocomplete="off" placeholder="输入6~32位密码">
												<div class="passport-note passport-error-text"
													id="pwd_login1"></div>
											</div>
										</div>
										<div class="form-item">
											<div class="form-cont">
												<div class="popup">
													<div id="embed-captcha"></div>
													<p id="wait" class="show">正在加载验证码......</p>
													<div class="passport-note passport-error-text" id="gtcode"
														style="margin-right: 70px;"></div>
												</div>
											</div>
										</div>
										<div class="form-item">
											<div class="form-cont">
												<button type="button" name="register" id="embed-submit1"
													class="passport-btn passport-btn-def xl w-full"
													tabindex="5" jktag="0001|0.1|91026">登录</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>
				<div class="modal fade" id="reg_view" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h3 class="modal-title" id="myModalLabel"
									style="text-align: center;">新用户注册</h3>
							</div>
							<div class="passport-sign">
								<div class="main-form">
									<!-- form -->
									<form class="passport-form passport-form-sign"
										id="register-form" action="cyuser!register.action"
										method="post">
										<div class="form-item">
											<div class="form-cont">
												<input type="text" name="cyuser.cyuname" id="username"
													class="passport-txt xl w-full" tabindex="1"
													autocomplete="off" placeholder="请输入6~25位用户名">
												<div class="passport-note passport-error-text" id="u1"></div>
											</div>
										</div>
										<div class="form-item">
											<div class="form-cont">
												<input type="text" name="phone" id="phone"
													class="passport-txt xl w-full" tabindex="1"
													autocomplete="off" placeholder="请输入手机号">
												<div class="passport-note passport-error-text" id="p1"></div>
											</div>
										</div>
										<div class="form-item">
											<div class="form-cont">
												<input type="password" name="cyuser.cyupwd" id="pwd"
													class="passport-txt xl w-full" tabindex="2"
													autocomplete="off" placeholder="输入6~32位密码">
												<div class="passport-note passport-error-text" id="p2"></div>
												<ul class="passport-safely" id="safely">
													<li class="danger" id="pp1">弱</li>
													<li class="general" id="pp2">中</li>
													<li class="safe" id="pp3">高</li>
												</ul>
											</div>
										</div>
										<div class="form-item form-mcode mb-25">
											<div class="form-cont">
												<input type="text" name="verify_code" id="code"
													class="passport-txt xl w-full" tabindex="4"
													autocomplete="off" placeholder="动态码">
												<div class="passport-note passport-error-text" id="c1"></div>
												<div class="btn-getcode">
													<input type="button" class="passport-btn js-getcode"
														value="获取动态码" onclick="settime(this)" />
												</div>
											</div>
										</div>
										<div class="form-item">
											<div class="form-cont">
												<button type="button" name="register" id="register"
													class="passport-btn passport-btn-def xl w-full"
													tabindex="5" jktag="0001|0.1|91026" onclick="sub()">注册</button>
											</div>
										</div>
									</form>
									<!-- form end -->
								</div>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>
				<!--  -->
			</div>
		</div>
	</div>
	<!--//header-->
	<!--contact-->
	<div class="contact" style="background-image: url(./images/banner-1.png);">
		<div class="container">
			<h2>关于我们</h2>
			<div class="contact-infom">
				<h4>简介 :</h4>
				<p style="padding-left: 60px;">哈喽~ 你好~<br>
				     唔，终于来客人了。<br>
				     你想买什么？嗯。。。你想卖什么？<br>
				     上古时代的宝贝，现在开卖了。<br>
				     嗯，都是极品！<br>
				     血钱已付，血钱已付！<br>
				     欢迎光临！<br>
				     为了黑幕，赢下这局！
				</p>
			</div>
			<div class="address">
				<div class="col-md-4 address-grids">
				<h4>地址 :</h4>
					<ul>
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
						<p>	福建省福清市<br>
							福建师范大学福清分校<br>
							则徐园
						</p>
					</ul>
				</div>
				<div class="col-md-4 address-grids">
					<h4>联系方式	 :</h4>
					<p><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>TEL：18450089620</p>
					<p><span class="glyphicon glyphicon-send" aria-hidden="true"></span>QQ：704739362</p>
				</div>
				<div class="col-md-4 address-grids">
					<h4>邮箱 :</h4>
					<p><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:congyang455@gmail.com">congyang455@gmail.com</a></p>
				</div>
				<div class="clearfix"> </div>
			</div>		
			<div class="contact-form">
				<script>
					function doreg() {
						var user = "${u.cyuname}";
						if (user == "") {
							alert("您还没登录，请先登录");
							return false;
						}
						var str = document.getElementById("strss").value;
						if (str == "") {
							alert("你还没填信息呢");
							return false;
						}
						$.ajax({
							url : "cymesg!save.action?cymsg.cyusers.cyuid=${u.cyuid}&cymsg.msgstr="+str,
							async : false,//改为同步方式
							type : "POST",
							data : "",
							dataType : "text",
						});
						alert("发送成功");
					}
				</script>
				<h4>留言：</h4>
				<form name="form2" action="cymesg!save.action" method="post">
					<textarea type="text"  id="strss"  name="cymsg.msgstr"  ></textarea>
					<button class="btn1" type="button" onclick="doreg()">发送</button>
				</form>
			</div>	
		</div>
	</div>
	<!--//contact-->
	<!--footer-->
	<!--footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>
				©2016-2017  fxhand  部分版权所有     谨慎盗用      晋ICP备16008887号-1
			</p>
		</div>
	</div>
	<script type="text/javascript">
		function fun1() {
			var user = "${u.cyuname}";
			if (user == "") {
				alert("您还没登录，请先登录");
				return false;
			}
			return true;
		}
	</script>
	<script type="text/javascript" src="js/checks.js"></script>
</body>
</html>