package controller.userComment_Ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.userInfo.UserInfoDAO;
import model.userInfo.UserInfoVO;

public class U_InfoHelp_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();

		// VO DAO 인스턴스화
		UserInfoVO userInfoVO = new UserInfoVO();
		UserInfoDAO userInfoDAO = new UserInfoDAO();

		// DAO수행 필요데이터 SET
		userInfoVO.setId(request.getParameter("id")+"@"+request.getParameter("mail"));
		System.out.println(request.getParameter("id")+"@"+request.getParameter("mail"));
		// DAO 수행
		userInfoVO = userInfoDAO.Find(userInfoVO);
		System.out.println(userInfoVO+"11");
		// response 전달 --- findUser
		request.setAttribute("findUser", userInfoVO);

		// ID찾기 --> view 반환 -> 객체 userInfo
		if(request.getParameter("type").equals("id")) {

			// informID 페이지 전송
			forward.setPath("informID.jsp");
		}
		// PW찾기 --> view 반환 == 객체 userInfo
		else if (request.getParameter("type").equals("pw")) {

			// informPW 페이지 전송
			forward.setPath("informPW.jsp");
		}
		
		
		// 페이지 전송설정
		forward.setRedirect(false); // forward

		
		return forward;
	}

}
