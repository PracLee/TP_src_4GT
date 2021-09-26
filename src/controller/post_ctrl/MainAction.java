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
		System.out.println(1);
		PostDAO PDAO = new PostDAO();
		System.out.println(2);
		PostVO PVO = new PostVO();
		System.out.println(3);
		ArrayList<PostVO> datas = new ArrayList<PostVO>();
		System.out.println(4);
		datas = PDAO.SelectAll();
		System.out.println(5);
		ArrayList<CommentsVO> CommentDatas = new ArrayList<CommentsVO>();
		System.out.println(6);
		CommentDatas = (ArrayList<CommentsVO>) request.getAttribute("CommentDatas");
		ArrayList<Integer> commentsCnt = new ArrayList<Integer>(); // ����Ʈ ����Ʈ�� ���� ũ�⸦ ���� ��ۼ� AL����
		System.out.println(7);
		for (int i = 0; i < datas.size(); i++) { // ��ۼ� AL 0���� �ʱ�ȭ
			System.out.println(8);
			commentsCnt.add(i, 0);
		}
		System.out.println(9);
		for (int i = 0; i < CommentDatas.size(); i++) {
			int index = (CommentDatas.get(i).getC_post() - 1);
			commentsCnt.add(index, (commentsCnt.get(index) + 1)); // commentsCnt index = postnum - 1
		}
		request.setAttribute("PostList", datas); // PostList�� SelectAll �����͸� �ѱ�
		request.setAttribute("commentsCnt", commentsCnt); // ��� �� AL�� �ѱ� 0�� �ε����� 1�� ����Ʈ�� ��� ���� �������!
		action.setPath("main.jsp");
		action.setRedirect(false);
		return action;
	}

}
