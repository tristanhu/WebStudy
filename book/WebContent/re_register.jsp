<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:requestEncoding value="gb2312" />
<script language="JavaScript">
	function isValidate(form) {
		return false;
		// 得到用户输入的信息
		userid = form.userid.value;
		username = form.username.value;
		userpass = form.userpass.value;
		userpass2 = form.userpass2.value;
		birthday = form.birthday.value;
		email = form.email.value;
		address = form.address.value;
		phone = form.phone.value;
		// 判断用户ID长度
		if (!minLength(userid, 6)) {
			alert("用户ID长度小于6位！");
			form.userid.focus();
			return false;
		}
		if (!maxLength(userid, 8)) {
			alert("用户ID长度大于8位！");
			form.userid.focus();
			return false;
		}
		// 判断用户名长度
		if (!minLength(username, 2)) {
			alert("用户名长度小于2位！");
			form.username.focus();
			return false;
		}
		if (!maxLength(username, 10)) {
			alert("用户名长度大于10位！");
			form.username.focus();
			return false;
		}
		// 判断口令长度
		if (!minLength(userpass, 6)) {
			alert("口令长度小于6位！");
			form.userpass.focus();
			return false;
		}
		if (!maxLength(userpass, 8)) {
			alert("口令长度大于8位！");
			form.userpass.focus();
			return false;
		}
		// 判断用户ID和口令是否相同
		if (userid == userpass) {
			alert("用户ID和口令不能相等！");
			form.userpass.focus();
			return false;
		}
		// 验证两次口令是否相同
		if (userpass != userpass2) {
			alert("两次输入的口令不相同！");
			form.userpass.focus();
			return false;
		}
		// 验证生日的格式是否正确
		if (!isDate(birthday)) {
			alert("生日的格式不正确！");
			form.birthday.focus();
			return false;
		}
		// 验证E-mail 的格式是否正确
		if (!isEmail(email)) {
			alert("E-mail格式不正确！");
			form.email.focus();
			return false;
		}
		// 验证电话号码的格式是否正确
		if (!isDigital(phone)) {
			alert("电话号码的格式不正确");
			form.phone.focus();
			return false;
		}
		// 验证地址的长度是否正确
		if (!maxLength(address, 50)) {
			alert("地址长度大于50位！");
			form.address.focus();
			return false;
		}
		return true;
	}
	// 验证是否是空
	function isNull(str) {
		if (str.length == 0)
			return true;
		else
			return false;
	}
	// 验证是否满足最小长度
	function minLength(str, length) {
		if (str.length >= length)
			return true;
		else
			return false;
	}
	// 判断是否满足最大长度
	function maxLength(str, length) {
		if (str.length <= length)
			return true;
		else
			return false;
	}
	// 判断是否是数字
	function isDigital(str) {
		for (i = 0; i < str.length; i++) {
			// 允许使用连字符
			if (str.charAt(i) >= '0' && str.charAt(i) <= '9'
					|| str.charAt(i) == '-' && i != 0 && i != str.length - 1)
				continue;
			else
				return false;
		}
		return true;
	}
	// 判断是否是整数
	function isNumber(str) {
		for (i = 0; i < str.length; i++) {
			// 每一位都是0～9的数字，如果是第1位，则可以是“-”号
			if (str.charAt(i) >= '0' && str.charAt(i) <= '9'
					|| str.charAt(i) == '-' && i == 0)
				continue;
			else
				return false;
		}
		return true;
	}
	// 判断是否是日期，日期的格式为1988-1-1
	function isDate(date) {
		// 查找分隔符
		index1 = date.indexOf("-");
		// 如果分隔符不存在，则不是合法的时间
		if (index1 == -1)
			return false;
		// 获取时间中的年
		year = date.substring(0, index1);
		// 获取时间中的剩下部分
		date = date.substring(index1 + 1);
		// 查找第二个分隔符
		index1 = date.indexOf("-");
		// 如果不存在第二个分隔符，则不是合法的时间
		if (index1 == -1)
			return false;
		// 获取时间中的月份
		month = date.substring(0, index1);
		// 获取时间中的日
		day = date.substring(index1 + 1);
		// 判断是否是数字，如果不是，则不是合法的时间
		if (isNumber(year) && isNumber(month) && isNumber(day)) {
			// 判断基本范围
			if (year<1900 || year>9999 || month<1 || month >12 || day < 1)
				return false;
			// 判断31天的月
			if ((month == 1 || month == 3 || month == 5 || month == 7
					|| month == 8 || month == 10 || month == 12)
					&& day > 31)
				return false;
			// 判断30天的月
			if ((month == 4 || month == 6 || month == 9 || month == 11)
					&& day > 30)
				return false;
			// 如果是2月，判断是否为闰年
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
	// 判断是否是E-mail
	function isEmail(email) {
		if (email.length == 0)
			return false;
		index1 = email.indexOf('@');
		index2 = email.indexOf('.');
		if (index1 < 1 // @符号不存在，或者在第一个位置
				|| index2 < 1 // .符号不存在，或者在第一个位置
				|| index2 - index1 < 2 // .在@的左边或者相邻
				|| index2 + 1 == email.length) // .符号后面没有东西
			return false
		else
			return true;
	}
</script>
<html>
<head>
<title>修改注册信息</title>
</head>
<body>
	<h2 align="center">请修改注册信息</h2>
	<form name="form1" action="register_confirm.jsp" method="post"
		onsubmit="return isValidate(form1)">
		<table align="center">
			<tr>
				<td>用户ID：</td>
				<td><input type="text" name="userid" value="${param.userid}">
				</td>
			</tr>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username"
					value="${param.username}"></td>
			</tr>
			<tr>
				<td>口令：</td>
				<td><input type="password" name="userpass"
					value="${param.userpass}"></td>
			</tr>
			<tr>
				<td>确认口令：</td>
				<td><input type="password" name="userpass2"
					value="${param.userpass}"></td>
			</tr>
			<tr>
				<td>生日：</td>
				<td><input type="text" name="birthday"
					value="${param.birthday}"> 格式为：1988-1-1</td>
			</tr>
			<tr>
				<td>学历：</td>
				<td><input type="radio" name="degree" value="专科"
					<c:if test="${param.degree == \"专科\"}">checked</c:if>>专科 <input
					type="radio" name="degree" value="本科"
					<c:if test="${param.degree == \"本科\"}">checked</c:if>>本科 <input
					type="radio" name="degree" value="硕士研究生"
					<c:if test="${param.degree == \"硕士\"}">checked</c:if>>硕士 <input
					type="radio" name="degree" value="博士研究生"
					<c:if test="${param.degree == \"博士\"}">checked</c:if>>博士 <input
					type="radio" name="degree" value="其他"
					<c:if test="${param.degree == \"其他\"}">checked</c:if>>其他</td>
			</tr>
			<tr>
				<td>地区：</td>
				<td><select name="local">
						<option value="华东">华东</option>
						<option value="华南"
							<c:if test="${param.local == \"华南\"}">selected</c:if>>华南</option>
						<option value="华北"
							<c:if test="${param.local == \"华北\"}">selected</c:if>>华北</option>
						<option value="东南"
							<c:if test="${param.local == \"东南\"}">selected</c:if>>东南</option>
						<option value="西南"
							<c:if test="${param.local == \"西南\"}">selected</c:if>>西南</option>
						<option value="西北"
							<c:if test="${param.local == \"西北\"}">selected</c:if>>西北</option>
						<option value="东北"
							<c:if test="${param.local == \"东北\"}">selected</c:if>>东北</option>
						<option value="华中"
							<c:if test="${param.local == \"华中\"}">selected</c:if>>华中</option>
				</select></td>
			</tr>
			<tr>
				<td>E-mail:</td>
				<td><input type="text" name="email" value="${param.email}"></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td><input type="text" name="address" value="${param.address}"></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td><input type="text" name="phone" value="${param.phone}"></td>
			</tr>
			<tr>
				<td>备注：</td>
				<td><textarea rows="8" name="comment" cols="40">
${param.comment}
</textarea></td>
			</tr>
			<tr>
				<td><input type="reset" value="重置"></td>
				<td><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>
</body>
</html>