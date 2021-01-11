package com.wb.controller;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.wb.dao.UserDao;
import com.wb.model.MassageAgree;
import com.wb.model.MassageColection;
import com.wb.model.MassageComment;
import com.wb.model.MassagePic;
import com.wb.model.MassageTranslate;
import com.wb.model.User;
import com.wb.model.UserInfo;
import com.wb.model.UserMassage;
import com.wb.model.UserPic;
import com.wb.util.CodeUtil;
import com.wb.util.*;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@SuppressWarnings("serial")
public class WebServlet extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//设置编码
		//获取用户地址栏的地址
		String url = request.getServletPath();//    /b.do
		System.out.println("本次请求的地址："+url);
		//可以用来保存数据和取数据的对象
		HttpSession session = request.getSession();
		
		if("/register.do".equals(url)){
			String email = request.getParameter("email");
			//加密
			String password = request.getParameter("password");
			password=MD5Utils.MD5Encode(password, "utf-8");
			String nikename = request.getParameter("nikename");
			String phone = request.getParameter("phone");
			User user = new User(email, password, nikename, phone);
			UserDao.save(User.class,user);
			user = UserDao.findByPhone(phone);
			UserPic userpic = new UserPic();
			UserInfo userinfo = new UserInfo();
			System.out.println("pic:" + user.getId());
			userpic.setUser_id(user.getId());
			userinfo.setUid(user.getId());
			UserDao.save(UserPic.class, userpic);//空头像
			UserDao.save(UserInfo.class, userinfo);
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("phone", user.getPhone());
			request.getRequestDispatcher("page/login.jsp").forward(request, response);
		}else if("/code.do".equals(url)){
			BufferedImage img = new BufferedImage(100, 30, BufferedImage.TYPE_INT_RGB);
			String code = "";
			Graphics g = img.getGraphics();
			g.setColor(Color.black);
			g.fillRect(0, 0, 100, 30);
			g.setColor(Color.white);
			g.setFont(new Font("", Font.BOLD, 20));
			String s = CodeUtil.str();
			g.drawString(s, 10, 20);
			code += s;
			s = CodeUtil.str();
			g.drawString(s, 30, 20);
			code += s;
			s = CodeUtil.str();
			g.drawString(s, 60, 20);
			code += s;
			s = CodeUtil.str();
			g.drawString(s, 80, 20);
			code += s;
			OutputStream out = response.getOutputStream();
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(img);
			session.setAttribute("code", code);
		}else if("/pwdlogin.do".equals(url)){
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			password=MD5Utils.MD5Encode(password, "utf-8");
			//String usercode = request.getParameter("code");
			//String code = (String) session.getAttribute("code");
			//if(usercode.equalsIgnoreCase(code)){
				System.out.println("！");
				User u = UserDao.findByPhone(phone);
				if(u == null){
					request.setAttribute("error", "账户名不存在！");
					request.getRequestDispatcher("page/login.jsp").forward(request, response);
				}else{
					if(u.getPassword().equals(password)){
						request.getSession().setAttribute("user", u);
						UserPic userpic = new UserPic();
						userpic.setUser_id(u.getId());
						List<UserPic> list = UserDao.findAllById(UserPic.class, userpic);
						if(list.size() !=0){
							userpic = list.get(0);
							request.getSession().setAttribute("userpic", userpic);
						}
			
						request.getSession().setAttribute("phone",u.getPhone());
						if(u.getPhone().equals("15367480093")){
							request.getRequestDispatcher("/manager.do").forward(request, response);
						}else{
							request.getRequestDispatcher("/massage.do").forward(request, response);
						}
					}else{
						request.setAttribute("error", "密码错误！");
						request.getRequestDispatcher("page/login.jsp").forward(request, response);
					}
				}
			//}else{
			//	request.setAttribute("error", "验证码错误！");
			//	request.getRequestDispatcher("page/login.jsp").forward(request, response);
			//}
				
		}else if("/smslogin.do".equals(url)){
			String uphone = request.getParameter("uphone");
			request.setAttribute("uphone", uphone);
			String smscode = request.getParameter("smscode");
			if(!smscode.equals(request.getSession().getAttribute("smscode"))){
				request.setAttribute("error", "验证码错误！");
				request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("page/register.jsp").forward(request, response);
			}
		}else if("/sendsmscode.do".equals(url)){
			String uphone = request.getParameter("uphone");
			if(UserDao.findByPhone(uphone) != null){
			   String smscode = SendCodeUtil.sendsms(uphone);
			   JSONObject json = (JSONObject) JSON.parse(smscode);
			   String code = json.getString("obj");
			   request.getSession().setAttribute("smscode", code);
			   request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
		   }else{
			   request.setAttribute("error", "手机号不存在！");
		   }
		}else if("/complete.do".equals(url)){
			String truename = request.getParameter("truename");
			String address = request.getParameter("address");
			String sex = request.getParameter("sex");
			String birthday = request.getParameter("birthday");
			String bloodtype = request.getParameter("bloodtype");
			String intro = request.getParameter("intro");
			String email = request.getParameter("email");
			String student_id = request.getParameter("student_id");
			String school = request.getParameter("school");
			String phone = (String) request.getSession().getAttribute("phone");//隐藏的用户电话，获取用户id，以便于第一次完善信息
			User user = UserDao.findByPhone(phone);
			request.setAttribute("user", user);
			UserInfo userinfo = new UserInfo(truename, address, sex, birthday, bloodtype, intro, email, student_id, user.getId(),school);
			UserDao.update(UserInfo.class, userinfo);
			request.setAttribute("userinfo", userinfo);
			request.getRequestDispatcher("page/personinfo.jsp").forward(request, response);
		}else if("/massage.do".equals(url)){
			List<UserMassage> list = null;
			List<User> ulist = new ArrayList<User>();
			List<UserPic> plist = new ArrayList<UserPic>();
			List<MassagePic> mplist = new ArrayList<MassagePic>();
			String phone = (String) request.getSession().getAttribute("phone");//隐藏的用户电话，获取用户id，以便于第一次完善信息	
            User user = UserDao.findByPhone(phone);
			request.getSession().setAttribute("user", user);
			UserPic userpic = new UserPic();
			userpic.setUser_id(user.getId());
			List<UserPic> list1 = UserDao.findAllById(UserPic.class, userpic);
			if(list1.size() !=0){
				userpic = list1.get(0);
				request.setAttribute("userpic", userpic);
			}
			UserMassage usermassage = new UserMassage();
			User Muser = new User();
			UserPic Puser = new UserPic();
			MassagePic mp = new MassagePic();
			list = UserDao.findAll(UserMassage.class, usermassage);
			if(list.size() != 0){
				for(int i = 0;i<list.size();i++){
					Muser.setId(list.get(i).getUser_id());
					Puser.setUser_id(list.get(i).getUser_id());
					mp.setMid(list.get(i).getId());
					List<MassagePic> mc = UserDao.findAllById(MassagePic.class, mp);
					if(mc.size()!=0){
						mp = mc.get(0);
					}else{
						mp = new MassagePic();
					}
					Muser = UserDao.findAllById(User.class, Muser).get(0);
					Puser = UserDao.findAllById(UserPic.class, Puser).get(0);
					ulist.add(Muser);
					plist.add(Puser);
					mplist.add(mp);
				}
				Collections.reverse(list);
				Collections.reverse(ulist);
				Collections.reverse(plist);
				Collections.reverse(mplist);
			}
			List<UserMassage> mlist = null;
			UserMassage umassage = new UserMassage();
			umassage.setUser_id(user.getId());
			mlist = UserDao.findAllById(UserMassage.class, umassage);
			request.getSession().setAttribute("m",mlist.size());
			request.setAttribute("usermassage",list);
			request.setAttribute("muser",ulist);
			request.setAttribute("puser",plist);
			request.setAttribute("mpuser",mplist);
			request.getRequestDispatcher("page/welcome.jsp").forward(request, response);
		}else if("/sendmassage.do".equals(url)){
			List<UserMassage> list = null;
			String massage = request.getParameter("massage");
			String phone = (String) request.getSession().getAttribute("phone");//隐藏的用户电话，获取用户id，以便于第一次完善信息
            User user = UserDao.findByPhone(phone);
			int uid = user.getId();
			UserMassage usermassage = new UserMassage();
			usermassage.setUser_id(uid);
			List<UserMassage> mlist = UserDao.findAllById(UserMassage.class, usermassage);
			if(mlist.size()!=0){
			usermassage = mlist.get(mlist.size()-1);
			}else{
				usermassage = new UserMassage(massage, 0, 0, 0, 0, 0, uid);
			}
			if(usermassage.getInfo().equals("")){
				usermassage.setInfo(massage);
				UserDao.update(UserMassage.class, usermassage);
			}else{
				usermassage = new UserMassage(massage, 0, 0, 0, 0, 0, uid);
				usermassage.setInfo(massage);
				UserDao.save(UserMassage.class, usermassage);
			}
			list = UserDao.findAllById(UserMassage.class, usermassage);
			Collections.reverse(list);
			request.getSession().setAttribute("usermassage",list);
			request.getRequestDispatcher("/massage.do").forward(request, response);
		}else if("/upload.do".equals(url)){
			//文件上传：
			request.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        DiskFileItemFactory dfif = new DiskFileItemFactory();
	        ServletFileUpload parser = new ServletFileUpload(dfif);
	        List<FileItem> items = null;
	        try {
	            items = parser.parseRequest(request);
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        //处理请求内容
	        if(items!=null){
	            for(FileItem item:items){
	                if(item.isFormField()){
	                    
	                }else{
	                	String oldName = item.getName();
	                    //确定要上传到服务器的位置
	                	String path = request.getServletContext().getRealPath("/pic");
	                	//文件名
	                	String phone = (String) request.getSession().getAttribute("phone");
	                	User user = UserDao.findByPhone(phone);
	                	String name = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date())+user.getNikename()+oldName.substring(oldName.lastIndexOf("."));
	                	((UserPic)user).setUrl("pic/"+name);
	                	request.setAttribute("userpic",path+name);
	                	try {
							item.write(new File(path,name));
							//跟新用户头像为新的图片路径
							UserDao.update(UserPic.class,(UserPic)user);
							
							
						} catch (Exception e) {
							e.printStackTrace();
						}
	                }
	            }
	        }
	        out.write("上传成功！");
		}else if("/person.do".equals(url)){
			String phone = (String) request.getSession().getAttribute("phone");
			User user = UserDao.findByPhone(phone);
			request.getSession().setAttribute("user", user);
			UserPic userpic = new UserPic();
			userpic.setUser_id(user.getId());
			userpic = UserDao.findAllById(UserPic.class, userpic).get(0);
			UserMassage othermassage = new UserMassage();
			othermassage.setUser_id(user.getId());
			List<UserMassage>list = UserDao.findAllById(UserMassage.class, othermassage);
			request.setAttribute("mc", list.size());
			request.getSession().setAttribute("userpic", userpic);
			request.getRequestDispatcher("page/person.jsp").forward(request, response);
		}else if("/personinfo.do".equals(url)){
			String phone = (String) request.getSession().getAttribute("phone");
			User user = UserDao.findByPhone(phone);
			request.getSession().setAttribute("user", user);
			UserPic userpic = new UserPic();
			UserInfo userinfo = new UserInfo();
			userinfo.setUid(user.getId());
			userpic.setUser_id(user.getId());
			List<UserInfo> u1 = UserDao.findAllById(UserInfo.class, userinfo);
			List<UserPic> u2 = UserDao.findAllById(UserPic.class, userpic);
			if(u1.size() != 0){
			userinfo = u1.get(0);
			}
			if(u2.size() != 0){
			userpic = u2.get(0);
			}
			request.getSession().setAttribute("userinfo", userinfo);
			request.getSession().setAttribute("userpic", userpic);
			request.getRequestDispatcher("page/personinfo.jsp").forward(request, response);
		}else if("/collectnum.do".equals(url)){
			
		}else if("/massageinfo.do".equals(url)){
			String minfoid = request.getParameter("minfoid");
			MassageComment mc = new MassageComment();
			mc.setMid(Integer.parseInt(minfoid));
			List<MassageComment> mclist = null;
			mclist = UserDao.findAllById(MassageComment.class, mc);
			if(mclist.size()!=0){
				User couser = new User();
				List<User> colist = new ArrayList<User>();
				for(int i=0;i<mclist.size();i++){
					couser.setId(mclist.get(i).getUid());
					couser = UserDao.findAllById(User.class, couser).get(0);
					colist.add(couser);
				}
				request.setAttribute("colist", colist);
			}
			User msuser = new User();
			UserMassage um = new UserMassage();
			UserPic userpic = new UserPic();
			um.setId(Integer.parseInt(minfoid));
			um = UserDao.findAllById(UserMassage.class, um).get(0);//查找本次显示消息的详情信息
			msuser.setId(um.getUser_id());
			msuser = UserDao.findAllById(User.class, msuser).get(0);//找到本条消息的用户
			userpic.setUser_id(msuser.getId());
			List<UserPic> list1 = UserDao.findAllById(UserPic.class, userpic);//找到用户图片
			if(list1.size() !=0){
				userpic = list1.get(0);
				request.setAttribute("otherpic", userpic);
			}
			MassagePic mp = new MassagePic();
			mp.setMid(um.getId());
			List<MassagePic> mplist = UserDao.findAllById(MassagePic.class, mp);
			if(mplist.size()!=0){
				request.setAttribute("ompic1", mplist.get(0));
			}
			request.setAttribute("mclist", mclist);
			request.setAttribute("msuser", msuser);
			request.setAttribute("um", um);
			request.getRequestDispatcher("page/massageinfo.jsp").forward(request, response);
		}else if("/commentnum.do".equals(url)){
			String add = request.getParameter("add");
			String mid = request.getParameter("mid");
			String check = request.getParameter("shan");
			UserMassage umg = new UserMassage();
			umg.setId(Integer.parseInt(mid));
			umg = UserDao.findAllById(UserMassage.class, umg).get(0);
			if(add.equals("true")){
				umg.setCommentnum(umg.getCommentnum()+1);
				UserDao.update(UserMassage.class, umg);
			}else{
				umg.setCommentnum(umg.getCommentnum()-1);
				UserDao.update(UserMassage.class, umg);
			}
			if(check!=null&&check.equals("true")){
				request.getRequestDispatcher("/massageinfo.do?minfoid="+mid).forward(request, response);
			}else if(check!=null&&check.equals("false")){
				request.getRequestDispatcher("/other.do?ouid="+umg.getUser_id()).forward(request, response);
			}else{
				request.getRequestDispatcher("/massage.do").forward(request, response);
			}
		}else if("/agreenum.do".equals(url)){
			List<MassageAgree> list = null;
			String url1 = request.getParameter("url");
			String mid = request.getParameter("mid");
			String uid = request.getParameter("uid");
			MassageAgree mg = new MassageAgree(Integer.parseInt(mid), Integer.parseInt(uid));
			list = UserDao.findAllById(MassageAgree.class, mg);
			UserMassage umg = new UserMassage();
			umg.setId(Integer.parseInt(mid));
			umg = UserDao.findAllById(UserMassage.class, umg).get(0);
			if(list.size()==0){
				umg.setAgreenum(umg.getAgreenum()+1);
				UserDao.update(UserMassage.class, umg);
				UserDao.save(MassageAgree.class, mg);
				mg = UserDao.findAllById(MassageAgree.class, mg).get(0);
			}else{
				umg.setAgreenum(umg.getAgreenum()-1);
				UserDao.update(UserMassage.class, umg);
				UserDao.update(MassageAgree.class, mg);
				mg.setMid(0);
			}
			request.setAttribute("umzan", mg);
			request.getSession().setAttribute("ouid", umg.getUser_id());
			request.getRequestDispatcher(url1).forward(request, response);
		 }else if("/other.do".equals(url)){
			String ouid = request.getParameter("ouid");
			if(ouid==null){
				ouid =  (request.getSession().getAttribute("ouid")).toString();
			}
			List<UserMassage> list = null;
			User other = new User();
			other.setId(Integer.parseInt(ouid));
			other = UserDao.findAllById(User.class, other).get(0);
			request.getSession().setAttribute("other", other);
			UserPic otherpic = new UserPic();
			otherpic.setUser_id(other.getId());
			List<UserPic> list1 = UserDao.findAllById(UserPic.class, otherpic);
			if(list1.size() !=0){
				otherpic = list1.get(0);
				request.setAttribute("otherpic", otherpic);
			}
			UserMassage othermassage = new UserMassage();
			othermassage.setUser_id(Integer.parseInt(ouid));
			list = UserDao.findAllById(UserMassage.class, othermassage);
			if(list.size() != 0){
				Collections.reverse(list);
				List<MassagePic> mpplist = new ArrayList<MassagePic>();
				List<MassagePic> mc = null;
				MassagePic mp = new MassagePic();
				for(int i=0;i<list.size();i++){
					mp.setMid(list.get(i).getId());
					mc = UserDao.findAllById(MassagePic.class, mp);
					if(mc.size()!=0){
						mp = mc.get(0);
						mpplist.add(mp);
					}else{
						mp = new MassagePic();
						mpplist.add(mp);
					}
				}
				request.setAttribute("othermassagepic1",mpplist);
				request.setAttribute("othermassage",list);
				request.getSession().setAttribute("mo",list.size());
			}
			UserInfo un = new UserInfo();
			un.setUid(Integer.parseInt(ouid));
			List<UserInfo> u1 = UserDao.findAllById(UserInfo.class,un );
			if(u1.size() != 0){
			un = u1.get(0);
			request.setAttribute("otherinfo",un);
			}
			request.getRequestDispatcher("page/other.jsp").forward(request, response);
		 }else if("/delete.do".equals(url)){
			String mid = request.getParameter("mid");
			String ismanager = request.getParameter("ismanager");
			MassageAgree mg = new MassageAgree();
			MassageComment mc = new MassageComment();
			MassageColection mco = new MassageColection();
			MassageTranslate mt = new MassageTranslate();
			MassagePic mp = new MassagePic();
			mp.setMid(Integer.parseInt(mid));
			mco.setMid(Integer.parseInt(mid));
			mt.setMid(Integer.parseInt(mid));
			mc.setMid(Integer.parseInt(mid));
		    mg.setMid(Integer.parseInt(mid));
		    UserDao.delete(MassagePic.class, mp);
		    UserDao.delete(MassageAgree.class, mg);
		    UserDao.delete(MassageComment.class, mc);
		    UserDao.delete(MassageColection.class, mco);
		    UserDao.delete(MassageTranslate.class, mt);
			UserMassage um = new UserMassage();
			um.setId(Integer.parseInt(mid));
		    UserDao.delete(UserMassage.class, um);
		    if(ismanager!=null&&ismanager.equals("true")){
		    	request.getRequestDispatcher("/manager.do").forward(request, response);
		    }else{
		    	request.getRequestDispatcher("/massage.do").forward(request, response);
		    }
		}else if("/changepwd.do".equals(url)){
			String uphone = request.getParameter("uphone1");
			String newpwd = request.getParameter("newpwd");
			newpwd=MD5Utils.MD5Encode(newpwd, "utf-8");	
			UserDao.ChangeByPhone(uphone,newpwd);
			request.getRequestDispatcher("page/login.jsp").forward(request, response);
	    }else if("/sendpcode.do".equals(url)){
			String uphone = request.getParameter("uphone");
			request.setAttribute("uphone", uphone);
			String phonecode = request.getParameter("phonecode");
			if(phonecode==""){
				//发送验证码
			if(UserDao.findByPhone(uphone) != null ){
			   String smscode = SendCodeUtil.sendsms(uphone);
			   JSONObject json = (JSONObject) JSON.parse(smscode);
			   String pcode = json.getString("obj");
			   session.setAttribute("pcode", pcode);
			   session.setAttribute("phone", uphone);
			   request.getRequestDispatcher("page/findpwd.jsp").forward(request, response);
			
		    }else{
			   request.setAttribute("error", "手机号不存在！");
		    }
			}else{
				String pcode = (String) session.getAttribute("pcode");
				String phone = (String) session.getAttribute("phone");
				if(phonecode.equals(pcode)&&uphone.equals(phone)){
					request.setAttribute("error", "");
					request.getRequestDispatcher("page/changepwd.jsp").forward(request, response);
				}
				else{
					request.setAttribute("error", "验证码错误！");
					request.getRequestDispatcher("page/findpwd.jsp").forward(request, response);
				}
			}
	    }else if("/manager.do".equals(url)){
	    	List<UserMassage> list = null;
			String phone = (String) request.getSession().getAttribute("phone");//隐藏的用户电话，获取用户id，以便于第一次完善信息	
            User user = UserDao.findByPhone(phone);
			request.getSession().setAttribute("user", user);
			UserMassage usermassage = new UserMassage();
			list = UserDao.findAll(UserMassage.class, usermassage);
			Collections.reverse(list);
			request.setAttribute("allist", list);
			request.getRequestDispatcher("page/manager.jsp").forward(request, response);
	    }
    }
}