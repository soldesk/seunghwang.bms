package seunghwang.bms.util;

import java.util.Properties;

import javax.mail.*;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public  class SendMail {
	//파라미터로 보내는 사람 주소 쓰면 됨 			
	//원하는 로직으로 내용이랑 제목 만들고 sendEmail 넣으면 됨
	public static int  sendFindId(String recipient,String id) {
		   String title =  "아이디 찾기 문의 결과 입니다.";
		   String body = "당신의 아이디는 " + id +"입니다.";
		   return sendEmail(recipient,title,body);
	}
	
	public static int  sendFindPw(String recipient,String PwURL) {
		   String title =  "비밀번호 찾기 문의 결과 입니다.";
		   String body = "링크로 들어가서 비밀번호를 수정하세요 \n" + PwURL;
		   return sendEmail(recipient,title,body);
	}
	
	public static int sendMailCheck(String recipient,String MailCheckURL) {
		String title ="booking 인증 메일 입니다.";
		String body = "아래 링크를 누르면 메일 인증이 완료됩니다. \n" + MailCheckURL;
		return sendEmail(recipient,title,body);
	}
	
	public static int sendInquiryAnswer(String recipient, String title, String body) {
		return sendEmail(recipient,title,body);
	}
	
	
	//메일 보내기 공통부분, 파라미터 받는사람, 제목, 내용
	//성공하면 1 반환 오류시 2반환
   private static int sendEmail(String recipient,String subject,String body) {
       String host = "smtp.naver.com";
       final String username = "smtpsus3311@naver.com";
       final String password = "1q2w3e!";
       String port="465";
       try {
       Properties props = System.getProperties();
       		
       props.put("mail.smtp.host", host);
       props.put("mail.smtp.port", port);
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.ssl.enable", "true");
       props.put("mail.smtp.ssl.trust", host);
       	//security Socket Layer
     
       Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
           String un=username;
           String pw=password;
           protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(un, pw);
           }
       });

       session.setDebug(true); //for debug
       
       Message mimeMessage = new MimeMessage(session);
       
       mimeMessage.setFrom(new InternetAddress("smtpsus3311@naver.com"));
       mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
       mimeMessage.setSubject(subject);
       mimeMessage.setText(body);
       Transport.send(mimeMessage);
       return 1;
       
       } catch(MessagingException e) {
    	   System.out.println("보내는 사람 주소를 확인하세요");
    	   return 2;
       } 

   }

	   
   
	public static String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6;i++) {
			int n= (int) (Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}	   
  
}  
 

