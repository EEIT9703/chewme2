package com.iii.eeit9703.member.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.iii.eeit9703.member.model.MemService;
import com.iii.eeit9703.member.model.MemVO;

@MultipartConfig
@WebServlet("/member/register.do")
public class RegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter rw = res.getWriter();
		String action = req.getParameter("action");	
		
		if ("insert".equals(action)) {
			// List<String> errorMsgs = new LinkedList<String>();
			Map<String, String> errorMsgs = new HashMap<String, String>();
			// req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("MsgMap", errorMsgs);
			try {
				String memberId = req.getParameter("memberId");
				if (memberId == null || memberId.trim().length() == 0) {
					// errorMsgs.add("帳號欄位必須輸入");
					errorMsgs.put("IDEmpty", "帳號欄位必須輸入;");
				}

				String memName = req.getParameter("memName");
				if (memName == null || memName.trim().length() == 0) {
					// errorMsgs.add("姓名欄位必須輸入");
					errorMsgs.put("NameEmpty", "姓名欄位必須輸入;");
				}
				String memNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!memName.trim().matches(memNameReg)) {
					// errorMsgs.add("姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
					errorMsgs.put("NameFormatError", "姓名格式錯誤:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}
				String memNickN = req.getParameter("memNickN");
				if (memNickN == null || memNickN.trim().length() == 0) {
					// errorMsgs.add("暱稱欄位必須輸入");
					errorMsgs.put("NickNEmpty", "暱稱欄位必須輸入;");
				}
				String memPwd = req.getParameter("memPwd");
				if (memPwd == null || memPwd.trim().length() == 0) {
					// errorMsgs.add("密碼欄位必須輸入");
					errorMsgs.put("PswdEmpty", "密碼欄位必須輸入;");
				}
				java.sql.Date memBirthday = null;
				try {
					memBirthday = java.sql.Date.valueOf(req.getParameter("memBirthday"));
				} catch (IllegalArgumentException e) {
					memBirthday = new java.sql.Date(System.currentTimeMillis());
					// errorMsgs.add("生日欄位必須選擇");
					errorMsgs.put("BirthdayEmpty", "生日欄位必須選擇;");
				}
				String memMail = req.getParameter("memMail");
				if (memMail == null || memMail.trim().length() == 0) {
					// errorMsgs.add("信箱欄位必須輸入");
					errorMsgs.put("MailEmpty", "信箱欄位必須輸入;");
				}
				String emailReg = "^([\\w]+)(([-\\.][\\w]+)?)*@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
				if (!memMail.trim().matches(emailReg)) {
					// errorMsgs.add("信箱格式錯誤");
					errorMsgs.put("MailFormatError", "信箱格式錯誤;");
				}
				String memAddr = req.getParameter("memAddr");
				if (memAddr == null || memAddr.trim().length() == 0) {
					// errorMsgs.add("地址欄位必須輸入");
					errorMsgs.put("AddrEmpty", "地址欄位必須輸入;");
				}
				String memPhone = req.getParameter("memPhone");
				if (memPhone == null || memPhone.trim().length() == 0) {
					// errorMsgs.add("電話欄位必須輸入");
					errorMsgs.put("PhoneEmpty", "電話欄位必須輸入;");
				}
				String memIntr = req.getParameter("memIntr");
				if (memIntr == null || memIntr.trim().length() == 0) {
					// errorMsgs.add("自我介紹必須輸入");
					errorMsgs.put("IntrEmpty", "自我介紹必須輸入;");
				}
				InputStream is = null;
				ByteArrayOutputStream bos = null;
				Part memPhoto = req.getPart("memPhoto");
				
				is = memPhoto.getInputStream();
				int len;
				int size = 1024;
				byte[] buf;

				bos = new ByteArrayOutputStream();
				buf = new byte[size];
				while ((len = is.read(buf, 0, size)) != -1)
					bos.write(buf, 0, len);
				buf = bos.toByteArray();
				String base64 = Base64.getEncoder().encodeToString(buf);
//				if (base64 == null||base64.trim().length()==0) {
//					// errorMsgs.add("請放入圖片");
//					errorMsgs.put("PicEmpty", "請放入圖片");
//				}
				System.out.println(base64);
				MemVO memVO = new MemVO();
				memVO.setMemberId(memberId);
				memVO.setMemName(memName);
				memVO.setMemNickN(memNickN);
				memVO.setMemPwd(memPwd);
				memVO.setMemBirthday(memBirthday);
				memVO.setMemMail(memMail);
				memVO.setMemAddr(memAddr);
				memVO.setMemPhone(memPhone);
				memVO.setMemAddr(memIntr);
				memVO.setMemPhoto(base64);

				MemService memSvc = new MemService();
				if (memSvc.idExists(memberId)) {
					// errorMsgs.add("帳號已存在");
					errorMsgs.put("IDExistError", "帳號已存在");
					rw.write("<script>alert('帳號已存在！'); history.go(-1);</script>");  
		            return; 
				}
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO);
					rw.write("<script>alert('註冊失敗,請確認您的資料！'); history.go(-1);</script>");  
		            return; 
				}

				memVO = memSvc.addMem(memberId, memName, memNickN, memPwd, memBirthday, memMail, memAddr, memPhone,
						memIntr, base64);
//				String url = "/member/login.jsp";// 成功後轉交的連結 
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
				
				rw.write("<script>alert('註冊成功'); history.go(-1);</script>");
			} catch (Exception e) {
				// errorMsgs.add(e.getMessage());
				errorMsgs.put("errorIDDup", e.getMessage());
				rw.write("<script>alert('註冊失敗,請確認您的資料！'); history.go(-1);</script>");  
	            return; 
			}

		}
		
	}

}
