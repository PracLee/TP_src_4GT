package controller.userComment_Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.reply.ReplyDAO;
import model.reply.ReplyVO;

public class R_DeleteReply_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		// VO DAO 인스턴스화
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyVO replyVO = new ReplyVO();
		
	    // DAO수행 필요데이터 SET
		replyVO.setRnum(Integer.parseInt(request.getParameter("rnum")));
		replyVO = replyDAO.SelectOne(replyVO);
		
		
		//String path = null; // uri변수 초기화
		
	    //DAO 수행
		if(replyDAO.DeleteDB(replyVO)) {
			
		    // 변경) ajax데이터 전달
		 	    response.setContentType("text/html; charset=UTF-8"); 
		 		PrintWriter out=response.getWriter();
		 	    out.println("true"); // ajax 객체 전달
		 	    
		 	    
			/* 전 // [페이징처리 메서드] 호출 (uri 반환)
	    	path = new Post_Action().paging(request.getParameter("r_post"));
	    	System.out.println(request.getParameter("r_post")+"replydelete");
			path += "#prmsg"+request.getParameter("prmsg");*/
		}
		// 반영 실패 -> 오류 수행
		else {
		 	try {
				throw new Exception("R_DeleteReply_Action 오류 발생!");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	   /* // 전송 설정
	    forward.setRedirect(false); // sendRedirect
	    forward.setPath(path);
	    
	    
	    
		return forward;*/
		return null;
	}

}
