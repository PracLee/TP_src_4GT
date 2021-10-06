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
		String word = (String)request.getParameter("findWord");
		String find = "%"+word+"%";
		String condition = (String)request.getParameter("condition");
		// 각 항목 페이징 처리
		String url="result.jsp";	
		String indexx=request.getParameter("index");
		int index=6;
		if(indexx!=null){
			index=Integer.parseInt(indexx);
		}
		//url 작업
		url= url+ "?index="+index;
		request.setAttribute("index", index);
		// 제목검색 결과
		ArrayList<PostVO> result = PDAO.SearchPostTitle(find,index);	// condition추가
		if(result!=null) {
			request.setAttribute("result", result);
			System.out.println("result"+ result);			
		}
		request.setAttribute("condition", condition);
		request.setAttribute("word", word);
		action.setPath("result.jsp");
		action.setRedirect(false);
		return action;
	}

}
