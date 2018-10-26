package dao;

import java.util.ArrayList;

import utils.DBUtils;
import bean.User;

public class UserDao {
	private static DBUtils dbUtils = new DBUtils();
	
	//µÇÂ¼
	public ArrayList<User> signIn(String username, String password) {
		String sql = "select * from user where binary username=? and binary password=?;";
		Object[] params = {username, password};
		return dbUtils.executeQuery(sql, params);
	}
}
