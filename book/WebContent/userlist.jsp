<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2 align=center>
	�����û���Ϣ
	<h2>
		<table align=center>
			<tr>
				<th>�û����</th>
				<th>�û���</th>
				<th>�û�����</th>
				<th>����</th>
				<th>ѧ��</th>
				<th>����</th>
				<th>Email</th>
				<th>��ַ</th>
			</tr>
			<c:forEach items="${userlist}" var="user">
				<tr>
					<td>${user.userid}</td>
					<td>${user.username}</td>
					<td><c:if test="${user.type==0}">��ͨ�û�</c:if> <c:if
							test="${user.type==1}">����Ա</c:if></td>
					<td>${user.birthday}</td>
					<td>${user.degree}</td>
					<td>${user.local}</td>
					<td>${user.email}</td>
					<td>${user.address}</td>
				</tr>
			</c:forEach>
		</table>