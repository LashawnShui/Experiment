package dao;

import java.util.ArrayList;

import bean.User;

import utils.DBUtils;

public class UserDao {
	private static DBUtils dbUtils = new DBUtils();
	
	//µÇÂ¼
	public ArrayList<User> signIn(String username, String password) {
		String sql = "select * from user where username=? and password=?;";
		Object[] params = {username, password};
		return dbUtils.executeQuery(sql, params);
	}
}
