package utils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.alibaba.druid.pool.DruidPooledConnection;

import databasePool.DbPoolConnection;

import bean.User;


public class DBUtils {
	public DruidPooledConnection getConnection() {
		try {
			DbPoolConnection dbp = DbPoolConnection.getInstance();
			return dbp.getConnection();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public boolean closeAll(DruidPooledConnection connection,PreparedStatement preparedStatement,ResultSet resultSet) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (Exception exception) {
			exception.printStackTrace();
			return false;
		}
		return true;
	}
	public int executeUpdate(String sql, Object...params) {
		DruidPooledConnection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				preparedStatement.setObject(i+1, params[i]);
			}
			return preparedStatement.executeUpdate();
		} catch (Exception exception) {
			exception.printStackTrace();
		} finally {
			closeAll(connection, preparedStatement, null);
		}
		return 0;
	}
	public ArrayList<User> executeQuery(String sql, Object...params) {
		ArrayList<User> users = new ArrayList<User>();
		DruidPooledConnection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				preparedStatement.setObject(i+1, params[i]);
			}
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				User user = new User(resultSet.getInt(1) ,resultSet.getString(2), resultSet.getString(3));
				users.add(user);
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		} finally {
			closeAll(connection, preparedStatement, resultSet);
		}
		return users;
	}
}
