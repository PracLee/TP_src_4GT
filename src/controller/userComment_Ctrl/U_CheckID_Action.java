package controller.userComment_Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.reply.ReplyDAO;
import model.userInfo.UserInfoDAO;

public class U_CheckID_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		// DAO �ν��Ͻ�ȭ
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		//DAO ���� ��JS�� ��������
		if(userInfoDAO.CheckID(request.getParameter("id")+"@"+request.getParameter("mail"))){
			out.println("true");
			out.println("<script>alert('��� ������ ���̵��Դϴ�.'); history.go(-1);</script>");
			
		}
		// �ݿ� ���� -> ���� ����
		else { 
			out.println("false");
			out.println("<script>alert('�̹� ������� ���̵��Դϴ�.'); history.go(-1);</script>");
		}
		
		// �̵���� ����
		return null;
	}

}