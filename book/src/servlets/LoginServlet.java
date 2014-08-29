package servlets;

import javax.servlet.*;
import javax.servlet.http.*;

import bean.UserBean;

import java.io.*;

public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3535656831747710539L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 获取用户输入的用户ID和口令
		String userid = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		// 创建模型对象
		UserBean user = new UserBean();
		// 调用业务方法进行验证
		boolean b = true;//user.validate(userid, userpass);
		// 要转向的文件
		String forward;
		// 如果登录成功，就把用户名写入session中，并且转向success.jsp，
		// 否则转向failure.jsp
		if (b) {
			// 目标转向文件是success.jsp
			forward = "success.jsp";
		} else {
			// 目标转向文件是failure.jsp
			forward = "login_failure.jsp";
		}
		// 获取Dispatcher 对象
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		// 完成跳转
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}