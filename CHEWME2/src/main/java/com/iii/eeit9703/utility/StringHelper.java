package com.iii.eeit9703.utility;

import java.io.UnsupportedEncodingException;

public class StringHelper {
	 
    // convert from UTF-8 -> internal Java String format
    public static String convertFromUTF8(String s) {
        String out = null;
        try {
            out = new String(s.getBytes("ISO-8859-1"), "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            return null;
        }
        return out;
    }
 
    // convert from internal Java String format -> UTF-8
    public static String convertToUTF8(String s) {
        String out = null;
        try {
            out = new String(s.getBytes("UTF-8"), "ISO-8859-1");
        } catch (java.io.UnsupportedEncodingException e) {
            return null;
        }
        return out;
    }
    public static void testEncode(String target) throws UnsupportedEncodingException{
        System.out.println(target.getBytes());
        System.out.println(target.getBytes("GB2312"));
        System.out.println(target.getBytes("ISO8859_1"));
        System.out.println(new String(target.getBytes()));
        System.out.println(new String(target.getBytes(),"UTF-8"));
        System.out.println(new String(target.getBytes(), "GB2312"));
        System.out.println(new String(target.getBytes(), "ISO8859_1"));
        System.out.println(new String(target.getBytes("GB2312")));
        System.out.println(new String(target.getBytes("GB2312"), "GB2312"));
        System.out.println(new String(target.getBytes("GB2312"), "ISO8859_1"));
        System.out.println(new String(target.getBytes("ISO8859_1")));
        System.out.println(new String(target.getBytes("ISO8859_1"), "GB2312"));
        System.out.println(new String(target.getBytes("ISO8859_1"), "ISO8859_1"));
    }
    
 
    public static void main(String[] args) {
        String xmlstring = "Здравей' хора";
        String utf8string = StringHelper.convertToUTF8(xmlstring);
        for (int i = 0; i < utf8string.length(); ++i) {
            System.out.printf("%x ", (int) utf8string.charAt(i));
        }
    }
}