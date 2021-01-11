<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>个人主页</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/mzui-1.0.1-dist/dist/css/mzui.min.css"/>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/welcome.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/bootbox/bootbox.min.css"/>
		
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
						<li><a href="${pageContext.servletContext.contextPath}/personinfo.do"><i class="icon icon-tablet"></i>&nbsp;${user.phone}</a></li>
				        <li class="dropdown">
				          <a href="" class="dropdown-toggle" data-toggle="dropdown"><i class="icon  icon-cog"></i>&nbsp;<b class="caret"></b></a>
				          <ul class="dropdown-menu" role="menu">
				            <li><a href="#"></a></li>
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
				  <a href="${pageContext.servletContext.contextPath}/massage.do" class="list-group-item"><i class="icon icon-home"></i>&nbsp;&nbsp;返回</a>
				  <a href="#" class="list-group-item"><i class="icon icon-heart"></i>&nbsp;&nbsp;他的收藏</a>
				  <a href="#" class="list-group-item"><i class="icon icon-thumbs-o-up"></i>&nbsp;&nbsp;他的赞</a>
				  <a href="#" class="list-group-item">特别关注</a>
				</div>
			</div>
			<div class="b-m" style="overflow: hidden;">
			   <table class="datatable">
	            <tbody>
	            <c:forEach items="${othermassage}" var="u" varStatus="loop">
	    	    <tr>
				<div class="--in">
						<div style="float:right">
							<div class="dropdown">
					           <button class="btn" type="button" data-toggle="dropdown" style="background-color: white;border: none;"> <span class="caret"></span></button>
					            <ul class="dropdown-menu">
					            <c:if test="${u.user_id==user.id}">
					            <li><a href="###" onclick="shanchu(u.id)">删除</a></li>
					            </c:if>
					            <c:if test="${u.user_id!=user.id}">
					            <li><a href="###">帮他上头条</a></li>
					            <li><a href="###">关注该用户</a></li>
					            <li><a href="###">屏蔽该条消息</a></li>
					            <li><a href="###">屏蔽该用户</a></li>
					            <li><a href="###">投诉</a></li>
					            </c:if>
					            </ul>
					        </div>
						</div>
						<div class="b-m-2">
							<a href="#"><img src="${otherpic.url}" alt="" style="width:50px;"></a>
						</div>
						<div class="b-m-3">
							<div class="b-m-3-1">${other.nikename}</div>
							<div class="b-m-3-2">${u.time }</div>
							<div class="b-m-3-3">${u.info}</div>
						    <div class="b-m-3-4">
								<ul>
								<li style="width:50%; min-height:20px;"><a href="" data-toggle="lightbox" data-group="image-group-1"><img src="${othermassagepic1[loop.count-1].url}" alt=""></a></li>
								</ul>
								<div style="clear: both;"></div>
								
							</div>
						</div>
						<div style=""><a href="#" onclick="xiangqing('${u.id}')"><i class="icon icon-paper-clip"></i>&nbsp;&nbsp;详情</a></div>
						<ul class="b-m-4">
							<li><a href="javascript:void(0)" onclick="colle(${u.id},${u.collectnum})"><span><i class="icon icon-heart" id="zan${u.collectnum}"></i> 收藏&nbsp;${u.collectnum }</span></a></li>
							<li><a href="javascript:void(0)" onclick=""><span><i class="icon icon-th"></i> 转发&nbsp;${u.transpondnum }</span></a></li>
							<li><a href="javascript:void(0)" onclick="pinlun('${u.id}','${user.id}')"><span><i class="icon icon-file-text-o"></i> 评论&nbsp;${u.commentnum }</span></a></li>
							<c:if test="${u.id==umzan.mid}">
							<li><a href="#" id="zhan_yes${u.id}" onclick="quxiao('${u.id}','${user.id}')"><span><i class="icon icon-thumbs-o-down"></i> 取消&nbsp;${u.agreenum }</span></a></li>
							</c:if>
							<c:if test="${u.id!=umzan.mid}">
							<li><a href="#" id="zhan_no${u.id}" onclick="dianzan('${u.id}','${user.id}')"><span><i class="icon icon-thumbs-o-up"></i> 点赞&nbsp;${u.agreenum }</span></a></li>
							</c:if>
							<div style="clear: both;"></div>
						</ul>
						<c:forEach items="${massagecomment}" var="mc" varStatus="value">
						    <div class="comment">
                              <a href="###" class="avatar">
                              <i class="icon-user icon-2x"></i>
                              </a>
                              <div class="content">
                                <div class="pull-right text-muted">${mc.time} 个小时前</div>
                                <div><a href="###"><strong>${mcuser.nikename}</strong></a> <span class="text-muted">评论</span></div>
                                <div class="text">${mc.info}</div>
                                <div class="actions">
                                  <a href="#">删除</a>
                               </div>
                              </div>
                            </div>
						</c:forEach>
				</div>
				</tr>
				</c:forEach>
	            </tbody>
	            </table>
			</div>
			<div class="b-r">
				<div class="b3-t">
					<a href="#">
					<div class="userpic"><img src="${otherpic.url}" alt=""></div>
					<div class="name">${other.nikename}</div>
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
										${mo}
									</span>
								</a>
							</li>
						</ul>
					</div>
			    </div>
			    <div style="clear:both;"></div>
			    <div id="user">
					<div class="piclist"></div>
					<ul id="uinfo">
						<li>真实姓名 ：<small>${otherinfo.truename}</small></li>
						<li>所在地 ：<small>${otherinfo.address}</small></li>
						<li>性别 ：<small>${otherinfo.sex}</small></li>
						<li>生日 ：<small>${otherinfo.birthday}</small></li>
						<li>血型 ：<small>${otherinfo.bloodtype}</small></li>
						<li>个人简介 ：<small>${otherinfo.intro}</small></li>
						<li>邮箱 ：<small>${otherinfo.email}</small></li>
						<li>学号 ：<small>${otherinfo.student_id}</small></li>
						<li>学校 ：<small>${otherinfo.school}</small></li>
					</ul>
				</div>
	    </div>
	  </div>
	</body>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/bootbox/bootbox.min.js" type="text/javascript" charset="utf-8"></script>
	<script>
            function quxiao(mid,uid){
            	var url = '/other.do'; 
            	location.href = "${pageContext.servletContext.contextPath}/agreenum.do?mid="+mid+"&uid="+uid+"&url="+url;
            }
            function dianzan(mid,uid){
            	var url = '/other.do';  
            	location.href = "${pageContext.servletContext.contextPath}/agreenum.do?mid="+mid+"&uid="+uid+"&url="+url;
            }
            function shanchu(mid){
            	location.href = "${pageContext.servletContext.contextPath}/delete.do?mid="+mid;
            }
            function _other(ouid,muid){
            	location.href = "${pageContext.servletContext.contextPath}/other.do?ouid="+ouid+"&muid="+muid;
            }
            function xiangqing(minfoid){
            	location.href = "${pageContext.servletContext.contextPath}/massageinfo.do?minfoid="+minfoid;
            }
            function pinlun(mid,uid){
            	bootbox.prompt({
            	    title: "评论",
            	    inputType: 'textarea',
            	    callback: function (result) {
            	      if(result!=null){
            	    	 var param = '{"mid":"'+mid+'","uid":"'+uid+'","pinlun":"'+result+'"}';
            	    	 $.ajax({
            					url:"pinlun",
            					type:"post",
            					dataType:"json",
            					async:true,
            					data:param,
            					success:function(data){
            						 if(data=="1"){
            							 location.href = "${pageContext.servletContext.contextPath}/commentnum.do?add="+'true'+'&mid='+mid+"&shan="+'false';
            					     }
            					}
            	      	});
            	      }else{
            	    	  return;
            	      }
            	    }
            	});
            }
        </script>
</html>