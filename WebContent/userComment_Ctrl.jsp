<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" import="java.util.ArrayList, model.userInfo.UserInfoVO, model.comments.*"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>    

<!-- 유저 빈즈클래스 -->
<jsp:useBean id="userInfoDAO" class="model.userInfo.UserInfoDAO"/>
<jsp:useBean id="userInfoVO" class="model.userInfo.UserInfoVO"/>

<!-- 댓글 빈즈클래스 -->
<jsp:useBean id="commentDAO" class="model.comments.CommentsDAO"/>
<jsp:useBean id="commentVO" class="model.comments.CommentsVO"/>

<!-- 속성 SET -->
<jsp:setProperty property="*" name="userInfoVO"/>
<jsp:setProperty property="*" name="commentVO"/>



<!-- 로직 수행파트 -->
<%

// 요청 파라미터 변수에 저장
String action = request.getParameter("action");



///////////////////////////////////// userInfo comments   /////////////////////////////////////
///////////////////////////////////// 클라이언트 요청 별 기능수행   //////////////////////////////////////




////////////////////////////////////userInfo////////////////////////////////////

//[회원가입] --- view에서 → param (id,pw) 받아야 함 
if(action.equals("signUp")){
	// 입력된 데이터로 insertDB 수행 
	boolean signUpRes = userInfoDAO.InsertDB(userInfoVO);
	
	// boolean 결과값 → request 설정
	request.setAttribute("signUpRes", signUpRes);
	
	// 페이지 이동
	pageContext.forward("Login.jsp");
	
}
//[회원가입 → 아이디 중복체크] --  View딴에서 jQuery+ajax 구현필요 
/* 이거 지울건데 임시로 두는거에용!!!!!!
else if(action.equals("idCheck")){
	//★ 우선은 selectAll로 for문을 돌리고 있으나....
	//   └효율성 측면을 생각했을 때 model에서 selectOne을 추가하는게 좋을지 협의 필요~
	
	// 사용자입력 ID 저장
	String userID = request.getParameter("id");
	
	//View 전달----중복여부(true:가능/false:불가능)
	boolean idCheck = true; //  true 디폴트
	
	// DAO에서 모든 유저의 데이터 --- AL저장
	ArrayList<UserInfoVO> datas = userInfoDAO.SelectAll();
	
	// userID와  
	//forEach를 통해 중복 데이터 있다면 --> false변환
	for(UserInfoVO vo :(ArrayList<UserInfoVO>) datas){
		if(userID.equals(vo.getName())){
			idCheck = false; // 
			break;
		}
	}
	
	// view에게 id가능여부 전달
	request.setAttribute("idCheck", idCheck);
	
}*/
//[로그인] 로그인시 session설정 → userInfoData
else if(action.equals("joinUs")){
	// 유저정보 받아오기
	UserInfoVO userInfoData = userInfoDAO.SelectOne(userInfoVO);
	
	// 로그인 실패 
	if(userInfoData==null){
		out.println("<script>alert('로그인에 실패하였습니다. ID 혹은 PW 재확인해 주세요.'); history.go(-1); </script>");
	}
	// 로그인 성공
	else{
		// 유저정보 session설정
		session.setAttribute("userInfoData", userInfoData);
		// 메인 페이지 이동
		response.sendRedirect("post_ctrl.jsp?action=main");
	}
	
	
}
//[ID/PW찾기] ID=pw+name , PW=id
// VIEW parameter 받아야할 것 
//     type "id" 또는 "pw"
//     id = "pw" + "name"	 ||   "pw" = "id"
else if(action.equals("infoHelp")){
	
	// ID찾기 --> view 반환 -> 객체 userInfo
	if(request.getParameter("type").equals("id")){
		userInfoVO = userInfoDAO.FindID(userInfoVO);
		
	}
	// PW찾기 --> view 반환 == 객체 userInfo
	else if(request.getParameter("type").equals("pw")){
		userInfoVO = userInfoDAO.FindPW(userInfoVO);
	}
	
	// view 객체전달 --- findUser
	request.setAttribute("findUser", userInfoVO);
	pageContext.forward("FindHelp.jsp");
	
}


// 마이페이지 --- login시 session을 setAttribute해두니 
// 				즉각적으로 불러서 사용하시면 됩니다.
//	★ver2 때에는 UserSetClass 생성하여 객체 전달할 예정!


//[마이페이지 → 정보수정] --- view에서 → param (id,pw,name) 모두 받아야 함
else if(action.equals("updateUser")){
	

	// 정보수정이 완료되었다면, mypage로 이동
	if(userInfoDAO.UpdateDB(userInfoVO)){
		// 기존 세션 - 유저 데이터 업데이트(session 다시 set!!)					
		session.setAttribute("userInfoData", userInfoDAO.SelectOne((UserInfoVO)session.getAttribute("userInfoData")));
		
		//마이페이지 이동
		pageContext.forward("Mypage.jsp");
	}
	else{
		throw new Exception("유저-정보수정 DB 오류 발생!");
	}
	
	
	
}
//[마이페이지 → 회원탈퇴] session 초기화
else if(action.equals("deleteUser")){
	
		
	//정상적으로 회원탈퇴가 되었다면 → 유저 세션remove
	if( userInfoDAO.DeleteDB(userInfoVO)){
		session.removeAttribute("userInfoData");		
	}
	else{
		throw new Exception("회원탈퇴 DB 오류 발생!");
	}

	
	// index 페이지 이동
	response.sendRedirect("index.jsp");
}











////////////////////////////////////comment////////////////////////////////////

// [댓글 읽기 R]
// [단일 게시물---showOne] 구성 (게시물+좋아요+댓글) 
else if(action.equals("selectOne")){
	// view에게 3가지 데이터 모두 전달
	// ① 단일 post  ② 좋아요 수  ③ 1의 댓글목록  ---- ①, ②는 post컨트롤 에게서 받음
	
	// ① singlePost
	request.setAttribute("singlePost", request.getAttribute("singlePost"));
	
	// ② like
	request.setAttribute("likeInfo", request.getAttribute("likeInfo"));
	
	// ③ postOne_comments
	// post 컨트롤에게 단일 게시물 정보를 받아오고,
	// DAO를 통해 해당 게시물의 모든 댓글을 AL에 받아옴
	ArrayList<CommentsVO> postOne_comments = commentDAO.SelectPost((CommentsVO)request.getAttribute("singlePost"));
	
	
	// V 전달 ---- 단일게시물 페이지로 이동 
	pageContext.forward("ShowPost.jsp");
}
// [댓글  생성 C]
else if(action.equals("insertComment")){
	
	// view에서 파라미터들을 전달해주면(c_user, c_post, cment)
	// set된 commentVO로 댓글추가
	if(commentDAO.InsertDB(commentVO)){
		// ShowList(단일 게시물)페이지로 이동하기 위해 post컨트롤에게 해당 액션값 전달
		response.sendRedirect("post_ctrl.jsp?action=selectOne");
	}
	else{
		throw new Exception("댓글추가 DB 오류 발생!");
	}
	
	
}
//[댓글  수정 U]
else if(action.equals("editComment")){
	

	if(commentDAO.UpdateDB(commentVO)){
		// ShowList(단일 게시물)페이지로 이동하기 위해 post컨트롤에게 해당 액션값 전달
		response.sendRedirect("post_ctrl.jsp?action=selectOne");
	}
	else{
		throw new Exception("댓글수정 DB 오류 발생!");
	}
	
}
//[댓글 삭제 D]
else if(action.equals("deleteComment")){
	
	if(commentDAO.DeleteDB(commentVO)){
		// ShowList(단일 게시물)페이지로 이동하기 위해 post컨트롤에게 해당 액션값 전달
		response.sendRedirect("post_ctrl.jsp?action=selectOne");
	}
	else{
		throw new Exception("댓글삭제 DB 오류 발생!");
	}
	
}


%>