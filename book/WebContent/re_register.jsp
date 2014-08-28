<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:requestEncoding value="gb2312" />
<script language="JavaScript">
	function isValidate(form) {
		return false;
		// �õ��û��������Ϣ
		userid = form.userid.value;
		username = form.username.value;
		userpass = form.userpass.value;
		userpass2 = form.userpass2.value;
		birthday = form.birthday.value;
		email = form.email.value;
		address = form.address.value;
		phone = form.phone.value;
		// �ж��û�ID����
		if (!minLength(userid, 6)) {
			alert("�û�ID����С��6λ��");
			form.userid.focus();
			return false;
		}
		if (!maxLength(userid, 8)) {
			alert("�û�ID���ȴ���8λ��");
			form.userid.focus();
			return false;
		}
		// �ж��û�������
		if (!minLength(username, 2)) {
			alert("�û�������С��2λ��");
			form.username.focus();
			return false;
		}
		if (!maxLength(username, 10)) {
			alert("�û������ȴ���10λ��");
			form.username.focus();
			return false;
		}
		// �жϿ����
		if (!minLength(userpass, 6)) {
			alert("�����С��6λ��");
			form.userpass.focus();
			return false;
		}
		if (!maxLength(userpass, 8)) {
			alert("����ȴ���8λ��");
			form.userpass.focus();
			return false;
		}
		// �ж��û�ID�Ϳ����Ƿ���ͬ
		if (userid == userpass) {
			alert("�û�ID�Ϳ������ȣ�");
			form.userpass.focus();
			return false;
		}
		// ��֤���ο����Ƿ���ͬ
		if (userpass != userpass2) {
			alert("��������Ŀ����ͬ��");
			form.userpass.focus();
			return false;
		}
		// ��֤���յĸ�ʽ�Ƿ���ȷ
		if (!isDate(birthday)) {
			alert("���յĸ�ʽ����ȷ��");
			form.birthday.focus();
			return false;
		}
		// ��֤E-mail �ĸ�ʽ�Ƿ���ȷ
		if (!isEmail(email)) {
			alert("E-mail��ʽ����ȷ��");
			form.email.focus();
			return false;
		}
		// ��֤�绰����ĸ�ʽ�Ƿ���ȷ
		if (!isDigital(phone)) {
			alert("�绰����ĸ�ʽ����ȷ");
			form.phone.focus();
			return false;
		}
		// ��֤��ַ�ĳ����Ƿ���ȷ
		if (!maxLength(address, 50)) {
			alert("��ַ���ȴ���50λ��");
			form.address.focus();
			return false;
		}
		return true;
	}
	// ��֤�Ƿ��ǿ�
	function isNull(str) {
		if (str.length == 0)
			return true;
		else
			return false;
	}
	// ��֤�Ƿ�������С����
	function minLength(str, length) {
		if (str.length >= length)
			return true;
		else
			return false;
	}
	// �ж��Ƿ�������󳤶�
	function maxLength(str, length) {
		if (str.length <= length)
			return true;
		else
			return false;
	}
	// �ж��Ƿ�������
	function isDigital(str) {
		for (i = 0; i < str.length; i++) {
			// ����ʹ�����ַ�
			if (str.charAt(i) >= '0' && str.charAt(i) <= '9'
					|| str.charAt(i) == '-' && i != 0 && i != str.length - 1)
				continue;
			else
				return false;
		}
		return true;
	}
	// �ж��Ƿ�������
	function isNumber(str) {
		for (i = 0; i < str.length; i++) {
			// ÿһλ����0��9�����֣�����ǵ�1λ��������ǡ�-����
			if (str.charAt(i) >= '0' && str.charAt(i) <= '9'
					|| str.charAt(i) == '-' && i == 0)
				continue;
			else
				return false;
		}
		return true;
	}
	// �ж��Ƿ������ڣ����ڵĸ�ʽΪ1988-1-1
	function isDate(date) {
		// ���ҷָ���
		index1 = date.indexOf("-");
		// ����ָ��������ڣ����ǺϷ���ʱ��
		if (index1 == -1)
			return false;
		// ��ȡʱ���е���
		year = date.substring(0, index1);
		// ��ȡʱ���е�ʣ�²���
		date = date.substring(index1 + 1);
		// ���ҵڶ����ָ���
		index1 = date.indexOf("-");
		// ��������ڵڶ����ָ��������ǺϷ���ʱ��
		if (index1 == -1)
			return false;
		// ��ȡʱ���е��·�
		month = date.substring(0, index1);
		// ��ȡʱ���е���
		day = date.substring(index1 + 1);
		// �ж��Ƿ������֣�������ǣ����ǺϷ���ʱ��
		if (isNumber(year) && isNumber(month) && isNumber(day)) {
			// �жϻ�����Χ
			if (year<1900 || year>9999 || month<1 || month >12 || day < 1)
				return false;
			// �ж�31�����
			if ((month == 1 || month == 3 || month == 5 || month == 7
					|| month == 8 || month == 10 || month == 12)
					&& day > 31)
				return false;
			// �ж�30�����
			if ((month == 4 || month == 6 || month == 9 || month == 11)
					&& day > 30)
				return false;
			// �����2�£��ж��Ƿ�Ϊ����
			if (month == 2) {
				if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
					if (day > 29)
						return false;
				} else {
					if (day > 28)
						return false;
				}
			}
		} else
			return false;
		return true;
	}
	// �ж��Ƿ���E-mail
	function isEmail(email) {
		if (email.length == 0)
			return false;
		index1 = email.indexOf('@');
		index2 = email.indexOf('.');
		if (index1 < 1 // @���Ų����ڣ������ڵ�һ��λ��
				|| index2 < 1 // .���Ų����ڣ������ڵ�һ��λ��
				|| index2 - index1 < 2 // .��@����߻�������
				|| index2 + 1 == email.length) // .���ź���û�ж���
			return false
		else
			return true;
	}
</script>
<html>
<head>
<title>�޸�ע����Ϣ</title>
</head>
<body>
	<h2 align="center">���޸�ע����Ϣ</h2>
	<form name="form1" action="register_confirm.jsp" method="post"
		onsubmit="return isValidate(form1)">
		<table align="center">
			<tr>
				<td>�û�ID��</td>
				<td><input type="text" name="userid" value="${param.userid}">
				</td>
			</tr>
			<tr>
				<td>�û�����</td>
				<td><input type="text" name="username"
					value="${param.username}"></td>
			</tr>
			<tr>
				<td>���</td>
				<td><input type="password" name="userpass"
					value="${param.userpass}"></td>
			</tr>
			<tr>
				<td>ȷ�Ͽ��</td>
				<td><input type="password" name="userpass2"
					value="${param.userpass}"></td>
			</tr>
			<tr>
				<td>���գ�</td>
				<td><input type="text" name="birthday"
					value="${param.birthday}"> ��ʽΪ��1988-1-1</td>
			</tr>
			<tr>
				<td>ѧ����</td>
				<td><input type="radio" name="degree" value="ר��"
					<c:if test="${param.degree == \"ר��\"}">checked</c:if>>ר�� <input
					type="radio" name="degree" value="����"
					<c:if test="${param.degree == \"����\"}">checked</c:if>>���� <input
					type="radio" name="degree" value="˶ʿ�о���"
					<c:if test="${param.degree == \"˶ʿ\"}">checked</c:if>>˶ʿ <input
					type="radio" name="degree" value="��ʿ�о���"
					<c:if test="${param.degree == \"��ʿ\"}">checked</c:if>>��ʿ <input
					type="radio" name="degree" value="����"
					<c:if test="${param.degree == \"����\"}">checked</c:if>>����</td>
			</tr>
			<tr>
				<td>������</td>
				<td><select name="local">
						<option value="����">����</option>
						<option value="����"
							<c:if test="${param.local == \"����\"}">selected</c:if>>����</option>
						<option value="����"
							<c:if test="${param.local == \"����\"}">selected</c:if>>����</option>
						<option value="����"
							<c:if test="${param.local == \"����\"}">selected</c:if>>����</option>
						<option value="����"
							<c:if test="${param.local == \"����\"}">selected</c:if>>����</option>
						<option value="����"
							<c:if test="${param.local == \"����\"}">selected</c:if>>����</option>
						<option value="����"
							<c:if test="${param.local == \"����\"}">selected</c:if>>����</option>
						<option value="����"
							<c:if test="${param.local == \"����\"}">selected</c:if>>����</option>
				</select></td>
			</tr>
			<tr>
				<td>E-mail:</td>
				<td><input type="text" name="email" value="${param.email}"></td>
			</tr>
			<tr>
				<td>��ַ��</td>
				<td><input type="text" name="address" value="${param.address}"></td>
			</tr>
			<tr>
				<td>�绰��</td>
				<td><input type="text" name="phone" value="${param.phone}"></td>
			</tr>
			<tr>
				<td>��ע��</td>
				<td><textarea rows="8" name="comment" cols="40">
${param.comment}
</textarea></td>
			</tr>
			<tr>
				<td><input type="reset" value="����"></td>
				<td><input type="submit" value="�ύ"></td>
			</tr>
		</table>
	</form>
</body>
</html>