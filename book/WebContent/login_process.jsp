<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--����UserBean���󣬲�ʵ����-->
<jsp:useBean id="user" class="bean.UserBean" scope="request" />
<!--ΪJavaBean�����Ը�ֵ-->
<jsp:setProperty name="user" property="*" />
<!--��ȡJavaBean�ļ�������������-->
<c:set var="result" scope="page">
	<jsp:getProperty name="user" property="result" />
</c:set>
<!--�����¼ʧ��-->
<c:if test="${result==-1}">
	<jsp:forward page="login_failure.jsp" />
</c:if>
<!--�������ͨ�û�-->
<c:if test="${result==0}">
	<c:set var="username" value="${param.username}" scope="session" />
	<c:set var="degree" value="0" scope="session" />
	<jsp:forward page="login_success.jsp" />
</c:if>
<!--����ǹ���Ա-->
<c:if test="${result==1}">
	<c:set var="username" value="${param.username}" scope="session" />
	<c:set var="degree" value="1" scope="session" />
	<jsp:forward page="login_success.jsp" />
</c:if>