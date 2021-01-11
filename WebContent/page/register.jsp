<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>注册页面</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/welcome.css"/>
	</head>
	<body>
	<div id="a1" style="z-index: 1000;width: 100%;height: 41px;position: fixed;top: 0;border-bottom: 1px solid #FFF2C7;">
	<div style="background-image:url(${pageContext.servletContext.contextPath}/img/bg.jpg) ;height:800px;">
	<div id="a2" style="width: 80%;height: 41px;margin: 0 auto;">
		<nav class="navbar" role="navigation">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-example">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="your/nice/url">MCROBLOG</a>
            </div>
            <div class="collapse navbar-collapse navbar-collapse-example">
              <ul class="nav navbar-nav">
                <li class="active"><a href=""><i class="icon icon-home"></i>&nbsp;&nbsp;首页</a></li>
                <li><a href=""><i class="icon icon-film"></i>&nbsp;&nbsp;视频</a></li>
                <li><a href=""><i class="icon icon-hand-up"></i>&nbsp;&nbsp;发现</a></li>
				<li><a href=""><i class="icon icon-gamepad"></i>&nbsp;&nbsp;游戏</a></li>
				<li><a href="">${nikename}</a></li>
                <li class="dropdown">
                  <a href="" class="dropdown-toggle" data-toggle="dropdown"><i class="icon  icon-cog"></i>&nbsp;<b class="caret"></b></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="">任务</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
	</div>
		<div style="width:700px;height:700px; margin-left:430px;margin-top:100px">
		<form id="saveForm" class="form-horizontal" action="${pageContext.servletContext.contextPath}/register.do" method="get">
		  <div class="form-group">
		    <label for="exampleInputAccount4" class="col-sm-2">昵称</label>
		    <span id="accountTip" style="color:red;font-size: 12px"></span>
		    <div class="col-md-6 col-sm-10">
		      <input type="text" class="form-control" id="account" name="nikename" placeholder="昵称" value="${nikename}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword4" class="col-sm-2">密码</label>
		    <div class="col-md-6 col-sm-10">
		      <input type="password" class="form-control" id="password" name="password" placeholder="密码" value="${password}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword4" class="col-sm-2">重复密码</label>
		    <span id="rpasswordTip" style="color:red;font-size: 12px"></span>
		    <div class="col-md-6 col-sm-10">
		      <input type="password" class="form-control" id="rpassword" name="repwd" placeholder="重复密码" value="${password}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputAccount4" class="col-sm-2">电子邮箱</label>
		    <div class="col-md-6 col-sm-10">
		      <input type="text" class="form-control" name="email" placeholder="电子邮箱" value="${email}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputAccount4" class="col-sm-2">手机号码</label>
		    <div class="col-md-6 col-sm-10">
		      <input type="text" class="form-control" name="phone" placeholder="手机号码" value="${phone}">
		    </div>
		  </div>
		   
		  
		  <div class="form-group" style="float:left;padding-left:108px;">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="button" class="btn " onclick="save()">注册</button>
		    </div>
		  </div>
		  <div class="form-group" style="float:left;padding-left:150px;">
		    <div class="col-sm-offset-2 col-sm-10">
		      <a href="${pageContext.servletContext.contextPath}/page/login.jsp"><button type="button" class="btn " >前往登录</button></a>
		    </div>
		  </div>
		</form>
		</div>
		</div>
	
		<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>	
		<script type="text/javascript">
		//function changeCode(o){
			//实际只要修改img的src的值（改变验证图片）
			//o.src = "${pageContext.servletContext.contextPath}/code.do?"+new Date().getTime();
		//}
			//前端校验【数据是否填写，填写后数据是否符合格式】DOM
		
			function save(){
				//js获取html标签对象
				//document.querySelectorAll(".account");
				var success = true;
				//var code = document.querySelector("#code");
				var codeTip = document.querySelector("#codeTip");
				var account = document.querySelector("#account");
				var password = document.querySelector("#password");
				var rpassword = document.querySelector("#rpassword");
				var accountTip = document.querySelector("#accountTip");
				var rpasswordTip = document.querySelector("#rpasswordTip");
				if(account.value == ""){
					accountTip.innerText = "账号不能为空";
					success = false;
				}else{
					accountTip.innerText = "";
				}
				if(password.value!=rpassword.value){
					rpasswordTip.innerText = "重复密码错误！";
					success = false;
				}else{
					rpasswordTip.innerText = "";
				}

				if(success){
					document.querySelector("#saveForm").submit();
				}
			}
		</script>
	</body>
</html>