package controller.post_ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.comments.CommentsVO;
import model.post.PostDAO;
import model.post.PostVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		System.out.println("///////////////////////////////////////");
		PostDAO PDAO = new PostDAO();
		PostVO PVO = new PostVO();
		ArrayList<PostVO> datas = PDAO.SelectAll();
		System.out.println(datas);
		ArrayList<CommentsVO> CommentDatas = (ArrayList<CommentsVO>) request.getAttribute("CommentDatas");
		ArrayList<Integer> commentsCnt = new ArrayList<Integer>(); // ����Ʈ ����Ʈ�� ���� ũ�⸦ ���� ��ۼ� AL����
		System.out.println("datas.size = "+datas.size());
		for (int i = 0; i < datas.size(); i++) { // ��ۼ� AL 0���� �ʱ�ȭ
			commentsCnt.add(i, 0);
			System.out.println(commentsCnt.get(i));
		}
		for (int i = 0; i < datas.size(); i++) {
			int index = (CommentDatas.get(i).getC_post() - 1);
			commentsCnt.add(index, (commentsCnt.get(index) + 1)); // commentsCnt index = postnum - 1
		}
		System.out.println(1);
		request.setAttribute("PostList", datas); // PostList�� SelectAll �����͸� �ѱ�
		System.out.println(2);
		request.setAttribute("commentsCnt", commentsCnt); // ��� �� AL�� �ѱ� 0�� �ε����� 1�� ����Ʈ�� ��� ���� �������!
		System.out.println(3);
		action.setPath("main.jsp");
		System.out.println(4);
		action.setRedirect(false);
		System.out.println(5);
		return action;
	}

}
