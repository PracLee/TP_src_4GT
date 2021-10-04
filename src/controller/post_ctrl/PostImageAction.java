package controller.post_ctrl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Action;
import controller.ActionForward;
import model.post.PostDAO;
import model.post.PostVO;

public class PostImageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();


		String realFolder = "";
		String filename1 = "";
		// ���� ũ�� 3MB�� ����
		int maxSize = 1024*1024*3;
		String encType = "utf-8";   

		// �̳༮�� ���ε� �� ���� �̸�
		String savefile = "img";

		String filename = "";

		// ������ ����� ������ ���
		ServletContext scontext = request.getSession().getServletContext();
		realFolder = scontext.getRealPath(savefile);
		// 
		PostDAO PDAO = new PostDAO();
		PostVO PVO = new PostVO();

		try{
			// ���� ���ε�
			MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames(); 
			String file1 = (String)files.nextElement();
			filename1 = multi.getFilesystemName(file1);
			System.out.println(filename1);

			// ���ε� �� ������ �̸� �����ϴ� ����
			HttpSession session = request.getSession();/*
			UVO = (UserInfoVO)session.getAttribute("userInfoData");
			System.out.println("���� UVO : "+UVO);*/
			/*File oldFile = new File(realFolder +"/" +filename1);
			System.out.println("�õ����� : "+oldFile);
			File newFile = new File(realFolder +"/" +UVO.getId()+"_profile.jpg");
			System.out.println("������ : "+newFile);
			oldFile.renameTo(newFile);
			System.out.println("�ٲ� �õ����� : "+oldFile);*/
			Path oldfile = Paths.get(realFolder +"/" +filename1);
			Path newfile = Paths.get(realFolder +"/" +PVO.getPnum()+"_PostImage.jpg"); 
			Files.move(oldfile, newfile, StandardCopyOption.REPLACE_EXISTING);
			realFolder = "userProfile";
			String fullpath = realFolder + "/" + PVO.getPnum()+"_PostImage.jpg";

			// DB������Ʈ
			PVO.setPath(fullpath);
			//UVO.setProfile(fullpath);
			//System.out.println("���� UVO : "+UVO);
		} catch(Exception e) {
			e.printStackTrace();
		}


		if(PDAO.UpdateDB(PVO)){
			// ������Ʈ�� �Ϸ������ ���ư��� ������
			forward.setRedirect(true);
			forward.setPath("tagtest.jsp");	
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

		return null;
	}

}