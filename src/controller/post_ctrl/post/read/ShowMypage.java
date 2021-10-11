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
		// ����¡ ó�� ����
		String url="ShowMyPost.jsp";	
		String indexx=request.getParameter("index");
		int index=1;
		if(indexx!=null){
			index=Integer.parseInt(indexx);
		}
		url= url+ "?index="+index;
		int pagingSize = 6;
		// ���� ���� int pageSize(�������� �Խù� ��), int thisPageNum(���� ������ ��ȣ), int totalPostCnt(�� ��Ʈ ����)
		Paging paging = new Paging(pagingSize,index,datas.size());
		paging.makePaging();
		// ����¡ for����� ǥ�� �� �� �ֵ��� �ϱ�
		ArrayList<Integer> pagingIndex = new ArrayList<Integer>();
		int page = paging.getStartPageNum();
		//					1							5
		for(int i = paging.getStartPageNum();i<=paging.getEndPageNum();i++) {
			pagingIndex.add(page);
			page++;
		}
		// ������ 6����
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
