package com.iii.eeit9703.member.model;  
  
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;  
  
  
public class EmailUtils {  
      
	 static String host = "smtp.gmail.com";
	  static int port = 587;
	  final static String username = "slj68001@gmail.com";
	  final static String password = "slj00168";
    /** 
     * 发送重设密码链接的邮件 
     */  
    public static void sendResetPasswordEmail(MemVO memberId) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("找回你的帳號密碼");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(username));  
            message.setRecipient(RecipientType.TO, new InternetAddress(memberId.getMemMail()));  
            message.setContent("如果要使用新密碼,請點擊下面連結:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(memberId) +"'>重置密碼</a>","text/html;charset=utf-8");  
            // 发送邮件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
      
    public static Session getSession() {  
        Properties props = new Properties();  
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", port);
        Session session = Session.getInstance(props, new Authenticator() {
        	   protected PasswordAuthentication getPasswordAuthentication() {        		   
        	    return new PasswordAuthentication(username, password);
        	   }
        	  });
        return session;  
    }  
}  