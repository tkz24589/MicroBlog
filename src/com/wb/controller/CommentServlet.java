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


@WebServlet(urlPatterns = {"/pinlun"})
public class CommentServlet extends HttpServlet{
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
		String info = json.getString("pinlun");
		MassageComment mc = new MassageComment(Integer.parseInt(mid), Integer.parseInt(uid), info);
		UserDao.save(MassageComment.class, mc);
		PrintWriter writer = resp.getWriter();
		writer.write("0");
		writer.flush();
		writer.close();
	}

}
