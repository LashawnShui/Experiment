package bean;

import java.util.ArrayList;

public class User {
	private String nickname;
	private String password;
	private String sex;
	private ArrayList<String> hobby;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public ArrayList<String> getHobby() {
		return hobby;
	}
	public void setHobby(ArrayList<String> hobby) {
		this.hobby = hobby;
	}
	
	public User(String nickname, String password, String sex,
			ArrayList<String> hobby) {
		super();
		this.nickname = nickname;
		this.password = password;
		this.sex = sex;
		this.hobby = hobby;
	}
	public User() {
		super();
		this.hobby = new ArrayList<String>();
	}
	
	@Override
	public String toString() {
		return "User [nickname=" + nickname + ", password=" + password
				+ ", sex=" + sex + ", hobby=" + hobby + "]";
	}
}
