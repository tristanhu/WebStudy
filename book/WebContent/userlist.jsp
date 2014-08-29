<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2 align=center>
	所有用户信息
	<h2>
		<table align=center>
			<tr>
				<th>用户编号</th>
				<th>用户名</th>
				<th>用户类型</th>
				<th>生日</th>
				<th>学历</th>
				<th>地区</th>
				<th>Email</th>
				<th>地址</th>
			</tr>
			<c:forEach items="${userlist}" var="user">
				<tr>
					<td>${user.userid}</td>
					<td>${user.username}</td>
					<td><c:if test="${user.type==0}">普通用户</c:if> <c:if
							test="${user.type==1}">管理员</c:if></td>
					<td>${user.birthday}</td>
					<td>${user.degree}</td>
					<td>${user.local}</td>
					<td>${user.email}</td>
					<td>${user.address}</td>
				</tr>
			</c:forEach>
		</table>