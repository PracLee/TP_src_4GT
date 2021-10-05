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
		// �˻� �� ����
		String word = request.getParameter("findWord");
		// ����˻� ���
		ArrayList<PostVO> titleResult = PDAO.SearchPostTitle(word);
		if(titleResult!=null) {
			request.setAttribute("titleResult", titleResult);			
		}
		// ����˻� ���
		ArrayList<PostVO> contentResult = PDAO.SearchPostContent(word);
		if(contentResult!=null) {
			request.setAttribute("contentResult", contentResult);			
		}
		// �۾��� �˻� ���
		ArrayList<PostVO> writerResult = PDAO.SearchPostWriter(word);
		if(writerResult!=null) {			
			request.setAttribute("writerResult", writerResult);
		}
		
		action.setPath("result.jsp");
		action.setRedirect(false);
		return action;
	}

}