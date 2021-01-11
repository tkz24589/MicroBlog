<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>后台管理</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/datatable/zui.datatable.min.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/welcome.css"/>
	    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/person.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/bootbox/bootbox.min.css"/>
	</head>
	<body>
	<div id="a1" style="z-index: 1000;width: 100%;height: 41px;position: fixed;top: 0;border-bottom: 1px solid #FFF2C7;">
	<div style="background-image:url(${pageContext.servletContext.contextPath}/img/bg.jpg) ;">
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
				<li><a href="">欢迎管理员${user.nikename}</a></li>
                <li class="dropdown">
                  <a href="" class="dropdown-toggle" data-toggle="dropdown"><i class="icon  icon-cog"></i>&nbsp;<b class="caret"></b></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="${pageContext.servletContext.contextPath}/page/login.jsp">切换登录</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
	</div>	
	</div>
	</div>
	<div>
	<table class="table datatable" style="width:80%;margin:0 auto;margin-top:45px;">
	  <thead>
	    <tr>
	      <th>信息编号</th>
	      <th>信息归属者</th>
	      <th>信息内容</th>
	      <th>信息点赞数</th>
	      <th>信息收藏数</th>
	      <th>信息转发数</th> 
	      <th>信息评论数</th>
	      <th>更多</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach items="${allist}" var="u">
	    	<tr>
		      <td>${u.id}</td>
		      <td>${u.user_id}</td>
		      <td>${u.info}</td>
		      <td>${u.agreenum }</td>
		      <td>${u.collectnum }</td>
		      <td>${u.transpondnum }</td>
		      <td>${u.commentnum }</td>
		      <td>
		      	<a href="#" onclick="del('${u.id}')"><button class="btn btn-danger btn-sm" type="button">删除</button></a>
		      </td>
		    </tr>
	    </c:forEach>
	  </tbody>
	</table>
	</div>
  </body>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
    <script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/bootbox/bootbox.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

function del(id){
	bootbox.confirm({
	    message: "确定要删除数据?",
	    buttons: {
	        confirm: {
	            label: '确定',
	            className: 'btn-success'
	        },
	        cancel: {
	            label: '取消',
	            className: 'btn-danger'
	        }
	    },
	    callback: function (result) {
	        if(result){//确定删除数据
	        	location.href = "${pageContext.servletContext.contextPath}/delete.do?mid="+id+"&ismanager="+'true';
	        }
	    }
	});
}
</script>
</html>