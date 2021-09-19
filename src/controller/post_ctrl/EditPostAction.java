package controller.post_ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import model.post.PostDAO;
import model.post.PostVO;
import model.userInfo.UserInfoVO;

public class EditPostAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostVO PVO = new PostVO();
		PostDAO PDAO = new PostDAO();
		UserInfoVO UVO = new UserInfoVO();
		HttpSession session = request.getSession();
		PVO.setCategory(request.getParameter("category"));
		PVO.setContent(request.getParameter("content"));
		UVO = (UserInfoVO) session.getAttribute("userInfoData"); // 이름은 세션에서 VO로 저장된 UserInfoVO 사용!
		PVO.setWriter(UVO.getName()); // name
		PVO.setP_user(UVO.getId()); // ID
		PVO.setTitle(request.getParameter("title"));
		PVO.setPlike(Integer.parseInt(request.getParameter("plike")));
		request.setAttribute("PostVO", PVO); // 수정 정보를 담은 PostVO 를 PostVO로 넘겨줌
		action.setPath("EditPost.jsp");
		action.setRedirect(false);
		return action;
	}

}
