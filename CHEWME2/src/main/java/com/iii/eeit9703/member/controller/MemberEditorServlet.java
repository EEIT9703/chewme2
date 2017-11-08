package com.iii.eeit9703.member.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.*;

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
@WebServlet("/member/memEditor.do")
public class MemberEditorServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getonemem".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("MsgMap", errorMsgs);
			try {

			} catch (Exception e) {
				// errorMsgs.add(e.getMessage());
				errorMsgs.put("errorIDDup", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/memEditor.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("MsgMap", errorMsgs);
			try {
				Integer memId = new Integer(req.getParameter("memId"));
				String memberId = req.getParameter("memberId");

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
				if (base64 == null || base64.trim().length() == 0) {
					// errorMsgs.add("請放入圖片");
					errorMsgs.put("PicEmpty", "請放入圖片");
				}
				
				MemVO memVO = new MemVO();
				memVO.setMemId(memId);
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
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO);
					System.out.println("2" + errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher("/member/memeditor.jsp");
					failureView.forward(req, res);
					return;
				}

				System.out.println(memberId);
				System.out.println(memId);
				memSvc.updateMem(memId, memberId, memName, memNickN, memPwd, memBirthday, memMail, memAddr,
						memPhone, memIntr, base64);
				String url = "/index.jsp";// 成功後轉交的連結
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				// errorMsgs.add(e.getMessage());
				errorMsgs.put("errorIDDup", e.getMessage());
				System.out.println("4" + errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/member/memeditor.jsp");
				failureView.forward(req, res);
			}

		}
	}

}
