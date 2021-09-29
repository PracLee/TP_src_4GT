
package controller.userComment_Ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.comments.CommentsDAO;
import model.comments.CommentsVO;

public class C_DeleteComment_Action implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		// VO DAO �ν��Ͻ�ȭ
	    CommentsVO commentVO = new CommentsVO();
	    CommentsDAO commentDAO = new CommentsDAO();
	    
	    
	    // DAO���� �ʿ䵥���� SET
	    commentVO.setCnum(Integer.parseInt(request.getParameter("cnum")));
	    commentVO.setC_post(Integer.parseInt(request.getParameter("c_post"))); // Ʈ����� ������ ���� ����
	    
	    
		String path = null; // uri���� �ʱ�ȭ
		
	    //DAO ����
	    // ��� ����ó��
	    if (commentDAO.DeleteDB(commentVO)) {
			// [����¡ó�� �޼���] ȣ�� (uri ��ȯ)
	    	path = new Post_Action().paging(request.getParameter("c_post"));
	    }
	    // �ݿ����� -> ��������
	    else {
	    	try {
				throw new Exception("C_DeleteComment_Action �����߻�!");
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
	    }
	    
	    // ���� ����
	    forward.setRedirect(false); // sendRedirect
	    forward.setPath(path);
	    
	    return forward;
	}
}
