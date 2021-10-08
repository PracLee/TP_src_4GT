package controller.userComment_Ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import model.post.PostDAO;
import model.post.PostVO;
import model.userInfo.UserInfoVO;

public class U_Mypage_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostVO PVO = new PostVO();
		PostDAO PDAO = new PostDAO();
		HttpSession session = request.getSession();
		UserInfoVO UVO = (UserInfoVO)session.getAttribute("UserInfoData");
		String id = UVO.getId();
		//ArrayList<PostVO> datas = PDAO.selectLikePost(id);
		
		
		
		return action;
	}

}
