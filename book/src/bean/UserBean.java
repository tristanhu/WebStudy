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
		// ���Ӷ���
		Connection con = null;
		// ������
		Statement stmt = null;
		// ���������
		ResultSet rs = null;
		// ��ѯ���
		String sql = "select * from usertable";
		// �������ݿ��URL
		String url = "jdbc:mysql://127.0.0.1:3306/bookstore";
		// �û���
		String dbuser = "root";
		// ����
		String dbpass = "hujinguang.1";
		try {
			// �����������򣬲������������������
			Class.forName("com.mysql.jdbc.Driver");
			// �������ӣ���һ��������url��
			// �ڶ������û������������ǿ���
			con = DriverManager.getConnection(url, dbuser, dbpass);
			// ����������
			stmt = con.createStatement();
			// ִ��select ��䣬���ؽ��������
			rs = stmt.executeQuery(sql);
			// �Խ�������б���
			while (rs.next()) {
				// ��ȡ������е���Ϣ
				String tmpUserid = rs.getString(1);
				String tmpUsername = rs.getString(2);
				// ���б���ת��
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
				// �����û�����
				UserBean user = new UserBean();
				// ���ݻ�ȡ���û���Ϣ��ʼ���û�����
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
				// �Ѷ�����ӵ�������
				userlist.add(user);
			}
		} catch (Exception e) {
		} finally {
			// �رն����˳��rs stmt con
			// �봴�������˳���෴
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
		// ���ز�ѯ�������ж���
		return userlist;
	}
}