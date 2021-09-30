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
	      prop.put("mail.smtp.user", "4grouptuna@gamil.com");   // ���� ���̵� ����
	      prop.put("mail.smtp.host", "smtp.gmail.com");   // ���� SMTP
	      prop.put("mail.smtp.auth", "true");
	      prop.put("mail.smtp.port", "587");
	      prop.put("mail.smtp.starttls.enable", "true");
	      prop.put("mail.smtp.soketFactory.port","465");
	      prop.put("mail.smtp.soketFactory.class","javax.net.ssl.SSLSoketFactory");
	      prop.put("mail.smtp.soketFactory.fallback","false");

	      Authenticator auth = new M_Mail();

	      //Session ���� �� MimeMessage ����
	      Session session = Session.getDefaultInstance(prop, auth);
	      MimeMessage msg = new MimeMessage(session);
	      try {
	         // �����ð� ����
	         msg.setSentDate(new Date());   

	         // ������ ���, �̸�
	         msg.setFrom(new InternetAddress("4grouptuna@gamil.com", "4GT_Admin"));   

	         // ������
	         String email = request.getParameter("receiver");   // ����ڰ� �Է��� ���� �޾ƿ�
	         InternetAddress to = new InternetAddress(email);

	         // ���� ����
	         msg.setSubject("[4GT Blog] �̸��� ����", "UTF-8");

	         // ���� ����
	         String code = request.getParameter("code_check");
	         msg.setText("4GT �̸��� �ּ� ���� �ȳ�\n������ȣ [ "+code+" ]\n"
	         		+ "�ش� ���� �� ����Ʈ ������ �����ϰ� ������ �� �ֵ��� ������ �̸��� �ּҸ� �������ּ���. "
	         		+ "�̸��� �ּ� ������ �Ϸ�Ǹ� �۾��� ������ �� �ֽ��ϴ�.", "UTF-8");
	         
	         request.setAttribute("code", code);    // �������������� �ڵ� Ȯ��

	         // ������
	         msg.setRecipient(Message.RecipientType.TO, to);

	         // ���� ������
	         Transport.send(msg);
	         System.out.println("M_codeSend_Action_���� ������ȣ �߼ۿϷ�");

	      } catch(AddressException ae) {            
	         System.out.println("AddressException : " + ae.getMessage());           
	      } catch(MessagingException me) {            
	         System.out.println("MessagingException : " + me.getMessage());
	      } catch(UnsupportedEncodingException e) {
	         System.out.println("UnsupportedEncodingException : " + e.getMessage());
	      }
		
		
		forward.setRedirect(false); // forward����
		forward.setPath("emailCheck.jsp"); // ���������� (�ӽ�)
		
		return forward;
	}

}
