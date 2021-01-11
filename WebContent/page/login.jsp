<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录页面</title>
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
	
	
		<div style="height:600px;width:600px;margin-left:450px;margin-top:160px;">
		<form  class="form-horizontal" action="${pageContext.servletContext.contextPath}/pwdlogin.do" method="get">
		   <div class="form-group" >
		    <label for="exampleInputAccount4" class="col-sm-2">手机号码</label>
		    <div class="col-md-6 col-sm-10">
		      <input type="text" class="form-control" name="phone" placeholder="手机号码" value="${phone}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword4" class="col-sm-2">密码</label>
		    <span id="accountTip" style="color:red;font-size: 12px;">${pserror}</span>
		    <div class="col-md-6 col-sm-10">
		      <input type="password" class="form-control" name="password" placeholder="密码" value="${phone}">
		    </div>
		  </div>		 
		  
		  <div class="form-group" style="float:left;padding-left:95px;">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn " onclick="save()">登录</button>
		    </div>
		  </div>
		  <div class="form-group" style="float:left;padding-left:20px;">
		    <div class="col-sm-offset-2 col-sm-10">
		      <a href="${pageContext.servletContext.contextPath}/page/findpwd.jsp"><button type="button" class="btn " onclick="save()">忘记密码</button></a>
		    </div>
		  </div>
		  <div class="form-group" style="float:left;padding-left:40px;">
		    <div class="col-sm-offset-2 col-sm-10">
		      <a href="${pageContext.servletContext.contextPath}/page/register.jsp"><button type="button" class="btn " >注册新号</button></a>
		    </div>
		    </div>
		</form>
		</div>
		 </div>
		 </div>
		<script type="text/javascript">
		//改变验证码
		function save(){
			
		}
		//function changeCode(o){
			//实际只要修改img的src的值
			//o.src = "${pageContext.servletContext.contextPath}/code.do?"+new Date().getTime();
		//}
		function changeSrc(){
			request.getRequestDispatcher("page/register.jsp").forward(request, response);
		}
	   </script>
		
		<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>	
		
	</body>
</html>