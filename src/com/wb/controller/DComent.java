package com.wb.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.wb.dao.UserDao;
import com.wb.model.MassageComment;
import com.wb.model.UserMassage;


@WebServlet(urlPatterns = {"/shanchupinlun"})
public class DComent extends HttpServlet{
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
		BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(),"utf-8"));  
        String line = null;  
        StringBuilder sb = new StringBuilder();  
        while ((line = br.readLine()) != null) {  
            sb.append(line);  
        }
        
		JSONObject json=JSON.parseObject(sb.toString());
		String cid = json.getString("cid");
		String mid = json.getString("mid");
		MassageComment mc = new MassageComment();
		mc.setId(Integer.parseInt(cid));
		UserDao.delete(MassageComment.class, mc);
		UserMassage umg = new UserMassage();
		umg.setId(Integer.parseInt(mid));
		umg = UserDao.findAllById(UserMassage.class, umg).get(0);
		umg.setCommentnum(umg.getCommentnum()-1);
		UserDao.update(UserMassage.class, umg);
		PrintWriter writer = resp.getWriter();
		writer.write("1");
		writer.flush();
		writer.close();
	}

}

