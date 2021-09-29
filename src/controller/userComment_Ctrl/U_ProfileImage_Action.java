package controller.userComment_Ctrl;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Action;
import controller.ActionForward;
import model.userInfo.UserInfoDAO;
import model.userInfo.UserInfoVO;

public class U_ProfileImage_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();


		String realFolder = "";
		String filename1 = "";
		// ���� ũ�� 15MB�� ����
		int maxSize = 1024*1024*15;
		String encType = "utf-8";
		String savefile = "img";

		// ������ ����� ������ ���
		ServletContext scontext = request.getSession().getServletContext();
		realFolder = scontext.getRealPath(savefile);
		UserInfoDAO UDAO = new UserInfoDAO();
		UserInfoVO UVO = new UserInfoVO();

		try{
			// ���� ���ε�
			MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames(); 
			String file1 = (String)files.nextElement();
			filename1 = multi.getFilesystemName(file1);


		} catch(Exception e) {
			e.printStackTrace();
		}
		realFolder = "img";
		String fullpath = realFolder + "/" + filename1;


		if(true/*mDAO.insertDB(mVO)*/){
			// ���� �������� �ٸ� ������ �̵��� ���� �ַ� redirect ����� �̿��� -> spring���� �ڼ���
			forward.setRedirect(true);
			forward.setPath("main.do");	
			return forward;
		}
		else{
			// ���ܸ� �߻����� ������������ �̵�
			try {
				throw new Exception("DB ���� ���� �߻�!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		forward.setRedirect(true);
		forward.setPath("login.jsp");	
		return forward;
	}


}


