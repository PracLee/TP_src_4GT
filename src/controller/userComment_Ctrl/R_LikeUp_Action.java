package controller.userComment_Ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.reply.ReplyDAO;
import model.reply.ReplyVO;

public class R_LikeUp_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		// likeCntUp�� �ʿ��� ���� : rnum
		// �������� ���ư������� �ʿ��� ���� : pnum, index
		String pnum = request.getParameter("pnum");
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		
		// DB������Ʈ�� ���� �ʿ��� ����
		ReplyDAO RDAO = new ReplyDAO();
		ReplyVO RVO = new ReplyVO();
		RVO.setRnum(rnum);

		// DB������Ʈ, ����¡ ó��
		String path = null;
		if (RDAO.likeCntUp(RVO)) {
			path = new Post_Action().paging(pnum);
			path += "#prmsg"+request.getParameter("prmsg");

		}
		else {
			try {
				throw new Exception("C_LikeUp_Action �����߻�!");
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		action.setPath(path);
		action.setRedirect(false);
		
		return action;
	}

	
}
