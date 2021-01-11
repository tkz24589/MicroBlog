<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>个人主页</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/welcome.css"/>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/person.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/bootbox/bootbox.min.css"/>
	</head>

	<body>
	<div class="a" style="z-index: 1000;width: 100%;height: 41px;position: fixed;top: 0;border-bottom: 1px solid #FFF2C7;">
			<div class="a1" style="width: 80%;height: 41px;margin: 0 auto;">
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
				            <li><a href="${pageContext.servletContext.contextPath}/page/login.jsp" class="list-group-item">切换登录</a></li>
				          </ul>
				        </li>
				      </ul>
				    </div>
				  </div>
				</nav>
			</div>
		</div>
		<div class="b" style="min-height: 1200px;background:">
		    <div class="b-l">
				<div class="list-group">
				  <a href="${pageContext.servletContext.contextPath}/massage.do" class="list-group-item"><i class="icon icon-home"></i>&nbsp;&nbsp;首页</a>
				  <a href="#" class="list-group-item" onclick="wodeshoucang(${user.id})"><i class="icon icon-heart"></i>&nbsp;&nbsp;我的收藏</a>
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
			<div class="b-m" style="overflow: hidden;">
				<p class="W_swficon ficon_swtxt">
					<i class="icon icon-smile"></i>&nbsp;<em>有什么新鲜事告诉大家？</em>
				</p>
				<div id='uploaderExample' class="uploader" data-ride="uploader" data-url="your/file/upload/url">
                  <div class="uploader-message text-center">
                    <div class="content"></div>
                    <button type="button" class="close">×</button>
                  </div>
                  <div class="uploader-files file-list file-list-grid"></div>
                  <div>
                  <hr class="divider">
                  <div class="uploader-status pull-right text-muted"></div>
                  <button type="button" class="btn btn-link uploader-btn-browse"><i class="icon icon-picture"></i></button>
                  </div>
                </div>
                <form action="${pageContext.servletContext.contextPath}/sendmassage.do">
				 <div class="input-control has-icon-left has-icon-right">
                   <textarea class="form-control" rows="3" placeholder="来吧,分享吧!" name="massage"></textarea>
                </div>
				<div style="margin-top: 5px; position: relative;min-height: 32px;"><button class="btn btn-primary" type="submit" style=" position: absolute;right: 5px;cursor: pointer; border-radius: 5px; height: 30px;" >发表</button></div>
				</form>
				<table class="datatable">
	            <tbody>
	            <c:forEach items="${usermassage}" var="u" varStatus="loop">
	    	    <tr>
				<div class="--in">
						<div style="float:right">
							<div class="dropdown">
					           <button class="btn" type="button" data-toggle="dropdown" style="background-color: white;border: none;"> <span class="caret"></span></button>
					            <ul class="dropdown-menu">
					            <c:if test="${u.user_id==user.id}">
					            <li><a href="#" onclick="shanchu('${u.id}')">删除</a></li>
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
							<a href="#" onclick="_other('${u.user_id}','${user.id}')"><img src="${puser[loop.count-1].url}" alt="" style="width:50px;"></a>
						</div>
						<div class="b-m-3">
							<div class="b-m-3-1">${muser[loop.count-1].nikename}</div>
							<div class="b-m-3-2">${u.time }</div>
							<div class="b-m-3-3">${u.info}</div>
						    <div class="b-m-3-4">
								<ul>
							
								<li style="width:50%; min-height:20px;"><a href="" data-toggle="lightbox" data-group="image-group-1"><img src="${mpuser[loop.count-1].url}" alt="" ></a></li>
								
								</ul>
								<div style="clear: both;"></div>
								
							</div>
						</div>
						<div style=""><a href="#" onclick="xiangqing('${u.id}')"><i class="icon icon-paper-clip"></i>&nbsp;&nbsp;详情</a></div>
						<ul class="b-m-4">
							<li><a href="javascript:void(0)" onclick="colle('${u.id}','${user.id}')" id="shoucang${u.id}"><span><i class="icon icon-heart"></i>收藏&nbsp;${u.collectnum }</span></a></li>
							<li><a href="javascript:void(0)" onclick="zhuanfa('${u.id}','${user.id}')"><span><i class="icon icon-th"></i> 转发&nbsp;${u.transpondnum }</span></a></li>
							<li><a href="javascript:void(0)" onclick="pinlun('${u.id}','${user.id}')" id="zhuanfa${u.id}"><span><i class="icon icon-file-text-o"></i> 评论&nbsp;${u.commentnum }</span></a></li>
							<c:if test="${u.id==umzan.mid}">
							<li><a href="#" id="zhan_yes${u.id}" onclick="quxiao('${u.id}','${user.id}')"><span><i class="icon icon-thumbs-o-down"></i> 取消&nbsp;${u.agreenum }</span></a></li>
							</c:if>
							<c:if test="${u.id!=umzan.mid}">
							<li><a href="#" id="zhan_no${u.id}" onclick="dianzan('${u.id}','${user.id}')"><span><i class="icon icon-thumbs-o-up"></i> 点赞&nbsp;${u.agreenum }</span></a></li>
							</c:if>
							<div style="clear: both;"></div>
						</ul>
				</div>
				</tr>
				</c:forEach>
	            </tbody>
	            </table>
			</div>
			<div class="b-r">
				<div class="b3-t">
					<a href="${pageContext.servletContext.contextPath}/personinfo.do" style="display:block"><div style="width: 80px;height: 80px;border-radius: 40px;margin: 0 auto;overflow: hidden;background: #FFF0D5;"><img src="${userpic.url}" alt=""></div>
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
									<span style="display: block;height: 22px;margin: 7px 0;">
										0
									</span>
								</a>
							</li>
							<li style="float: left;width: 33.3%;list-style: none;">
								<a href="" style="display: block;margin: 0 0 0 1px;padding: 1px 0;text-align: center;font-size: 10px; color: gray;">
									<span style="display: block;height: 22px;margin: 7px 0;">
										${m}
									</span>
								</a>
							</li>
						</ul>
					</div>
			   </div>
		</div>
	</div>
	</body>
	<script type="text/javascript">
		
			</script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
    <script src="${pageContext.servletContext.contextPath}/wangEditor-3.1.1/wangEditor-3.1.1/release/wangEditor.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/uploader/zui.uploader.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/bootbox/bootbox.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
			$('#uploaderExample').uploader({
			    autoUpload: true,            // 当选择文件后立即自动进行上传操作
			    url: 'upload'  // 文件上传提交地址
			    
			});
	</script>
        <script>
            function quxiao(mid,uid){
            	var url = '/massage.do';
            	location.href = "${pageContext.servletContext.contextPath}/agreenum.do?mid="+mid+"&uid="+uid+"&url="+url;
            }
            function dianzan(mid,uid){
            	var url = '/massage.do';
            	location.href = "${pageContext.servletContext.contextPath}/agreenum.do?mid="+mid+"&uid="+uid+"&url="+url;
            }
            function shanchu(mid){
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
            	        	location.href = "${pageContext.servletContext.contextPath}/delete.do?mid="+mid;
            	        }
            	    }
            	});
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
            							 location.href = "${pageContext.servletContext.contextPath}/commentnum.do?add="+'true'+'&mid='+mid;
            					     }
            					}
            	      	});
            	      }else{
            	    	  return;
            	      }
            	    }
            	});
            }
            function xiangqing(minfoid){
            	location.href = "${pageContext.servletContext.contextPath}/massageinfo.do?minfoid="+minfoid;
            }
            function shoucang(uid){
            	
            }
            function colle(mid,uid){
            	var param = '{"mid":"'+mid+'","uid":"'+uid+'"}';
   	    	 $.ajax({
   					url:"shoucang",
   					type:"post",
   					dataType:"json",
   					async:true,
   					data:param,
   					success:function(data){
   							$('#shoucang'+mid).html('<span><i class="icon icon-heart"></i> 收藏&nbsp;'+ data +'</span>')
   					}
   	      	});
            }
            function zhuanfa(mid,uid){
            	bootbox.confirm({
            	    message: "确定转发?",
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
            	        if(result){//确认转发信息
            	        	var Tinfo = $('.b-m-3-3').text();
            	        	var param = '{"mid":"'+mid+'","uid":"'+uid+'","Tinfo":"'+Tinfo+'"}';
            	   	    	 $.ajax({
            	   					url:"zhuanfa",
            	   					type:"post",
            	   					dataType:"json",
            	   					async:true,
            	   					data:param,
            	   					success:function(data){
            	   						if(data!='error'){
            	   							$('#zhuanfa'+mid).html('<span><i class="icon icon-file-text-o"></i> 评论&nbsp;'+data+'</span>');
            	   						}else{
            	   							alert("已经转发过了！")
            	   						}
            	   					}
            	   	      	});
            	        }
            	    }
            	});
            }
        </script>
</html>
