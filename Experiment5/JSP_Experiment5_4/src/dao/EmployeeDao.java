package dao;

import java.util.ArrayList;

import bean.Employee;

import utils.DBUtils;

public class EmployeeDao {
	static DBUtils dbUtils = new DBUtils();
	
	//��ѯȫ����Ա����Ϣ
	public ArrayList<Employee> selectAll() {
		String sql = "select * from employee;";
		return dbUtils.executeQuery(sql);
	}
	//���Ա����Ϣ
	public int insertEmployee(Employee employee) {
		String sql = "insert into employee values(null,?,?,?,?);";
		Object[] params = {employee.getEmp_name(), employee.getJob(), employee.getSalary(), employee.getDept()};
		return dbUtils.executeUpdate(sql, params);
	}
	//�޸�Ա����Ϣ
	public int updateEmployee(Employee employee) {
		String sql = "update employee set emp_name=?,job=?,salary=?,dept=? where emp_id=?;";
		Object[] params = {employee.getEmp_name(), employee.getJob(), employee.getSalary(), employee.getDept(), employee.getEmp_id()};
		return dbUtils.executeUpdate(sql, params);
	}
	//����emp_id��ֵɾ��Ա����Ϣ
	public int deleteById(int emp_id) {
		String sql = "delete from employee where emp_id=?;";
		Object[] params = {emp_id};
		return dbUtils.executeUpdate(sql, params);
	}
	//����emp_id��ֵ��ѯԱ����Ϣ
		public Employee selectById(int emp_id) {
			String sql = "select * from employee where emp_id=?;";
			Object[] params = {emp_id};
			ArrayList<Employee> employees = dbUtils.executeQuery(sql, params);
			if(employees.size() > 0) {
				return employees.get(0);
			}
			return null;
		}
	//����job��ֵ��ѯԱ����Ϣ
	public ArrayList<Employee> selectByJob(String job) {
		String sql = "select * from employee where job=?;";
		Object[] params = {job};
		return dbUtils.executeQuery(sql, params);
	}
}
