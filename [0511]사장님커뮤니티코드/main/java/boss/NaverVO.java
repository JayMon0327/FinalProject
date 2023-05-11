package com.mat.zip.boss;

public class NaverVO {
	private String email;
	private String nickname;
	private String age;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "NaverVO [email=" + email + ", nickname=" + nickname + ", age=" + age + "]";
	}
}
