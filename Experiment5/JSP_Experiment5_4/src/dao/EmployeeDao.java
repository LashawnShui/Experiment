package dao;

import java.util.ArrayList;

import bean.Employee;

import utils.DBUtils;

public class EmployeeDao {
	static DBUtils dbUtils = new DBUtils();
	
	//查询全部的员工信息
	public ArrayList<Employee> selectAll() {
		String sql = "select * from employee;";
		return dbUtils.executeQuery(sql);
	}
	//添加员工信息
	public int insertEmployee(Employee employee) {
		String sql = "insert into employee values(null,?,?,?,?);";
		Object[] params = {employee.getEmp_name(), employee.getJob(), employee.getSalary(), employee.getDept()};
		return dbUtils.executeUpdate(sql, params);
	}
	//修改员工信息
	public int updateEmployee(Employee employee) {
		String sql = "update employee set emp_name=?,job=?,salary=?,dept=? where emp_id=?;";
		Object[] params = {employee.getEmp_name(), employee.getJob(), employee.getSalary(), employee.getDept(), employee.getEmp_id()};
		return dbUtils.executeUpdate(sql, params);
	}
	//根据emp_id的值删除员工信息
	public int deleteById(int emp_id) {
		String sql = "delete from employee where emp_id=?;";
		Object[] params = {emp_id};
		return dbUtils.executeUpdate(sql, params);
	}
	//根据emp_id的值查询员工信息
		public Employee selectById(int emp_id) {
			String sql = "select * from employee where emp_id=?;";
			Object[] params = {emp_id};
			ArrayList<Employee> employees = dbUtils.executeQuery(sql, params);
			if(employees.size() > 0) {
				return employees.get(0);
			}
			return null;
		}
	//根据job的值查询员工信息
	public ArrayList<Employee> selectByJob(String job) {
		String sql = "select * from employee where job=?;";
		Object[] params = {job};
		return dbUtils.executeQuery(sql, params);
	}
}
