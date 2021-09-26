package controller.post_ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import model.likeInfo.LikeInfoDAO;
import model.likeInfo.LikeInfoVO;
import model.post.PostDAO;
import model.post.PostVO;
import model.userInfo.UserInfoVO;

public class SelectOneAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostDAO PDAO = new PostDAO();
		PostVO PVO = new PostVO();
		UserInfoVO UVO = new UserInfoVO();
		LikeInfoVO LVO = new LikeInfoVO();
		LikeInfoDAO LDAO = new LikeInfoDAO();
		if(request.getParameter("pnum")!=null) {
			PVO.setPnum(Integer.parseInt(request.getParameter("pnum"))); // pnum값으로 찾는거니 Pnum만 세팅 후 넘겨줌
		}
		/*if (PDAO.ViewsUp(PVO)) { // 포스트를 볼때 view 업 -> Model 트랜잭션 처리
			request.setAttribute("singlePost", PDAO.SelectOne(PVO));
		} else {
			throw new Exception("ViewUp 오류 발생!");
		}*/
		request.setAttribute("singlePost", PDAO.SelectOne(PVO));
		request.setAttribute("likeInfo", false); // 사용자가 지금 보는글에 좋아요를 눌렀는지 확인하는 값 디폴트 false
		HttpSession session = request.getSession();
		if (session.getAttribute("userInfoData") != null) {
			UVO = (UserInfoVO) session.getAttribute("userInfoData"); // 로그인 정보 있으면 좋아요를 눌렀는지 체크
			String ID = UVO.getId();
			int pnum = Integer.parseInt(request.getParameter("pnum"));
			LVO.setL_post(pnum);
			LVO.setL_user(ID);
			request.setAttribute("likeInfo", LDAO.SelectOne(LVO)); // 좋아요 정보
		}
		action.setPath("selectOne.ucdo");
		action.setRedirect(false);
		return action;
	}

}
