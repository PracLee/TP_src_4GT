package controller.userComment_Ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.comments.CommentsDAO;
import model.comments.CommentsVO;

public class C_LikeUp_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		// likeCntUp�� �ʿ��� ���� : cnum
		// �������� ���ư������� �ʿ��� ���� : pnum, index
		String pnum = request.getParameter("pnum");
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		// DB������Ʈ�� ���� �ʿ��� ����
		CommentsVO CVO = new CommentsVO();
		CommentsDAO CDAO = new CommentsDAO();
		CVO.setCnum(cnum);

		// DB������Ʈ, ����¡ ó��
		String path = null;
		if (CDAO.likeCntUp(CVO)) {
			path = new Post_Action().paging(pnum);
			path += "#pcmsg"+request.getParameter("index");

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
