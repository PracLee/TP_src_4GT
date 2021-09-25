package controller.post_ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.post.PostDAO;
import model.post.PostVO;

public class LikeUpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostDAO PDAO = new PostDAO();
		PostVO PVO = new PostVO();
		PVO.setPnum(Integer.parseInt(request.getParameter("pnum")));
		if(PDAO.LikesUp(PVO)){
			int pnum = Integer.parseInt(request.getParameter("pnum"));
			request.setAttribute("pnum", pnum);
			action.setPath("selectOne.pdo");
			action.setRedirect(true);
		}else{
			try {
				throw new Exception("LikeUp 오류발생!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return action;
	}

}
