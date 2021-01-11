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
import com.wb.model.MassageColection;
import com.wb.model.UserMassage;


@WebServlet(urlPatterns = {"/shoucang"})
public class Colaction extends HttpServlet{
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
		UserMassage um = new UserMassage();
		um.setId(Integer.parseInt(mid));
		um = UserDao.findAllById(UserMassage.class, um).get(0);
		MassageColection mco = new MassageColection(Integer.parseInt(uid),Integer.parseInt(mid));
		PrintWriter writer = resp.getWriter();
		if(UserDao.findAllById(MassageColection.class, mco).size()==0){
			UserDao.save(MassageColection.class, mco);
			um.setCollectnum(um.getCollectnum()+1);
		    UserDao.update(UserMassage.class, um);
		}else{
			UserDao.delete(MassageColection.class, mco);
			um.setCollectnum(um.getCollectnum()-1);
		    UserDao.update(UserMassage.class, um);
		}
		writer.write(um.getCollectnum()+"");
		writer.flush();
		writer.close();
	}

}
