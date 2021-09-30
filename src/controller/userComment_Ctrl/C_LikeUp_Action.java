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
		// likeCntUp에 필요한 정보 : cnum
		// 페이지에 돌아가기위해 필요한 정보 : pnum, index
		String pnum = request.getParameter("pnum");
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		// DB업데이트를 위해 필요한 정보
		CommentsVO CVO = new CommentsVO();
		CommentsDAO CDAO = new CommentsDAO();
		CVO.setCnum(cnum);

		// DB업데이트, 페이징 처리
		String path = null;
		if (CDAO.likeCntUp(CVO)) {
			path = new Post_Action().paging(pnum);
			path += "#pcmsg"+request.getParameter("index");

		}
		else {
			try {
				throw new Exception("C_LikeUp_Action 오류발생!");
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
