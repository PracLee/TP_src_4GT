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
		String word = (String)request.getParameter("findWord");
		String find = "%"+word+"%";
		// ����˻� ���
		ArrayList<PostVO> titleResult = PDAO.SearchPostTitle(find);
		if(titleResult!=null) {
			request.setAttribute("titleResult", titleResult);
			System.out.println("titleResult"+ titleResult);			
		}
		// ����˻� ���
		ArrayList<PostVO> contentResult = PDAO.SearchPostContent(find);
		if(contentResult!=null) {
			request.setAttribute("contentResult", contentResult);
			System.out.println("contentResult"+ contentResult);			
		}
		// �۾��� �˻� ���
		ArrayList<PostVO> writerResult = PDAO.SearchPostWriter(find);
		if(writerResult!=null) {			
			request.setAttribute("writerResult", writerResult);
			System.out.println("writerResult"+ writerResult);
		}
		request.setAttribute("word", word);
		action.setPath("result.jsp");
		action.setRedirect(false);
		return action;
	}

}
