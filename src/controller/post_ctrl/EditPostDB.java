package controller.post_ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.post.PostDAO;
import model.post.PostVO;

public class EditPostDB implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostVO PVO = new PostVO();
		PostDAO PDAO = new PostDAO();
		PVO.setPnum(Integer.parseInt(request.getParameter("pnum")));
		PVO.setCategory(request.getParameter("category"));
		PVO.setTitle(request.getParameter("title"));
		PVO.setPlike(Integer.parseInt(request.getParameter("plike")));
		PVO.setContent(request.getParameter("content"));
		if (PDAO.UpdateDB(PVO)) {
			action.setPath("main.jsp");
			action.setRedirect(false);
		} else {
			try {
				throw new Exception("UpdateDB 오류발생!");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return action;
	}
	
}
