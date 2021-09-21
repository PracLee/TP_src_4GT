package controller.userComment_Ctrl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ActionForward;

/**
 * Servlet implementation class UserComment_ctrl
 */
@WebServlet("/UserComment_ctrl")
public class UserComment_ctrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserComment_ctrl() {
        super();
    }

    // [�θ�޼���] - get
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

    // [�θ�޼���] - post
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	
// [�������� �޼���]
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// [����� ��û ����]
		String uri=request.getRequestURI();
		String cp=request.getContextPath();
		String action=uri.substring(cp.length()+1); // +1 ==  "/"���� sub�ϱ� ����
		
		
	// [��û ����]
		ActionForward forward = null;
		
	 ////////////////////////////////////comments���� ////////////////////////////////////
		
		// [����ī�װ� ���] showList
		if(action.equals("post")) {
			
		}
		// [����������] post_ctrl -> main
		else if(action.equals("main")) {
			
		}
		
		
	////////////////////////////////////userInfo////////////////////////////////////
		
		// [ȸ������] --- view���� �� param (id,pw) �޾ƾ� �� 
		else if(action.equals("signUp")) {
			
		}
		// [�α���] �α��ν� session���� �� userInfoData
		else if(action.equals("joinUs")) {
			
		}
		//[ID/PWã��] ID=pw+name , PW=id
		   // VIEW parameter �޾ƾ��� �� 
		   //     type �� "id" �Ǵ� "pw"
		   //     id = "pw" + "name"    ||   pw = "id"
		else if(action.equals("infoHelp")) {
			
		}
		
		   // ps) ���������� --- login�� session�� setAttribute�صδ� 
		   //             �ﰢ������ �ҷ��� ����Ͻø� �˴ϴ�.
		   //   ��ver2 ������ UserSetClass �����Ͽ� ��ü ������ ����!

		
		//[���������� �� ��������] --- view���� �� param (id,pw,name) ��� �޾ƾ� ��
		else if(action.equals("updateUser")) {
			
		}
		//[���������� �� ȸ��Ż��] session �ʱ�ȭ
		else if (action.equals("deleteUser")) {
			
		}
		
		
	/////////////////////////////////////comment/////////////////////////////////////
		
		// [��� �б� R]
		// [���� �Խù�---showOne] ���� (�Խù�+���ƿ�+���) 
		else if (action.equals("selectOne")) {
			
		}
		// [���  ���� C]
		else if (action.equals("insertComment")) {
	   
		}
		//[���  ���� U]
		else if (action.equals("editComment")) {
			
		}
		//[��� ���� D]
		else if (action.equals("deleteComment")) {
			
		}
		
		
		
		
	// [response ����]

	}

}
