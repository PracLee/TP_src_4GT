package controller.post_ctrl.post.read;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.post.PostDAO;
import model.post.PostVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostDAO PDAO = new PostDAO();
		PostVO PVO = new PostVO();
		ArrayList<PostVO> datas = new ArrayList<PostVO>();
		// ����¡ ó�� ����
		String url="main.jsp";	
		String indexx=request.getParameter("index");
		int index=1;
		if(indexx!=null){
			index=Integer.parseInt(indexx);
		}
		url= url+ "?index="+index;

		datas = PDAO.SelectAll();
		// System.out.println("datas == "+datas);
		/*ArrayList<CommentsVO> CommentDatas = new ArrayList<CommentsVO>();
		CommentDatas = (ArrayList<CommentsVO>) request.getAttribute("CommentDatas");
		ArrayList<Integer> commentsCnt = new ArrayList<Integer>(); // ����Ʈ ����Ʈ�� ���� ũ�⸦ ���� ��ۼ� AL����
		for (int i = 0; i < datas.size(); i++) { // ��ۼ� AL 0���� �ʱ�ȭ
			commentsCnt.add(i, 0);
		}
		for (int i = 0; i < CommentDatas.size(); i++) {
			int index = (CommentDatas.get(i).getC_post() - 1);
			// System.out.println("index : "+index);
			commentsCnt.add(index, (commentsCnt.get(index) + 1)); // commentsCnt index = postnum - 1
		}*/	// ��ۼ� ���� -> 0927 model column �߰��� ����

		int maxIndex = 1;
		int listCnt = 6;
		Paginator page = new Paginator(5, listCnt, datas.size());
		// �ε��� ����
		if(datas != null) {
			maxIndex = page.getTotalLastPageNum();
		}
		Map<String,Object> pageInfo = page.getFixedBlock(index);
		
		ArrayList<PostVO> slicedata = new ArrayList<PostVO>();
		for(int i=(index-1)*6; i<index*6; i++) { // ���� �ε����� -1*6~�����ε���*6 ������ �����͸� �Ѱ��ֱ�
			PostVO vo = datas.get(i);
			slicedata.add(vo);
			if(i==datas.size()-1) {
				break;
			}
		}


		request.setAttribute("maxIndex", maxIndex);
		request.setAttribute("PostList", slicedata); // PostList�� SelectAll �����͸� �ѱ�
		//System.out.println("mainActio ���� �����ִ� datas == "+datas);
		// request.setAttribute("commentsCnt", commentsCnt); // ��� �� AL�� �ѱ� 0�� �ε����� 1�� ����Ʈ�� ��� ���� �������! ��ۼ� ���� -> 0927 model column �߰��� ����
		action.setPath(url);
		action.setRedirect(false);
		return action;
	}

}
