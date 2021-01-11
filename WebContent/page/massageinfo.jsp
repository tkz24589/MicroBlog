<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>{other.nikename}主页</title>
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
			<div class="b-m">
			   <table class="datatable">
	            <tbody>
	    	    <tr>
				<div class="--in">
						<div style="float:right">
							<div class="dropdown">
					           <button class="btn" type="button" data-toggle="dropdown" style="background-color: white;border: none;"> <span class="caret"></span></button>
					            <ul class="dropdown-menu">
					            <c:if test="${um.user_id==user.id}">
					            <li><a href="###" onclick="shanchu(um.id)">删除</a></li>
					            </c:if>
					            <c:if test="${um.user_id!=user.id}">
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
							<div class="b-m-3-1">${msuser.nikename}</div>
							<div class="b-m-3-2">${um.time }</div>
							<div class="b-m-3-3">${um.info}</div>
						    <div class="b-m-3-4">
								<ul>
								<li style="width:80%; min-height:20px;"><a href="" data-toggle="lightbox" data-group="image-group-1"><img src="${ompic1.url}" alt=""></a></li>
								</ul>
								<div style="clear: both;"></div>
								
							</div>
						</div>
						<ul class="b-m-4">
							<li><a href="javascript:void(0)" onclick="colle(${um.id},${um.collectnum})"><span><i class="icon icon-heart" id="zan${um.collectnum}"></i> 收藏&nbsp;${u.collectnum }</span></a></li>
							<li><a href="javascript:void(0)" onclick=""><span><i class="icon icon-th"></i> 转发&nbsp;${um.transpondnum }</span></a></li>
							<li><a href="javascript:void(0)" onclick="pinlun('${um.id}','${user.id}')"><span><i class="icon icon-file-text-o"></i> 评论&nbsp;${um.commentnum }</span></a></li>
							<c:if test="${um.id==umzan.mid}">
							<li><a href="#" id="zhan_yes${um.id}" onclick="quxiao('${um.id}','${user.id}')"><span><i class="icon icon-thumbs-o-down"></i> 取消&nbsp;${um.agreenum }</span></a></li>
							</c:if>
							<c:if test="${um.id!=umzan.mid}">
							<li><a href="#" id="zhan_no${um.id}" onclick="dianzan('${um.id}','${user.id}')"><span><i class="icon icon-thumbs-o-up"></i> 点赞&nbsp;${um.agreenum }</span></a></li>
							</c:if>
							<div style="clear: both;"></div>
						</ul>
						<c:forEach items="${mclist}" var="mc" varStatus="value">
						    <div class="comment">
                              <a href="###" class="avatar">
                              <i class="icon-user icon-2x"></i>
                              </a>
                              <div class="content">
                                <div class="pull-right text-muted">${mc.time}</div>
                                <div><a href="###"><strong>${colist[value.count-1].nikename}</strong></a> <span class="text-muted">评论</span></div>
                                <div class="text">${mc.info}</div>
                                <div class="actions">
                                  <a href="#" onclick="shanchucome('${mc.id}','${um.id}')">删除</a>
                               </div>
                              </div>
                            </div>
						</c:forEach>
				</div>
				</tr>
	            </tbody>
	            </table>
			</div>
	  </div>
	</body>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/bootbox/bootbox.min.js" type="text/javascript" charset="utf-8"></script>
	<script>
            function quxiao(mid,uid){
            	var url = '/massageinfo.do?minfoid='+mid;  
            	location.href = "${pageContext.servletContext.contextPath}/agreenum.do?mid="+mid+"&uid="+uid+"&url="+url;
            }
            function dianzan(mid,uid){
            	var url = '/massageinfo.do?minfoid='+mid;  
            	location.href = "${pageContext.servletContext.contextPath}/agreenum.do?mid="+mid+"&uid="+uid+"&url="+url;
            }
            function shanchu(mid){
            	location.href = "${pageContext.servletContext.contextPath}/delete.do?mid="+mid;
            }
            function _other(ouid,muid){
            	location.href = "${pageContext.servletContext.contextPath}/other.do?ouid="+ouid+"&muid="+muid;
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
            						 if(data=="0"){
            							 location.href = "${pageContext.servletContext.contextPath}/commentnum.do?add="+'true'+'&mid='+mid+"&shan="+'true';
            					     }
            					}
            	      	});
            	      }else{
            	    	  return;
            	      }
            	    }
            	});
            }
            function shanchucome(cid,mid){
            	bootbox.confirm({
            	    message: "确定要删除评论?",
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
            	        	var param = '{"cid":"'+cid+'","mid":"'+mid+'"}';
            	        	$.ajax({
            					url:"shanchupinlun",
            					type:"post",
            					dataType:"json",
            					async:true,
            					data:param,
            					success:function(data){
            						 if(data=="1"){
            							 location.href = "${pageContext.servletContext.contextPath}/massageinfo.do?minfoid="+mid;
            					     }
            					}
            	      	});
            	        }
            	    }
            	});
            }
        </script>
</html>