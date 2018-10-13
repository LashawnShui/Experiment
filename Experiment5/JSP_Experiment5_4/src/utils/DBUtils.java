package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Employee;

public class DBUtils {
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/JSP_Experiment5_4", "root", "500532");
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public boolean closeAll(Connection connection,PreparedStatement preparedStatement,ResultSet resultSet) {
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
		Connection connection = null;
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
	public ArrayList<Employee> executeQuery(String sql, Object...params) {
		ArrayList<Employee> employees = new ArrayList<Employee>();
		Connection connection = null;
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
				Employee employee = new Employee(resultSet.getInt(1) ,resultSet.getString(2), resultSet.getString(3), resultSet.getDouble(4), resultSet.getInt(5));
				employees.add(employee);
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		} finally {
			closeAll(connection, preparedStatement, resultSet);
		}
		return employees;
	}
}
