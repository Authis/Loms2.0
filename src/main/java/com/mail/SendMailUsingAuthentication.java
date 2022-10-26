package com.mail;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.ArrayList;
import java.util.Properties;
public class SendMailUsingAuthentication
{
	
	  private static String SMTP_AUTH_USER = "";//"service.raksha";
	  private static String SMTP_AUTH_PWD  = "";//"raksha123";  
	  private static final String SMTP_HOST_NAME = "smtp.gmail.com";   // "mail.sunraysts.com"
	  private static final String SMTP_PORT = "465";  // "2525"
	  private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	  String bodyText = "This is a important message with attachment";
	  String mailErr = "";
	  
	  
	  public String postMail(ArrayList<String> recipients, String subject,
              String messageBody , String from,String senderPassword,  String sendFileName) throws MessagingException{
		  
		  // Recipient's email ID needs to be mentioned.
	     
	      
	     SMTP_AUTH_USER = from;
	 	 SMTP_AUTH_PWD  = senderPassword;  

	      // Sender's email ID needs to be mentioned
	      

	      // Assuming you are sending email from localhost
	      String host = "localhost";

	      // Get system properties
	      Properties props = new Properties();
	      props.setProperty("mail.smtp.host", SMTP_HOST_NAME);
	     // props.put("mail.smtp.host", SMTP_HOST_NAME);
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.debug", "true");
	      props.put("mail.smtp.port", SMTP_PORT);
	      props.put("mail.smtp.socketFactory.port", SMTP_PORT);
	      props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
	      props.put("mail.smtp.socketFactory.fallback", "false");

	     Authenticator auth = new SMTPAuthenticator();
	     Session session = Session.getDefaultInstance(props, auth);

	      // Setup mail server
	      

	      // Get the default Session object.
	      //Session session = Session.getDefaultInstance(properties);

		  
     try{
		    MimeMessage message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));
	         
	         
	         InternetAddress[] addressTo = new InternetAddress[recipients.size()];
	         for (int i = 0; i < recipients.size(); i++)
	         {
	             addressTo[i] = new InternetAddress(recipients.get(i));
	         }
	         message.setRecipients(Message.RecipientType.TO, addressTo);

	         // Set To: header field of the header.
	        // message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));

	         // Set Subject: header field
	         message.setSubject(subject);

	         // Create the message part 
	         BodyPart messageBodyPart = new MimeBodyPart();

	         // Fill the message
	         messageBodyPart.setText(messageBody);
	       if(sendFileName != "" && !sendFileName.equals("INFO")){
	        messageBodyPart.setContent(messageBody, "text/html");
	       }
	         
	         // Create a multipar message
	         Multipart multipart = new MimeMultipart();

	         // Set text message part
	         multipart.addBodyPart(messageBodyPart);

	         // Part two is attachment
	         messageBodyPart = new MimeBodyPart();
	         String filename = sendFileName;
	         DataSource source = new FileDataSource(filename);
	         messageBodyPart.setDataHandler(new DataHandler(source));
	         messageBodyPart.setFileName(filename);
	         multipart.addBodyPart(messageBodyPart);

	         // Send the complete message parts
	         message.setContent(multipart); 

	         // Send message
	        // message.setContent(messageBody, "text/html");
	         
	         if(filename != "" && !filename.equals("INFO")){
	       
	         }else if(filename.equals("INFO")){
	        	// messageBodyPart.setContent(messageBody, "text/plain");
	        	 message.setContent(messageBody, "text/plain");
	        	 
	         }else{
	           // message.setContent(messageBody, "text/plain");
	            message.setContent(messageBody, "text/html");  	 
	           
	         }
	         Transport.send(message);
	         mailErr = "Sent"; 
      }catch (MessagingException mex) {
         mex.printStackTrace();
         mailErr = "notSent";
      }
      return mailErr;
   }
   private class SMTPAuthenticator extends javax.mail.Authenticator
   {

       public PasswordAuthentication getPasswordAuthentication()
       {
           String username = SMTP_AUTH_USER;
           String password = SMTP_AUTH_PWD;
         
           return new PasswordAuthentication(username, password);
       }
   }

}