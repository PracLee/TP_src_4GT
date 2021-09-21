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

    // [부모메서드] - get
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

    // [부모메서드] - post
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	
// [로직수행 메서드]
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// [사용자 요청 구분]
		String uri=request.getRequestURI();
		String cp=request.getContextPath();
		String action=uri.substring(cp.length()+1); // +1 ==  "/"까지 sub하기 위함
		
		
	// [요청 수행]
		ActionForward forward = null;
		
	 ////////////////////////////////////comments전달 ////////////////////////////////////
		
		// [단일카테고리 목록] showList
		if(action.equals("post")) {
			
		}
		// [메인페이지] post_ctrl -> main
		else if(action.equals("main")) {
			
		}
		
		
	////////////////////////////////////userInfo////////////////////////////////////
		
		// [회원가입] --- view에서 → param (id,pw) 받아야 함 
		else if(action.equals("signUp")) {
			
		}
		// [로그인] 로그인시 session설정 → userInfoData
		else if(action.equals("joinUs")) {
			
		}
		//[ID/PW찾기] ID=pw+name , PW=id
		   // VIEW parameter 받아야할 것 
		   //     type → "id" 또는 "pw"
		   //     id = "pw" + "name"    ||   pw = "id"
		else if(action.equals("infoHelp")) {
			
		}
		
		   // ps) 마이페이지 --- login시 session을 setAttribute해두니 
		   //             즉각적으로 불러서 사용하시면 됩니다.
		   //   ★ver2 때에는 UserSetClass 생성하여 객체 전달할 예정!

		
		//[마이페이지 → 정보수정] --- view에서 → param (id,pw,name) 모두 받아야 함
		else if(action.equals("updateUser")) {
			
		}
		//[마이페이지 → 회원탈퇴] session 초기화
		else if (action.equals("deleteUser")) {
			
		}
		
		
	/////////////////////////////////////comment/////////////////////////////////////
		
		// [댓글 읽기 R]
		// [단일 게시물---showOne] 구성 (게시물+좋아요+댓글) 
		else if (action.equals("selectOne")) {
			
		}
		// [댓글  생성 C]
		else if (action.equals("insertComment")) {
	   
		}
		//[댓글  수정 U]
		else if (action.equals("editComment")) {
			
		}
		//[댓글 삭제 D]
		else if (action.equals("deleteComment")) {
			
		}
		
		
		
		
	// [response 전달]

	}

}
