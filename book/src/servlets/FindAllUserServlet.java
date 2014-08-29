package servlets;

import javax.servlet.*;
import javax.servlet.http.*;

import bean.UserBean;

import java.io.*;
import java.util.*;

public class FindAllUserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// ����ģ�Ͷ���
		UserBean user = new UserBean();
		try {
			// ����ҵ�񷽷��õ������û��б�
			ArrayList userlist = user.findAllUser();
			// ���浽request��
			request.setAttribute("userlist", userlist);
			// ת����ʾ����
			RequestDispatcher rd = request.getRequestDispatcher("userlist.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// �����ĵ�����
			response.setContentType("text/html;charset=gb2312");
			// ��ȡ���������
			PrintWriter out = response.getWriter();
			// ����쳣��Ϣ
			out.println(e.toString());
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}
}