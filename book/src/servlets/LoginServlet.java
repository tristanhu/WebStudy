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
		// ��ȡ�û�������û�ID�Ϳ���
		String userid = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		// ����ģ�Ͷ���
		UserBean user = new UserBean();
		// ����ҵ�񷽷�������֤
		boolean b = true;//user.validate(userid, userpass);
		// Ҫת����ļ�
		String forward;
		// �����¼�ɹ����Ͱ��û���д��session�У�����ת��success.jsp��
		// ����ת��failure.jsp
		if (b) {
			// Ŀ��ת���ļ���success.jsp
			forward = "success.jsp";
		} else {
			// Ŀ��ת���ļ���failure.jsp
			forward = "login_failure.jsp";
		}
		// ��ȡDispatcher ����
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		// �����ת
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}