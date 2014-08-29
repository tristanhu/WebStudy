package bean;

import java.util.ArrayList;
import java.sql.*;

public class UserBean {
	private String userid;
	private String username;
	private String userpass;
	private String type = "0";
	private java.util.Date birthday;
	private String degree;
	private String local;
	private String email;
	private String address;
	private String comment;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public java.util.Date getBirthday() {
		return birthday;
	}

	public void setBirthday(java.util.Date birthday) {
		this.birthday = birthday;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCommentt() {
		return comment;
	}

	public void setComment(String content) {
		this.comment = comment;
	}

	public ArrayList findAllUser() {
		ArrayList userlist = new ArrayList();
		// 连接对象
		Connection con = null;
		// 语句对象
		Statement stmt = null;
		// 结果集对象
		ResultSet rs = null;
		// 查询语句
		String sql = "select * from usertable";
		// 连接数据库的URL
		String url = "jdbc:mysql://127.0.0.1:3306/bookstore";
		// 用户名
		String dbuser = "root";
		// 口令
		String dbpass = "hujinguang.1";
		try {
			// 加载驱动程序，参数是驱动程序的名字
			Class.forName("com.mysql.jdbc.Driver");
			// 建立连接，第一个参数是url，
			// 第二个是用户名，第三个是口令
			con = DriverManager.getConnection(url, dbuser, dbpass);
			// 创建语句对象
			stmt = con.createStatement();
			// 执行select 语句，返回结果集对象
			rs = stmt.executeQuery(sql);
			// 对结果集进行遍历
			while (rs.next()) {
				// 获取结果集中的信息
				String tmpUserid = rs.getString(1);
				String tmpUsername = rs.getString(2);
				// 进行编码转换
				tmpUsername = new String(tmpUsername.getBytes("8859_1"));
				String tmpUserpass = rs.getString(3);
				String tmpType = rs.getString(4);
				java.util.Date tmpBirthday = rs.getDate(5);
				String tmpDegree = rs.getString(6);
				tmpDegree = new String(tmpDegree.getBytes("8859_1"));
				String tmpLocal = rs.getString(7);
				tmpLocal = new String(tmpLocal.getBytes("8859_1"));
				String tmpEmail = rs.getString(8);
				String tmpAddress = rs.getString(9);
				tmpAddress = new String(tmpAddress.getBytes("8859_1"));
				String tmpComment = rs.getString(10);
				// 创建用户对象
				UserBean user = new UserBean();
				// 根据获取的用户信息初始化用户对象
				user.setUserid(tmpUserid);
				user.setUsername(tmpUsername);
				user.setUserpass(tmpUserpass);
				user.setType(tmpType);
				user.setBirthday(tmpBirthday);
				user.setDegree(tmpDegree);
				user.setLocal(tmpLocal);
				user.setEmail(tmpEmail);
				user.setAddress(tmpAddress);
				user.setComment(tmpComment);
				// 把对象添加到集合中
				userlist.add(user);
			}
		} catch (Exception e) {
		} finally {
			// 关闭对象的顺序：rs stmt con
			// 与创建对象的顺序相反
			try {
				rs.close();
			} catch (Exception e) {
			}
			try {
				stmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		}
		// 返回查询到的所有对象
		return userlist;
	}
}