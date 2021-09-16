<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, model.post.*"
	errorPage="error.jsp"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="PDAO" class="model.post.PostDAO" />
<jsp:useBean id="PVO" class="model.post.PostVO" />
<%
	// 파일 경로, 이름
	String realFolder = "";
	String filename1 = "";
	// 파일 크기 15MB로 제한
	int maxSize = 1024 * 1024 * 15;
	String encType = "utf-8";
	String savefile = "img";

	// 파일이 저장될 서버의 경로
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);
	System.out.println("realFolder = " + realFolder);
	try {
		// 파일 업로드
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String file1 = (String) files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		PVO.setCategory(multi.getParameter("category"));
		PVO.setContent(multi.getParameter("content"));
		PVO.setP_user(multi.getParameter("p_user"));
		PVO.setPdate(multi.getParameter("pdate"));
		PVO.setPlike(Integer.parseInt(multi.getParameter("plike")));
		PVO.setPnum(Integer.parseInt(multi.getParameter("pnum")));
		PVO.setTitle(multi.getParameter("title"));
		PVO.setViews(Integer.parseInt(multi.getParameter("views")));

	} catch (Exception e) {
		e.printStackTrace();
	}
	realFolder = "img";
	String fullpath = realFolder + "/" + filename1;
	System.out.println("fullpath = " + fullpath);
	PVO.setPath(fullpath);

	if (PDAO.InsertDB(PVO)) {
		// 같은 페이지의 다른 곳으로 이동할 때는 주로 redirect 방식을 이용함 -> spring에서 자세히
		response.sendRedirect("control.jsp?action=list");
	} else {
		// 예외를 발생시켜 에러페이지로 이동
		throw new Exception("DB 변경 오류 발생!");
	}
%>