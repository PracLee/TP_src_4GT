package controller.userComment_Ctrl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class M_codeSend_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		Properties prop = System.getProperties();
	      prop.put("mail.smtp.user", "bjlee.spsbsc@gamil.com");   // 서버 아이디만 쓰기
	      prop.put("mail.smtp.host", "smtp.gmail.com");   // 구글 SMTP
	      prop.put("mail.smtp.auth", "true");
	      prop.put("mail.smtp.port", "587");
	      prop.put("mail.smtp.starttls.enable", "true");
	      prop.put("mail.smtp.soketFactory.port","465");
	      prop.put("mail.smtp.soketFactory.class","javax.net.ssl.SSLSoketFactory");
	      prop.put("mail.smtp.soketFactory.fallback","false");

	      Authenticator auth = new M_Mail();

	      //Session 생성 및 MimeMessage 생성
	      Session session = Session.getDefaultInstance(prop, auth);
	      MimeMessage msg = new MimeMessage(session);
	      try {
	         // 보낸시간 현재
	         msg.setSentDate(new Date());   

	         // 보내는 사람, 이름
	         msg.setFrom(new InternetAddress("lyena8958@gmail.com", "4GT_Admin"));   

	         // 수신자
	         String email = request.getParameter("receiver");   // 사용자가 입력한 값을 받아옴
	         InternetAddress to = new InternetAddress(email);

	         // 메일 제목
	         msg.setSubject("[4GT Blog] 이메일 인증", "UTF-8");

	         // 메일 내용
	         String code = request.getParameter("codeNum");
	         msg.setText("4GT 이메일 주소 인증 안내\n인증번호 [ "+code+" ]\n"
	         		+ "해당 계정 및 사이트 보안을 안전하게 유지할 수 있도록 본인의 이메일 주소를 인증해주세요. "
	         		+ "이메일 주소 인증이 완료되면 작업을 시작할 수 있습니다.", "UTF-8");
	         
	         request.setAttribute("code", code);    // 다음페이지에서 코드 확인

	         // 참조인
	         msg.setRecipient(Message.RecipientType.TO, to);

	         // 메일 보내기
	         Transport.send(msg);
	         System.out.println("M_codeSend_Action_메일 인증번호 발송완료");

	      } catch(AddressException ae) {            
	         System.out.println("AddressException : " + ae.getMessage());           
	      } catch(MessagingException me) {            
	         System.out.println("MessagingException : " + me.getMessage());
	      } catch(UnsupportedEncodingException e) {
	         System.out.println("UnsupportedEncodingException : " + e.getMessage());
	      }
		
		
		forward.setRedirect(false); // forward전송
		forward.setPath("emailCheck.jsp"); // 전송페이지 (임시)
		
		return forward;
	}

}
