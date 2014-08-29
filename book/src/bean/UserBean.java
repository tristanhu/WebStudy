package bean;

public class UserBean {
	private String username;
	private String userpass;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public int check() {
		if (username.equals("zhangsan") && userpass.equals("wangwu"))
			return 0;
		else if (username.equals("wangwu") && userpass.equals("zhangsan"))
			return 1;
		else
			return -1;
	}

	public int getResult() {
		return check();
	}

	public boolean validate(String userid, String userpass2) {
		return userid.equals("zhangsan");
	}
}