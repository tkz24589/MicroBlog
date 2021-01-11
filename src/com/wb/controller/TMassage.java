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
import com.wb.model.MassageTranslate;
import com.wb.model.UserMassage;


@WebServlet(urlPatterns = {"/zhuanfa"})
public class TMassage extends HttpServlet{
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
		String mid = json.getString("mid");
		String uid = json.getString("uid");
		String Tinfo = json.getString("Tinfo");
		PrintWriter writer = resp.getWriter();
		MassageTranslate mt = new MassageTranslate(Integer.parseInt(uid), Integer.parseInt(mid));
		if(UserDao.findAllById(MassageTranslate.class, mt).size()==0){
			UserMassage um = new UserMassage(Tinfo, 0, 0, 0, 0, 0, Integer.parseInt(uid));
			UserDao.save(UserMassage.class, um);
			UserMassage um2 = new UserMassage();
			um2.setId(Integer.parseInt(mid));
			um2 = UserDao.findAllById(UserMassage.class, um2).get(0);
			um2.setTranspondnum(um2.getTranspondnum()+1);
			UserDao.update(UserMassage.class, um2);
			writer.write(um2.getTranspondnum()+"");
		}else{
			writer.write("error");
		}
		writer.flush();
		writer.close();
	}

}
