package servlets;

import javax.servlet.*;
import javax.servlet.http.*;

import bean.UserBean;

import java.io.*;
import java.util.*;

public class FindAllUserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 创建模型对象
		UserBean user = new UserBean();
		try {
			// 调用业务方法得到所有用户列表
			ArrayList userlist = user.findAllUser();
			// 保存到request中
			request.setAttribute("userlist", userlist);
			// 转向显示界面
			RequestDispatcher rd = request.getRequestDispatcher("userlist.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// 设置文档类型
			response.setContentType("text/html;charset=gb2312");
			// 获取输出流对象
			PrintWriter out = response.getWriter();
			// 输出异常信息
			out.println(e.toString());
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}
}