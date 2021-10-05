package controller.userComment_Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.comments.CommentsDAO;
import model.comments.CommentsVO;

public class C_EditComment_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		// VO DAO 인스턴스화
	    CommentsVO commentVO = new CommentsVO();
	    CommentsDAO commentDAO = new CommentsDAO();
	    
	    
	    // DAO수행 필요데이터 SET
	    commentVO.setCment(request.getParameter("cment"));
	    commentVO.setCnum(Integer.parseInt(request.getParameter("cnum")));
	    
	    
		String path = null; // uri변수 초기화
	    
	    //DAO 수행
	    // 댓글 수정 완료 --> showPost이동
	    if (commentDAO.UpdateDB(commentVO)) {
			// [페이징처리 메서드] 호출 (uri 반환)
	    	path = new Post_Action().paging(request.getParameter("c_post"));
			path += "#pcmsg"+request.getParameter("pcmsg");
	    	
	    }
	    // 반영 실패 -> 오류 수행
	    else {
	    	try {
				throw new Exception("C_EditComment_Action 오류 발생!");
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
	    }
	    
	    
	    // 전송 설정
	    forward.setRedirect(false); // sendRedirect
	    forward.setPath(path);
	    
	    return forward;
	}

}
