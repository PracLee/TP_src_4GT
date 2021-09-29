
package controller.userComment_Ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.comments.CommentsDAO;
import model.comments.CommentsVO;

public class C_DeleteComment_Action implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		// VO DAO 인스턴스화
	    CommentsVO commentVO = new CommentsVO();
	    CommentsDAO commentDAO = new CommentsDAO();
	    
	    
	    // DAO수행 필요데이터 SET
	    commentVO.setCnum(Integer.parseInt(request.getParameter("cnum")));
	    commentVO.setC_post(Integer.parseInt(request.getParameter("c_post"))); // 트랜잭션 쿼리문 수행 위함
	    
	    //DAO 수행
	    // 댓글 삭제 완료
	    if (commentDAO.DeleteDB(commentVO)) {
	    	String parameter = "?pnum="+request.getParameter("c_post"); // parameter 추가
	    	forward.setRedirect(false); // forward
	    	forward.setPath("selectOne.pdo"+parameter); // post 컨트롤러에게 페이지 요청(ShowList(단일 게시물)이동)
	    }
	    // 반영 실패 -> 오류 수행
	    else {
	    	try {
				throw new Exception("C_DeleteComment_Action 오류 발생!");
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
	    }
	    
	    return forward;
	}
}
