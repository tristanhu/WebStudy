<%@ page contentType="text/html"%>
<%@ page pageEncoding="gb2312"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="gb2312" />
<html>
<head>
<title>ע����Ϣȷ��</title>
</head>
<body>
	<h2 align="center">ע����Ϣȷ��</h2>
	<table border="1" align="center">
		<tr>
			<td>�û�ID</td>
			<td>${param.userid} -- ${sessionScope.userid} </td>
		</tr>
		<tr>
			<td>�û���</td>
			<td>${param.username}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${param.userpass}</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>${param.email}</td>
		</tr>
		<tr>
			<td>�绰</td>
			<td>${param.phone}</td>
		</tr>
		<tr>
			<td>��ַ</td>
			<td>${param.address}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${param.birthday}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${param.local}</td>
		</tr>
		<tr>
			<td>ѧ��</td>
			<td>${param.degree}</td>
		</tr>
		<tr>
			<td>��ע</td>
			<td>${param.comment}</td>
		</tr>
		<tr>
			<form name="form1" action="" method="post">
				<input type="hidden" name="userid" value="${param.userid}">
				<input type="hidden" name="username" value="${param.username}">
				<input type="hidden" name="userpass" value="${param.userpass}">
				<input type="hidden" name="local" value="${param.local}"> <input
					type="hidden" name="phone" value="${param.phone}"> <input
					type="hidden" name="email" value="${param.email}"> <input
					type="hidden" name="address" value="${param.address}"> <input
					type="hidden" name="comment" value="${param.comment}"> <input
					type="hidden" name="birthday" value="${param.birthday}"> <input
					type="hidden" name="degree" value="${param.degree}">
				<td><input type="button" name="action1" value="ȷ��"
					onclick="this.form.action='success.jsp';this.form.submit();"></td>
				<td><input type="button" name="action1" value="�޸�"
					onclick="this.form.action='re_register.jsp';this.form.submit();"></td>
			</form>
		</tr>
	</table>
</body>
</html>