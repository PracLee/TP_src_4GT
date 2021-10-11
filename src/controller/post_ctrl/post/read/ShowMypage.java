package controller.post_ctrl.post.read;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import model.post.Paging;
import model.post.PostDAO;
import model.post.PostVO;
import model.userInfo.UserInfoVO;

public class ShowMypage implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostDAO PDAO = new PostDAO();
		HttpSession session = request.getSession();
		UserInfoVO UVO = (UserInfoVO)session.getAttribute("userInfoData");
		ArrayList<PostVO> datas = PDAO.SelectMyPost(UVO);
		// 페이징 처리 로직
		String url="ShowMyPost.jsp";	
		String indexx=request.getParameter("index");
		int index=1;
		if(indexx!=null){
			index=Integer.parseInt(indexx);
		}
		url= url+ "?index="+index;
		int pagingSize = 6;
		// 생성자 순서대로 int pageSize(한페이지 게시물 수), int thisPageNum(현재 페이지 번호), int totalPostCnt(총 포스트 갯수)
		Paging paging = new Paging(pagingSize,index,datas.size());
		paging.makePaging();
		// 페이징 for문으로 표기 할 수 있도록 하기
		ArrayList<Integer> pagingIndex = new ArrayList<Integer>();
		int page = paging.getStartPageNum();
		//					1							5
		for(int i = paging.getStartPageNum();i<=paging.getEndPageNum();i++) {
			pagingIndex.add(page);
			page++;
		}
		// 페이지 6개씩
		Date today = new Date();
		DateSlice ds = new DateSlice(datas, today, index);
		ds.excuteSlice();
		

		request.setAttribute("isLast", paging.isLast());
		request.setAttribute("isFirst", paging.isFirst());
		request.setAttribute("pagingIndex", pagingIndex);
		request.setAttribute("index", index);
		request.setAttribute("MyPost", ds.getNewData());
		action.setPath(url);
		action.setRedirect(false);
		return action;
	}

}
