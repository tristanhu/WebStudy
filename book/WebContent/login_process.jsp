<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--创建UserBean对象，并实例化-->
<jsp:useBean id="user" class="bean.UserBean" scope="request" />
<!--为JavaBean的属性赋值-->
<jsp:setProperty name="user" property="*" />
<!--获取JavaBean的计算结果，并保存-->
<c:set var="result" scope="page">
	<jsp:getProperty name="user" property="result" />
</c:set>
<!--如果登录失败-->
<c:if test="${result==-1}">
	<jsp:forward page="login_failure.jsp" />
</c:if>
<!--如果是普通用户-->
<c:if test="${result==0}">
	<c:set var="username" value="${param.username}" scope="session" />
	<c:set var="degree" value="0" scope="session" />
	<jsp:forward page="login_success.jsp" />
</c:if>
<!--如果是管理员-->
<c:if test="${result==1}">
	<c:set var="username" value="${param.username}" scope="session" />
	<c:set var="degree" value="1" scope="session" />
	<jsp:forward page="login_success.jsp" />
</c:if>