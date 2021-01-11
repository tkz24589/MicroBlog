package com.wb.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.wb.dao.UserDao;
import com.wb.model.MassagePic;
import com.wb.model.User;
import com.wb.model.UserMassage;


@WebServlet(urlPatterns = {"/upload"})
public class Upload extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        DiskFileItemFactory dfif = new DiskFileItemFactory();
        ServletFileUpload parser = new ServletFileUpload(dfif);
        List<FileItem> items = null;
        try {
            items = parser.parseRequest(req);
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
                	String path = req.getServletContext().getRealPath("/pic");
                	//文件名
                	String phone = (String) req.getSession().getAttribute("phone");
                	User user = UserDao.findByPhone(phone);
                	UserMassage um = new UserMassage("", 0, 0, 0, 0, 0,  user.getId());
                    UserDao.save(UserMassage.class, um);
                    List<UserMassage> mlist = UserDao.findAllById(UserMassage.class, um);
                    um = mlist.get(mlist.size()-1);
                	MassagePic mp = new MassagePic();
                	mp.setMid(um.getId());
                	String name = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date())+user.getNikename()+oldName.substring(oldName.lastIndexOf("."));
                	mp.setUrl("pic/"+name);
                	req.setAttribute("userpic",path+name);
                	try {
						item.write(new File(path,name));
						//跟新用户头像为新的图片路径
						UserDao.save(MassagePic.class,mp);
					} catch (Exception e) {
						e.printStackTrace();
					}
                }
            }
        }
        out.write("上传成功！");
	}

}
