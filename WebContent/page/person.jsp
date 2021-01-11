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
				        <li class="active"><a href=""><i class="icon icon-home"></i>&nbsp;&nbsp;首页</a></li>
				        <li><a href=""><i class="icon icon-film"></i>&nbsp;&nbsp;视频</a></li>
				        <li><a href=""><i class="icon icon-hand-up"></i>&nbsp;&nbsp;发现</a></li>
						<li><a href=""><i class="icon icon-gamepad"></i>&nbsp;&nbsp;游戏</a></li>
						<li><a href=""><i class="icon icon-tablet"></i>&nbsp;${user.phone}</a></li>
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
		</div>
		<div class="b" style="min-height: 600px;">
		    <div class="b-l">
				<div class="list-group">
				  <a href="${pageContext.servletContext.contextPath}/personinfo.do" class="list-group-item">返回</a>
				</div>
			</div>
			<div class="b-m">
				<div class="pic">
									<label class="col-sm-2">图像：</label>
									<div id='uploaderExample' class="uploader" data-ride="uploader" data-url="your/file/upload/url">
									  <div class="uploader-message text-center">
									    <div class="content"></div>
									    <button type="button" class="close">×</button>
									  </div>
									  <div class="uploader-files file-list file-list-grid"></div>
									  <div>
									    <hr class="divider">
									    <div class="uploader-status pull-right text-muted"></div>
									    <button type="button" class="btn btn-link uploader-btn-browse"><i class="icon icon-plus"></i> 选择文件</button>
									    <button type="button" class="btn btn-link uploader-btn-start"><i class="icon icon-cloud-upload"></i> 开始上传</button>
									  </div>
									</div>
								</div>
								<form class="form-horizontal" action="${pageContext.servletContext.contextPath}/complete.do">
				  <div class="form-group">
				    <label for="exampleInputAccount4" class="col-sm-2">真实姓名：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputAccount4" placeholder="" name="truename" value="${userinfo.truename}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword4" class="col-sm-2">地址：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputPassword4" placeholder="" name="address" value="${userinfo.address}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputAccount4" class="col-sm-2">性别：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputAccount4" placeholder="" name="sex" value="${userinfo.sex}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputAccount4" class="col-sm-2">生日：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputAccount4" placeholder="" name="birthday" value="${userinfo.birthday}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputAccount4" class="col-sm-2">血型：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputAccount4" placeholder="" name="bloodtype" value="${userinfo.bloodtype}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputAccount4" class="col-sm-2">个人简介：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputAccount4" placeholder="" name="intro" value="${userinfo.intro}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputAccount4" class="col-sm-2">邮箱：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputAccount4" placeholder="" name="email" value="${userinfo.email}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputAccount4" class="col-sm-2">学号：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputAccount4" placeholder="" name="student_id" value="${userinfo.student_id}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputAccount4" class="col-sm-2">学校：</label>
				    <div class="col-md-6 col-sm-10">
				      <input type="text" class="form-control" id="exampleInputAccount4" placeholder="" name="school" value="${userinfo.school}">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox"> 记住我
				        </label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">保存</button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="b-r">
				<div class="b3-t">
					<a href="person.do"><div class="userpic"><img src="${userpic.url}" alt=""></div>
					<div class="name">${user.nikename}</div></a>
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
										${mc}
									</span>
								</a>
							</li>
						</ul>
					</div>
			    </div>
		    </div>
	    </div>
	</body>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.js"></script>
	<script type="text/javascript">
			$('#uploaderExample').uploader({
			    autoUpload: false,            // 当选择文件后立即自动进行上传操作
			    url: '${pageContext.servletContext.contextPath}/upload.do'  // 文件上传提交地址
			}); 
		</script>
</html>

