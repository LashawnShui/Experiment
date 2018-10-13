package bean;

public class Employee {
	private int emp_id;
	private String emp_name;
	private String job;
	private double salary;
	private int dept;
	
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public int getDept() {
		return dept;
	}
	public void setDept(int dept) {
		this.dept = dept;
	}
	
	public Employee() {
		super();
	}
	public Employee(int emp_id, String emp_name, String job, double salary,
			int dept) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.job = job;
		this.salary = salary;
		this.dept = dept;
	}
	
	@Override
	public String toString() {
		return "Employee [emp_id=" + emp_id + ", emp_name=" + emp_name
				+ ", job=" + job + ", salary=" + salary + ", dept=" + dept
				+ "]";
	}
}
