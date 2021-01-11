package com.wb.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.wb.util.JDBCUtil;

public class UserDao {

	public static <T> void save(Class<T> classes,T object){
		String sql;
		if(classes.equals(User.class)){
			User user = (User) object;
	        sql = "INSERT INTO m_user(email,`password`,nikename,`time`,phone) VALUES(?,?,?,NOW(),?);";
	        Object[] params = new Object[]{user.getEmail(),user.getPassword(),user.getNikename(),user.getPhone()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserInfo.class)){
			UserInfo userinfo = (UserInfo) object;
	        sql = "INSERT INTO m_userinfo(truename,address,sex,birthday,bloodtype,intro,email,student_id,uid,school) VALUES(?,?,?,?,?,?,?,?,?,?);";
	        Object[] params = new Object[]{userinfo.getTruename(),userinfo.getAddress(),userinfo.getSex(),userinfo.getBirthday(),userinfo.getBloodtype(),userinfo.getIntro(),userinfo.getEmail(),userinfo.getStudent_id(),userinfo.getUid(),userinfo.getSchool()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserMassage.class)){
			UserMassage usermassage = (UserMassage) object;
			sql = "INSERT INTO m_massage(info,TIME,collectnum,commentnum,transpondnum,agreenum,readnum,user_id) VALUES(?,NOW(),?,?,?,?,?,?);";
	        Object[] params = new Object[]{usermassage.getInfo(),usermassage.getCollectnum(),usermassage.getCommentnum(),usermassage.getTranspondnum(),usermassage.getAgreenum(),usermassage.getReadnum(),usermassage.getUser_id()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserPic.class)){
			UserPic userpic = (UserPic) object;
			sql = "INSERT INTO m_pic(url,uid) VALUES(?,?);";
	        Object[] params = new Object[]{userpic.getUrl(),userpic.getUser_id()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassageColection.class)){
			MassageColection mco = (MassageColection) object;
			sql = "INSERT INTO colection(uid,`mid`) VALUES(?,?)";
			Object[] params = new Object[]{mco.getUid(),mco.getMid()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassagePic.class)){
			MassagePic massagepic = (MassagePic) object;
			sql = "INSERT INTO m_mpic(url,`mid`) VALUES(?,?);";
			Object[] params = new Object[]{massagepic.getUrl(),massagepic.getMid()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassageAgree.class)){
			MassageAgree mg = (MassageAgree) object;
			sql = "INSERT INTO m_zan(MID,uid) VALUES(?,?);";
			Object[] params = new Object[]{mg.getMid(),mg.getUid()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassageComment.class)){
			MassageComment mc = (MassageComment)object;
			sql = "INSERT INTO `comment`(`mid`,uid,info,`time`) VALUES(?,?,?,NOW())";
			Object[] params = new Object[]{mc.getMid(),mc.getUid(),mc.getInfo()};
	        JDBCUtil.jdbc_update(sql, params);
		}
	}
	public static <T> void update(Class<T> classes,T object){
		String sql;
		if(classes.equals(User.class)){
			User user = (User) object;
	        sql = "";
	        Object[] params = new Object[]{user.getEmail(),user.getPassword(),user.getNikename(),user.getPhone()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserInfo.class)){
			UserInfo userinfo = (UserInfo) object;
	        sql = "UPDATE m_userinfo SET truename=?,address=?,sex=?,birthday=?,bloodtype=?,intro=?,email=?,student_id=?,school=? WHERE uid=?;";
	        Object[] params = new Object[]{userinfo.getTruename(),userinfo.getAddress(),userinfo.getSex(),userinfo.getBirthday(),userinfo.getBloodtype(),userinfo.getIntro(),userinfo.getEmail(),userinfo.getStudent_id(),userinfo.getSchool(),userinfo.getUid()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserMassage.class)){
			UserMassage usermassage = (UserMassage)object;
			sql = "UPDATE m_massage SET info=?,collectnum=?,commentnum=?,transpondnum=?,agreenum=?,readnum=? WHERE id=?";
			Object[] params = new Object[]{usermassage.getInfo(),usermassage.getCollectnum(),usermassage.getCommentnum(),usermassage.getTranspondnum(),usermassage.getAgreenum(),usermassage.getReadnum(),usermassage.getId()};
		    JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserPic.class)){
			UserPic userpic = (UserPic) object;
			User user = (User) object;
			sql = "UPDATE m_pic SET url=? WHERE uid=?;";;
	        Object[] params = new Object[]{userpic.getUrl(),user.getId()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassageAgree.class)){
			MassageAgree mg = (MassageAgree) object;
			sql = "DELETE  FROM m_zan WHERE MID=? AND uid=?";
			Object[] params = new Object[]{mg.getMid(),mg.getUid()};
	        JDBCUtil.jdbc_update(sql, params);
		}
	}
	//存大表
	@SuppressWarnings("unchecked")
	public static <T> List<T> findAllById(Class<T> classes,T object){
		String sql;
		List<T> list = null;
		if(classes.equals(User.class)){
			User user = (User) object;
	        sql = "SELECT * FROM m_user WHERE id=?;";
	        Object[] params = new Object[]{user.getId()};
	        list = (List<T>) JDBCUtil.jdbc_query(User.class, sql, params);
		}else if(classes.equals(UserInfo.class)){
			UserInfo userinfo = (UserInfo) object;
			sql = "SELECT * FROM m_userinfo WHERE uid=?";
	        Object[] params = new Object[]{userinfo.getUid()};
	        list = (List<T>) JDBCUtil.jdbc_query(UserInfo.class, sql, params);
		}else if(classes.equals(UserMassage.class)){
			UserMassage usermassage = (UserMassage) object;
			sql = "SELECT * FROM m_massage WHERE user_id=? OR id=?";//查找用户发表的信息
			System.out.println(usermassage.getUser_id()+usermassage.getId());
			Object[] params = new Object[]{usermassage.getUser_id(),usermassage.getId()};
	        list = (List<T>) JDBCUtil.jdbc_query(UserMassage.class, sql, params);
		}else if(classes.equals(UserPic.class)){
			UserPic userpic = (UserPic) object;
	        sql = "SELECT * FROM m_pic WHERE uid=?;";
	        Object[] params = new Object[]{userpic.getUser_id()};
	        list = (List<T>) JDBCUtil.jdbc_query(UserPic.class, sql, params);
		}else if(classes.equals(MassageComment.class)){
			MassageComment mc = (MassageComment) object;
			sql = "SELECT * FROM `comment` WHERE `mid`=?";
			Object[] params = new Object[]{mc.getMid()};
	        list = (List<T>) JDBCUtil.jdbc_query(MassageComment.class, sql, params);
		}else if(classes.equals(MassagePic.class)){
			MassagePic massagepic = (MassagePic) object;//查找用户发表的图片
	        sql = "SELECT * FROM m_mpic WHERE mid=?;";
	        Object[] params = new Object[]{massagepic.getMid()};
	        list = (List<T>) JDBCUtil.jdbc_query(MassagePic.class, sql, params);
		}else if(classes.equals(MassageAgree.class)){
			MassageAgree mg = (MassageAgree) object;
	        sql = "SELECT * FROM m_zan WHERE MID=? AND uid=?";//查找用户是否点赞
	        Object[] params = new Object[]{mg.getMid(),mg.getUid()};
	        list = (List<T>) JDBCUtil.jdbc_query(MassageAgree.class, sql, params);
		}else if(classes.equals(MassageColection.class)){
			MassageColection mco = (MassageColection) object;
	        sql = "SELECT * FROM colection WHERE MID=? AND uid=?";//查找用户是否收藏
	        Object[] params = new Object[]{mco.getMid(),mco.getUid()};
	        list = (List<T>) JDBCUtil.jdbc_query(MassageAgree.class, sql, params);
		}else if(classes.equals(MassageColection.class)){
			MassageTranslate mco = (MassageTranslate) object;
	        sql = "SELECT * FROM translate WHERE MID=? AND uid=?";//查找用户是否转发
	        Object[] params = new Object[]{mco.getMid(),mco.getUid()};
	        list = (List<T>) JDBCUtil.jdbc_query(MassageAgree.class, sql, params);
		}
		return list;
	}




	public static User findByPhone(String phone) {
		String sql;
		List<User> list = null;
		sql = "SELECT * FROM m_user WHERE phone=?;";
		Object[] params = new Object[]{phone};
		list = JDBCUtil.jdbc_query(User.class, sql, params);
		if(list.size() == 0){
			return null;
		}else{
			return list.get(0);
		}
	}
	public static void uploader(HttpServletRequest request, HttpServletResponse response) {
		
		
	}
	@SuppressWarnings("unchecked")
	public static <T> List<T> findAll(Class<T> classes,T object){
		String sql;
		List<T> list = null;
		if(classes.equals(User.class)){
	        sql = "SELECT * FROM m_user";
	        Object[] params = new Object[]{};
	        list = (List<T>) JDBCUtil.jdbc_query(User.class, sql, params);
		}else if(classes.equals(UserInfo.class)){
			sql = "SELECT * FROM m_userinfo";
	        Object[] params = new Object[]{};
	        list = (List<T>) JDBCUtil.jdbc_query(UserInfo.class, sql, params);
		}else if(classes.equals(UserMassage.class)){
			sql = "SELECT * FROM m_massage";
			Object[] params = new Object[]{};
	        list = (List<T>) JDBCUtil.jdbc_query(UserMassage.class, sql, params);
		}else if(classes.equals(UserPic.class)){
	        sql = "SELECT * FROM m_pic";
	        Object[] params = new Object[]{};
	        list = (List<T>) JDBCUtil.jdbc_query(UserPic.class, sql, params);
		}else if(classes.equals(MassagePic.class)){
	        sql = "SELECT * FROM m_mpic";
	        Object[] params = new Object[]{};
	        list = (List<T>) JDBCUtil.jdbc_query(MassagePic.class, sql, params);
		}else if(classes.equals(MassageAgree.class)){
	        sql = "SELECT * FROM m_zan";
	        Object[] params = new Object[]{};
	        list = (List<T>) JDBCUtil.jdbc_query(MassageAgree.class, sql, params);
		}
		return list;
	}
	public static <T> void delete(Class<T> classes,T object) {
		String sql;
		if(classes.equals(User.class)){
			User user = (User) object;
	        sql = "";
	        Object[] params = new Object[]{user.getEmail(),user.getPassword(),user.getNikename(),user.getPhone()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserInfo.class)){
			UserInfo userinfo = (UserInfo) object;
	        sql = "";
	        Object[] params = new Object[]{};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserMassage.class)){
			UserMassage usermassage = (UserMassage)object;
			sql = "DELETE FROM m_massage WHERE id=?";
			Object[] params = new Object[]{usermassage.getId()};
		    JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(UserPic.class)){
			UserPic userpic = (UserPic) object;
			User user = (User) object;
			sql = "";;
	        Object[] params = new Object[]{userpic.getUrl(),user.getId()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassageComment.class)){
			MassageComment mc = (MassageComment)object;
			sql = "DELETE  FROM comment WHERE MID=? or ID=?";
			Object[] params = new Object[]{mc.getMid(),mc.getId()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassageAgree.class)){
			MassageAgree mg = (MassageAgree) object;
			sql = "DELETE  FROM m_zan WHERE MID=? or ID=?";
			Object[] params = new Object[]{mg.getMid(),mg.getId()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassageColection.class)){
			MassageColection mg = (MassageColection) object;
			sql = "DELETE  FROM colection WHERE MID=? or uid=?";
			Object[] params = new Object[]{mg.getMid(),mg.getUid()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassageTranslate.class)){
			MassageTranslate mg = (MassageTranslate) object;
			sql = "DELETE  FROM colection WHERE MID=?";
			Object[] params = new Object[]{mg.getMid()};
	        JDBCUtil.jdbc_update(sql, params);
		}else if(classes.equals(MassagePic.class)){
			MassagePic mg = (MassagePic) object;
			sql = "DELETE  FROM m_mpic WHERE MID=?";
			Object[] params = new Object[]{mg.getMid()};
	        JDBCUtil.jdbc_update(sql, params);
		}
	}
	public static void ChangeByPhone(String uphone,String newpwd) {
		 String sql = "UPDATE m_user SET PASSWORD=? WHERE phone=?;";
		Object[] params = new Object[]{newpwd,uphone};
		JDBCUtil.jdbc_update(sql, params);
		
	}
}
