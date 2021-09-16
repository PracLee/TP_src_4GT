<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"
	import="java.util.ArrayList, model.likeInfo.LikeInfoVO, model.post.PostVO, model.comments.CommentsVO, java.sql.Date, model.userInfo.UserInfoVO"%>

<jsp:useBean id="PVO" class="model.post.PostVO" />
<jsp:useBean id="PDAO" class="model.post.PostDAO" />
<jsp:useBean id="LVO" class="model.likeInfo.LikeInfoVO" />
<jsp:useBean id="LDAO" class="model.likeInfo.LikeInfoDAO" />
<jsp:useBean id="UVO" class="model.userInfo.UserInfoVO" />
<%
	boolean res;
	String action = request.getParameter("action"); // index -> main
	if (action.equals("main")) {
		ArrayList<PostVO> datas = PDAO.SelectAll();
		ArrayList<CommentsVO> CommentDatas = (ArrayList<CommentsVO>) request.getAttribute("CommentDatas");
		ArrayList<Integer> commentsCnt = new ArrayList<Integer>(datas.size()); // 포스트 리스트와 같은 크기를 가진 댓글수 AL생성
		for (int i = 0; i < commentsCnt.size(); i++) { // 댓글수 AL 0으로 초기화
			commentsCnt.set(i, 0);
		}
		for (int i = 0; i < CommentDatas.size(); i++) {
			int index = (CommentDatas.get(i).getC_post() - 1);
			commentsCnt.set(index, (commentsCnt.get(index) + 1)); // commentsCnt index = postnum - 1
		}
		request.setAttribute("PostList", datas); // PostList로 SelectAll 데이터를 넘김
		request.setAttribute("commentsCnt", commentsCnt); // 댓글 수 AL로 넘김 0번 인덱스에 1번 포스트의 댓글 갯수 담겨있음!
		pageContext.forward("main.jsp");

	} else if (action.equals("post")) { // main -> showList
		ArrayList<PostVO> datas = PDAO.SelectAll();
		ArrayList<CommentsVO> CommentDatas = (ArrayList<CommentsVO>) request.getAttribute("CommentDatas");
		ArrayList<Integer> commentsCnt = new ArrayList<Integer>(datas.size()); // 포스트 리스트와 같은 크기를 가진 댓글수 AL생성
		for (int i = 0; i < commentsCnt.size(); i++) { // 댓글수 AL 0으로 초기화
			commentsCnt.set(i, 0);
		}
		for (int i = 0; i < CommentDatas.size(); i++) {
			int index = (CommentDatas.get(i).getC_post() - 1);
			commentsCnt.set(index, (commentsCnt.get(index) + 1)); // commentsCnt index = postnum - 1
		}
		request.setAttribute("PostList", datas); // PostList로 SelectAll 데이터를 넘김
		request.setAttribute("commentsCnt", commentsCnt); // 댓글 수 AL로 넘김 0번 인덱스에 1번 포스트의 댓글 갯수 담겨있음!
		pageContext.forward("index.jsp");

	} else if (action.equals("selectOne")) { // showList -> showPost
		PVO.setPnum(Integer.parseInt(request.getParameter("pnum"))); // pnum값으로 찾는거니 Pnum만 세팅 후 넘겨줌
		if (PDAO.ViewsUp(PVO)) { // 포스트를 볼때 view 업
			request.setAttribute("singlePost", PDAO.SelectOne(PVO));
		} else {
			throw new Exception("ViewUp 오류 발생!");
		}
		request.setAttribute("likeInfo", false); // 사용자가 지금 보는글에 좋아요를 눌렀는지 확인하는 값 디폴트 false
		if (session.getAttribute("userInfoData") != null) {
			UVO = (UserInfoVO) session.getAttribute("userInfoData"); // 로그인 정보 있으면 좋아요를 눌렀는지 체크
			String ID = UVO.getId();
			int pnum = Integer.parseInt(request.getParameter("pnum"));
			LVO.setL_post(pnum);
			LVO.setL_user(ID);
			request.setAttribute("likeInfo", LDAO.SelectOne(LVO)); // 좋아요 정보
		}
		pageContext.forward("userComment_Ctrl.jsp?action=selectOne");

	} else if (action.equals("insertPostDB")) { // insertPost -> main
		PVO.setCategory(request.getParameter("category"));
		PVO.setContent(request.getParameter("content"));
		UVO = (UserInfoVO) session.getAttribute("userInfoData"); // 이름은 세션에서 VO로 저장된 UserInfoVO 사용!
		PVO.setWriter(UVO.getName()); // Name
		PVO.setP_user(UVO.getId()); // ID
		PVO.setTitle(request.getParameter("title"));
		if (PDAO.InsertDB(PVO)) {
			pageContext.forward("index.jsp");
		} else {
			throw new Exception("insertDB 오류발생!");
		}

	} else if (action.equals("editPost")) {
		PVO.setCategory(request.getParameter("category"));
		PVO.setContent(request.getParameter("content"));
		UVO = (UserInfoVO) session.getAttribute("userInfoData"); // 이름은 세션에서 VO로 저장된 UserInfoVO 사용!
		PVO.setWriter(UVO.getName()); // name
		PVO.setP_user(UVO.getId()); // ID
		PVO.setTitle(request.getParameter("title"));
		PVO.setPlike(Integer.parseInt(request.getParameter("plike")));
		request.setAttribute("PostVO", PVO); // 수정 정보를 담은 PostVO 를 PostVO로 넘겨줌
		pageContext.forward("EditPost.jsp");

	} else if (action.equals("editPostDB")) {
		PVO.setPnum(Integer.parseInt(request.getParameter("pnum")));
		PVO.setCategory(request.getParameter("category"));
		PVO.setTitle(request.getParameter("title"));
		PVO.setPlike(Integer.parseInt(request.getParameter("plike")));
		PVO.setContent(request.getParameter("content"));
		if (PDAO.UpdateDB(PVO)) {
			pageContext.forward("main.jsp");
		} else {
			throw new Exception("UpdateDB 오류발생!");
		}

	} else if (action.equals("deletePostDB")) {
		PVO.setPnum(Integer.parseInt(request.getParameter("pnum")));
		if (PDAO.DeleteDB(PVO)) {
			pageContext.forward("main.jsp");
		} else {
			throw new Exception("UpdateDB 오류발생!");
		}

	} else if (action.equals("likeUp")) {	// if 문으로 이미 좋아요 눌렀으면 down이 나오고 아니면 up이 나오게 선택 
		PVO.setPnum(Integer.parseInt(request.getParameter("pnum")));
		if(PDAO.LikesUp(PVO)){
			int pnum = Integer.parseInt(request.getParameter("pnum"));
			response.sendRedirect("post_ctrl.jsp?action=selectOne&pnum="+pnum);
		}else{
			throw new Exception("LikeUp 오류발생!");
		}
		
	} else if (action.equals("likeDown")) {
		PVO.setPnum(Integer.parseInt(request.getParameter("pnum")));
		if(PDAO.LikesDown(PVO)){
			int pnum = Integer.parseInt(request.getParameter("pnum"));
			response.sendRedirect("post_ctrl.jsp?action=selectOne&pnum="+pnum);
		}else{
			throw new Exception("LikeDown 오류발생!");
		}
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post·Like Controller</title>
</head>
</html>