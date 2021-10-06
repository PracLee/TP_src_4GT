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
		String tIndexx=request.getParameter("tIndex");
		String cIndexx=request.getParameter("cIndex");
		String wIndexx=request.getParameter("wIndex");
		int titleIndex=6;
		int contentIndex=6;
		int writerIndex=6;
		if(tIndexx!=null){
			titleIndex=Integer.parseInt(tIndexx);
		}
		if(cIndexx!=null){
			contentIndex=Integer.parseInt(cIndexx);
		}
		if(wIndexx!=null){
			writerIndex=Integer.parseInt(wIndexx);
		}
		//url 작업
		url= url+ "?tIndex="+titleIndex;
		url= url+ "&cIndex="+contentIndex;
		url= url+ "&wIndex="+writerIndex;
		request.setAttribute("tIndex", titleIndex);
		request.setAttribute("cIndex", contentIndex);
		request.setAttribute("wIndex", writerIndex);
		// 제목검색 결과
		ArrayList<PostVO> titleResult = PDAO.SearchPostTitle(find,titleIndex);
		if(titleResult!=null) {
			request.setAttribute("titleResult", titleResult);
			System.out.println("titleResult"+ titleResult);			
		}
		// 내용검색 결과
		ArrayList<PostVO> contentResult = PDAO.SearchPostContent(find,contentIndex);
		if(contentResult!=null) {
			request.setAttribute("contentResult", contentResult);
			System.out.println("contentResult"+ contentResult);			
		}
		// 글쓴이 검색 결과
		ArrayList<PostVO> writerResult = PDAO.SearchPostWriter(find,writerIndex);
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
