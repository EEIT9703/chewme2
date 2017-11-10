package com.iii.eeit9703.member.model;  
  
import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException;  
  
import javax.servlet.ServletRequest;  
  

  
/** 
 * 生成帐户激活、重新设置密码的链接 
 */  
public class GenerateLinkUtils {  
      
    private static final String CHECK_CODE = "checkCode";  
      
    public static String generateResetPwdLink(MemVO memberId) {  
        return "http://localhost:8081/CHEWME2/member/resetpwd.jsp?userName="   
                + memberId.getMemberId() + "&" + CHECK_CODE + "=" + generateCheckcode(memberId);  
    }  
      

    public static String generateCheckcode(MemVO memberId) { 
        String userName = memberId.getMemberId();  
        String randomCode = memberId.getRandomCode();  
        return md5(userName + ":" + randomCode);  
    }  
      

    public static boolean verifyCheckcode(MemVO memberId,ServletRequest request) {  
        String checkCode = request.getParameter(CHECK_CODE);  
        return generateCheckcode(memberId).equals(checkCode);  
    }  
  
    private static String md5(String string) {  
        MessageDigest md = null;  
        try {  
            md = MessageDigest.getInstance("md5");  
            md.update(string.getBytes());  
            byte[] md5Bytes = md.digest();  
            return bytes2Hex(md5Bytes);  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
          
        return null;  
    }  
      
    private static String bytes2Hex(byte[] byteArray)  
    {  
        StringBuffer strBuf = new StringBuffer();  
        for (int i = 0; i < byteArray.length; i++)  
        {  
            if(byteArray[i] >= 0 && byteArray[i] < 16)  
            {  
                strBuf.append("0");  
            }  
            strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));  
        }  
        return strBuf.toString();  
    }


	
}  