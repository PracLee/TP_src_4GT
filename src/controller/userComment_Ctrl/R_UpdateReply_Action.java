package controller.userComment_Ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.reply.ReplyDAO;
import model.reply.ReplyVO;

public class R_UpdateReply_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();

		// VO DAO �ν��Ͻ�ȭ
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyVO replyVO = new ReplyVO();

		// DAO���� �ʿ䵥���� SET
		replyVO.setRnum(Integer.parseInt(request.getParameter("rnum")));
		replyVO.setRment(request.getParameter("rment"));


		String path = null; // uri���� �ʱ�ȭ

		//DAO ����
		if(replyDAO.UpdateDB(replyVO)) {
			// [����¡ó�� �޼���] ȣ�� (uri ��ȯ)
			path = new Post_Action().paging(request.getParameter("r_post"));
			path += "#pcmsg"+request.getParameter("index");
		}
		// �ݿ� ���� -> ���� ����
		else {
			try {
				throw new Exception("R_UpdateReply_Action ���� �߻�!");
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}


		// ���� ����
		forward.setRedirect(false); // sendRedirect
		forward.setPath(path);



		return forward;
	}

}