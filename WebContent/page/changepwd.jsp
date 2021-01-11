<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>找回密码》修改密码</title>
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
	
	
		<div style="height:600px;width:600px;margin-left:450px;margin-top:170px;">
		<form  class="form-horizontal" action="${pageContext.servletContext.contextPath}/changepwd.do" method="get">
		   <div class="form-group" >
		    <label for="exampleInputAccount4" class="col-sm-2">手机号码</label>
		    <div class="col-md-6 col-sm-10">
		      <input type="text" id="pnumber" class="form-control" name="uphone1" value="${uphone}">
		    </div>
		  </div>
		  <div class="form-group" >
		    <label for="exampleInputAccount4" class="col-sm-2">新密码</label>
		    <div class="col-md-6 col-sm-10">
		      <input type="text"  class="form-control" name="newpwd" placeholder="请输入新密码">
		    </div>
		  </div>
		  <br>
		  <div class="form-group" style="float:left;padding-left:95px;margin-top:-15px;">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn " onclick="changesrc()">确认修改</button>
		    </div>
		  </div>
		  <div class="form-group" style="float:left;padding-left:110px;margin-top:-15px;">
		    <div class="col-sm-offset-2 col-sm-10">
		      <a href="${pageContext.servletContext.contextPath}/html/register.jsp"><button type="button" class="btn " >注册新号</button></a>
		    </div>
		    </div>
		</form>
		</div>
		 </div>
		 </div>
		
		
		<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>	
		</script>
	</body>
</html>