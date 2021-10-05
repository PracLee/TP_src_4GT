package controller.post_ctrl.post.read;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.post.PostDAO;
import model.post.PostVO;

public class FindPost implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostDAO PDAO = new PostDAO();
		// 검색 값 저장
		String word = request.getParameter("findWord");
		String notFind = "검색 결과 없음";
		// 제목검색 결과
		ArrayList<PostVO> titleResult = PDAO.SearchPostTitle(word);
		if(titleResult!=null) {
			request.setAttribute("titleResult", titleResult);			
		}else {
			request.setAttribute("titleResult", notFind);	
		}
		// 내용검색 결과
		ArrayList<PostVO> contentResult = PDAO.SearchPostContent(word);
		if(contentResult!=null) {
			request.setAttribute("contentResult", contentResult);			
		}else {
			request.setAttribute("contentResult", notFind);	
		}
		// 글쓴이 검색 결과
		ArrayList<PostVO> writerResult = PDAO.SearchPostWriter(word);
		if(writerResult!=null) {			
			request.setAttribute("writerResult", writerResult);
		}else {
			request.setAttribute("writerResult", notFind);	
		}
		
		action.setPath("result.jsp");
		action.setRedirect(false);
		return action;
	}

}
