package bean;

public class Student {
	private String id;
	private String name;
	private String sex;
	private String class_id;
	private double grade;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public Student() {
		super();
	}
	public Student(String id, String name, String sex, String class_id,
			double grade) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.class_id = class_id;
		this.grade = grade;
	}
	
}
