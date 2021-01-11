<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>找回密码</title>
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
		<form  class="form-horizontal" action="${pageContext.servletContext.contextPath}/sendpcode.do" method="get">
		   <div class="form-group" >
		    <label for="exampleInputAccount4" class="col-sm-2">手机号码</label>
		    <div class="col-md-6 col-sm-10">
		      <input type="text" id="pnumber" class="form-control" name="uphone" placeholder="请输入绑定手机号" value="${uphone}">
		    </div>
		  </div>
		  
		  <div class="form-group" 	>
		    <label for="exampleInputAccount4" class="col-sm-2">验证码</label>
		    <span id="smcodeTip" style="color:red;font-size: 12px;padding-top:8px;" >${error}</span>
		    <div class="col-md-6 col-sm-10" style="line-height:32px;">
		      <input type="text" class="form-control" id="pcode" name="phonecode" placeholder="请输入手机验证码">
		     <button  type="submit" class="btn " onclick="up() ">免费发送验证码</button><span style="line-height:79px;">没收到？单击再次发送</span>
		     
		    </div>
		  </div>
		  
		  <div class="form-group" style="float:left;padding-left:95px;margin-top:-15px;">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn " >修改密码</button>
		    </div>
		  </div>
		  <div class="form-group" style="float:left;padding-left:110px;margin-top:-15px;">
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
		
	
	   </script>
		
		<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>	
		<script src="${pageContext.servletContext.contextPath}/jquery/jQuery.js" type="text/javascript" charset="utf-8"></script>
		
	</body>
</html>