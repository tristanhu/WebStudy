<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="text" value="${param.username}" />
<input type="text" value="${param.userpass}" />
<c:if
	test="${param.username==\"zhangsan\" && param.userpass==\"wangwu\"}">
	<c:set var="username" value="${param.username}" scope="session"></c:set>
	<jsp:forward page="login_success.jsp">
		<jsp:param name="username" value="${param.username}" />
	</jsp:forward>
</c:if>
<c:if
	test="${param.username!=\"zhangsan\" || param.userpass!=\"wangwu\"}">
	<jsp:forward page="login_failure.jsp">
		<jsp:param name="user" value="${param.username}" />
		<jsp:param name="pwd" value="${param.userpass}" />
	</jsp:forward>
</c:if>
