<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>个人信息</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/mzui-1.0.1-dist/dist/css/mzui.min.css"/>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/welcome.css"/>
		
	</head>
	<body>
		<div class="a" style="width: 100%;height: 41px;position: fixed;top: 0;border-bottom: 1px solid #FFF2C7; z-index: 1000;background: url(../img/body_bg.jpg);">
			<div class="a1" style="width: 80%;height: 41px;margin: 0 auto;z-index: 1000;">
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
				        <li><a href=""><i class="icon icon-film"></i>&nbsp;&nbsp;视频</a></li>
				        <li><a href=""><i class="icon icon-hand-up"></i>&nbsp;&nbsp;发现</a></li>
						<li><a href=""><i class="icon icon-gamepad"></i>&nbsp;&nbsp;游戏</a></li>
						<li><a href=""><i class="icon icon-tablet"></i>&nbsp;${user.phone}</a></li>
				        <li class="dropdown">
				          <a href="" class="dropdown-toggle" data-toggle="dropdown"><i class="icon  icon-cog"></i>&nbsp;<b class="caret"></b></a>
				          <ul class="dropdown-menu" role="menu">
				            <li></li>
				          </ul>
				        </li>
				      </ul>
				    </div>
				  </div>
				</nav>
			</div>
		</div>
		<div class="b" style="min-height: 600px;">
		    <div class="b-l">
				<div class="list-group">
				  <a href="${pageContext.servletContext.contextPath}/massage.do" class="list-group-item"><i class="icon icon-home"></i>&nbsp;&nbsp;首页</a>
				  <a href="#" class="list-group-item"><i class="icon icon-heart"></i>&nbsp;&nbsp;我的收藏</a>
				  <a href="#" class="list-group-item"><i class="icon icon-thumbs-o-up"></i>&nbsp;&nbsp;我的赞</a>
				  <hr>
				  <a href="#" class="list-group-item"><i class="icon icon-weibo"></i>&nbsp;&nbsp;热门微博</a>
				  <a href="#" class="list-group-item"><i class="icon icon-file-movie"></i>&nbsp;&nbsp;热门视频</a>
				  <hr>
				  <a href="#" class="list-group-item">最新微博</a>
				  <a href="#" class="list-group-item">好友圈</a>
				  <a href="#" class="list-group-item">特别关注</a>
				</div>
			</div>
			<div class="b-m">
			<div id="user">
					<div class="piclist"></div>
					<ul id="uinfo">
						<li>真实姓名 ：<small>${userinfo.truename}</small></li>
						<li>所在地 ：<small>${userinfo.address}</small></li>
						<li>性别 ：<small>${userinfo.sex}</small></li>
						<li>生日 ：<small>${userinfo.birthday}</small></li>
						<li>血型 ：<small>${userinfo.bloodtype}</small></li>
						<li>个人简介 ：<small>${userinfo.intro}</small></li>
						<li>邮箱 ：<small>${userinfo.email}</small></li>
						<li>学号 ：<small>${userinfo.student_id}</small></li>
						<li>学校 ：<small>${userinfo.school}</small></li>
						<li><a href="${pageContext.servletContext.contextPath}/person.do"><button class="btn btn-success " type="button" style="position:relative;left:45%;">修改信息</button></a></li>
					</ul>
				</div>
			</div>
			<div class="b-r">
				<div class="b3-t">
					<a href="person.do">
					<div class="userpic"><img src="${userpic.url}" alt=""></div>
					<div class="name">${user.nikename}</div>
					</a>
					<div class="info--">
						<ul class="uin">
							<li style="float: left;width: 33.3%;list-style: none;">
								<a href="" style="display: block;margin: 0 0 0 1px;padding: 1px 0;text-align: center;font-size: 10px; color: gray;">
									<span style="display: block;height: 22px;margin: 7px 0;line-height: 22px;border-color: #f2f2f5;">
										<i class="icon icon-heart"></i>&nbsp;关注
									</span>
								</a>
							</li>
							<li style="float: left;width: 33.3%;list-style: none;">
								<a href="" style="display: block;margin: 0 0 0 1px;padding: 1px 0;text-align: center;font-size: 10px; color: gray;">
									<span style="display: block;height: 22px;margin: 7px 0;border-left-width: 1px;border-left-style: solid;line-height: 22px;border-color: #f2f2f5;">
										<i class="icon icon-star"></i>&nbsp;粉丝
									</span>
								</a>
							</li>
							<li style="float: left;width: 33.3%;list-style: none;">
								<a href="" style="display: block;margin: 0 0 0 1px;padding: 1px 0;text-align: center;font-size: 10px; color: gray;">
									<span style="display: block;height: 22px;margin: 7px 0;border-left-width: 1px;border-left-style: solid;line-height: 22px;border-color: #f2f2f5;">
										<i class="icon icon-weibo"></i>&nbsp;微博
									</span>
								</a>
							</li>
						</ul>
						<ul class="uin">
							<li style="float: left;width: 33.3%;list-style: none;">
								<a href="" style="display: block;margin: 0 0 0 1px;padding: 1px 0;text-align: center;font-size: 10px; color: gray;">
									<span style="display: block;height: 22px;margin: 7px 0;line-height: 22px;border-color: #f2f2f5;">
										0
									</span>
								</a>
							</li>
							<li style="float: left;width: 33.3%;list-style: none;">
								<a href="" style="display: block;margin: 0 0 0 1px;padding: 1px 0;text-align: center;font-size: 10px; color: gray;">
									<span style="display: block;height: 22px;margin: 7px 0;border-left-width: 1px;border-left-style: solid;line-height: 22px;border-color: #f2f2f5;">
										0
									</span>
								</a>
							</li>
							<li style="float: left;width: 33.3%;list-style: none;">
								<a href="" style="display: block;margin: 0 0 0 1px;padding: 1px 0;text-align: center;font-size: 10px; color: gray;">
									<span style="display: block;height: 22px;margin: 7px 0;border-left-width: 1px;border-left-style: solid;line-height: 22px;border-color: #f2f2f5;">
										${m}
									</span>
								</a>
							</li>
						</ul>
					</div>
			    </div>
			    <div style="clear:both;"></div>
	    </div>
	  </div>
	</body>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.js"></script>
	<script type="text/javascript">
	        window.onunload = function (){
	        	
	        }
			$('#uploaderExample').uploader({
			    autoUpload: false,            // 当选择文件后立即自动进行上传操作
			    url: '${pageContext.servletContext.contextPath}/upload.do'  // 文件上传提交地址
			});
		</script>
</html>