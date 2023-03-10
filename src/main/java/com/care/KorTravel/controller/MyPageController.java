package com.care.KorTravel.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.KorTravel.dto.CalendarDTO;
import com.care.KorTravel.dto.MemberDTO;
import com.care.KorTravel.service.CommunityServiceImpl;
import com.care.KorTravel.service.ICommunityService;
import com.care.KorTravel.service.InquriyServiceImpl;
import com.care.KorTravel.service.MemberServiceImpl;
import com.care.KorTravel.service.RouteServiceImpl;
import com.google.gson.JsonObject;

@Controller
public class MyPageController {
	@Autowired
	MemberServiceImpl memberService;
	@Autowired
	CommunityServiceImpl comService;
	@Autowired
	InquriyServiceImpl inquiryService;
	@Autowired
	RouteServiceImpl routeService;
	@Autowired HttpSession session;

	@RequestMapping(value = "myPage")
	public String myPage(HttpSession session, Model model, String id) {
		id = (String) session.getAttribute("id");
		if (id == null || id == "") {
			return "main.user";
		}
		model.addAttribute("user", memberService.userInfo(id));
		return "member/myPage.user";

	}

	// ????????? ????????? ??????
	@PostMapping(value = "imageInsert")
	public String imageInsert(HttpServletRequest request, @RequestParam("filename") MultipartFile mFile, Model model,
			HttpSession session) throws Exception {
//		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		String id = (String) session.getAttribute("id");
		MemberDTO user = memberService.userInfo(id);
		String upload_path = "C:\\javas\\project_workspace\\KorTravel\\src\\main\\resources\\static\\image\\profile\\"
				+ id; // ????????? ????????? ???????????? ??????
//		String redirect_url = "redirect:member/myPage.user" ; // ??????????????? ?????? redirect??? url
		File folder = new File(upload_path);

		if (!folder.exists()) {
			try {
				folder.mkdir();
				System.out.println("????????? ????????????");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("?????? ??????");
		}

		try {
			if (user.getProfilePhoto() != null || folder.exists()) { // ?????? ????????? ????????? ????????????
				File file = new File(upload_path + user.getProfilePhoto()); // ?????? + ?????? ??????????????? ????????? ????????????
				file.delete(); // ???????????? ??????
			}
			mFile.transferTo(new File(upload_path + "/" + mFile.getOriginalFilename())); // ????????? ?????????
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		memberService.imgUpdate(id, mFile.getOriginalFilename()); // ????????? ???????????? db??? update
		return "redirect:userUpdateCheck";
	}

	@GetMapping("userUpdateCheck")
	public String userUpdateCheck() {
		return "member/userUpdateCheck.user";
	}

	// ??????????????? ???????????? ??????
	@PostMapping(value = "userUpdateCheck")
	public String userUpdateCheck(MemberDTO check, Model model, HttpSession session) {
//		System.out.println("confirm : " + check.getConfirmPw());
		System.out.println("pw : " + check.getPw());

		boolean b = memberService.userUpdateCheck(check);
		if (b == false) {
			System.out.println("???????????? ??????????");
			model.addAttribute("msg", "??????????????? ???????????????.");
			return "member/userUpdateCheck.user";
		} else {
			return "member/userUpdate.user";
		}
	}

	@GetMapping(value = "userUpdate")
	public String userUpdate(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("user", memberService.userInfo(id));

		return "member/userUpdate.user";
	}

	// ???????????? ??????
	@PostMapping(value = "userUpdate")
	public String userUpdate(MultipartHttpServletRequest multi,  RedirectAttributes ra) {
		String id = (String) session.getAttribute("id");
		
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setZipcode(multi.getParameter("zipcode"));
		member.setAddr1(multi.getParameter("addr1"));
		member.setAddr2(multi.getParameter("addr2"));
		member.setPw(multi.getParameter("pw"));
		member.setPhone(multi.getParameter("phone"));
		
		MemberDTO user = memberService.userInfo(id);
		System.out.println("tlqkf : " + user.getFilename());
		String upload_path = "C:\\javas\\project_workspace\\KorTravel\\src\\main\\resources\\static\\image\\profile\\"
				+ id; // ????????? ????????? ???????????? ??????
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		MultipartFile file = multi.getFile("filename");
		if(file.getSize() != 0) {
			Calendar cal = Calendar.getInstance();
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileName = sdf.format(cal.getTime()) + file.getOriginalFilename();
			member.setFilename(fileName);
			File save = new File(upload_path+"\\" + fileName);
			if(save.exists()==false) {
				save.mkdirs();
			}
			try {
				file.transferTo(save);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			String msg = memberService.userUpdate(member);
			if (msg.equals("????????????")) {
				ra.addFlashAttribute("msg", "?????????????????????. ?????? ????????? ????????????");
				return "redirect:logout?out=no";
			}
		}
		else {
			System.out.println("???????????? ???????");
			member.setFilename(user.getProfilePhoto());
			memberService.userUpdate(member);
			ra.addFlashAttribute("msg", "?????????????????????. ?????? ????????? ????????????.");
			return "redirect:logout?out=no";
		}
		return "redirect:userUpdate";
	}
	

	@GetMapping(value = "userDelete")
	public String userDelete() {
		return "member/userDelete.user";
	}

	@PostMapping(value = "userDelete")
	public String userDelete(MemberDTO check, HttpSession session, Model model) {
		System.out.println(check.getPw() + "/");
		boolean result = memberService.userDelete(check);
		System.out.println("result : " + result);
		if (result == false) {
			model.addAttribute("msg", "??????????????? ???????????? ????????????.");
			return "member/userDelete.user";
		}
		
		model.addAttribute("deleteMsg", "???????????? ????????? ?????????????????????.");
		return "main.user";
	}

	// ???????????? ?????? ??????
	@RequestMapping(value = "myLog")
	public String myLog(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpServletRequest req) {
//		 id = (String)session.getAttribute("id");
		comService.myLog(model, currentPage, req);
		return "member/myLog.user";
	}

	// ?????? ??????
//	@PostMapping(value = "myRoute")
//	public String myRoute(Model model) {
//		return "member/myRoute.user";
//	}

	// ?????? ????????? ??????
	@GetMapping(value = "myLogin")
	public String myLogin(Model model,String id) {
		memberService.getLogin(model,id);
		return "member/myLogin.user";
	}

	// ???????????? ?????????
	@RequestMapping(value = "myInquiry")
	public String myInquiry(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpServletRequest req) {
		inquiryService.inquiryProc(model, currentPage, req);
		return "member/myInquiry.user";
	}

	// ???????????? ??????
	@RequestMapping(value = "inquiryDetail")
	public String inquiryDetail(Model model, int num) {
		inquiryService.inquiryDetail(model, num);
		return "member/inquiryDetail.user";
	}

	// ???????????? ??????
	@GetMapping(value = "inquiryWrite")
	public String inquiryWrite() {
		return "member/inquiryWrite.user";
	}

	// ???????????? ?????? & ??????
	@PostMapping(value = "inquiryWrite")
	// num, title, type, inquiryContent
	public String inquiryWrite(HttpServletRequest req, RedirectAttributes ra) {
		if (req.getParameter("num") == null || req.getParameter("num").equals("")) {
			int result = inquiryService.inquiryWrite(req);
			if (result == 0) {
				return "redirect:";
			} else {
				ra.addFlashAttribute("msg", "?????????????????????.");
			}
		} else {
			int result = inquiryService.inquiryModifyProc(req);
			if (result != 0)
				ra.addFlashAttribute("msg", "?????????????????????.");
		}
		return "redirect:myInquiry";
	}

	// ???????????? ??????
	@RequestMapping(value = "inquiryModifyProc")
	public String inquiryModifyProc(Model model, int num) {
		inquiryService.inquiryDetail(model, num);
		return "member/inquiryWrite.user";
	}

	// ???????????? ??????
	@RequestMapping("inquiryDeleteProc")
	public String inquiryDeleteProc(@RequestParam("num") int num, RedirectAttributes ra) {
		int check = inquiryService.inquiryDeleteProc(num);
		if (check == 1) {
			ra.addFlashAttribute("msg", "?????????????????????.");
		} else {
			ra.addFlashAttribute("msg", "?????? ??????????????????.");
		}
		return "redirect:myInquiry";
	}
	// ?????? ?????? 
	@GetMapping(value = "myRoute")
	public String myRoute(Model model) {
		ArrayList<CalendarDTO> tmp = memberService.getMyRoute();
//		System.out.println(tmp+"tmp");
		
		// ??? ?????? ????????? ?????? ?????? ??????????????? ?????? ??????.
		if (tmp.size() == 0)
			return "member/myRoute.user";
		
		ArrayList<String> subject = new ArrayList<>(),
						  image = new ArrayList<>(),
						  calendar_start = new ArrayList<>(),
						  calendar_end = new ArrayList<>();
		
//		subject.add(tmp.get(0).getSubject());
//		image.add(tmp.get(0).getFirstImage2());
//		calendar_start.add(tmp.get(0).getCalendar_start());
//		calendar_end.add(tmp.get(0).getCalendar_end());
		
		for (int cnt = 0; cnt < tmp.size(); cnt++) {
			if (cnt + 1 < tmp.size()) {
				if (!tmp.get(cnt).getSubject().equals(tmp.get(cnt + 1).getSubject())) {
					image.add(tmp.get(cnt).getFirstImage2());
					subject.add(tmp.get(cnt).getSubject());
					calendar_start.add(tmp.get(cnt).getCalendar_start());
					calendar_end.add(tmp.get(cnt).getCalendar_end());
				}
			}
		}
		// index : 0?????????
		// size : 1???;
		if (!(tmp.size() <= 1)) {	//tmp(??????) 2??? ???????????? ??????
			if (!tmp.get(tmp.size() - 1).equals(tmp.get(tmp.size() - 2).getTitle())) {
				//tmp??? ???????????? 12????????? index??? 11??????????????? -1????????????.
				image.add(tmp.get(tmp.size() - 1).getFirstImage2());
				subject.add(tmp.get(tmp.size() - 1).getSubject());
				calendar_start.add(tmp.get(tmp.size() - 1).getCalendar_start());
				calendar_end.add(tmp.get(tmp.size() - 1).getCalendar_end());
			}
		}
		model.addAttribute("subject", subject);
		model.addAttribute("image", image);
		model.addAttribute("calendar_start", calendar_start);
		model.addAttribute("calendar_end", calendar_end);
		
		return "member/myRoute.user";
	}

	// ?????? ?????? ??????
	@GetMapping(value = "myRouteDetail")
	public String getMyRouteDetail(Model model,String subject) {
		model.addAttribute("myRouteDetail", memberService.getMyRouteDetail(subject));
		model.addAttribute("subjectCheck",memberService.getMyRoute());
		System.out.println("mrd : " + memberService.getMyRouteDetail(subject));
		return "member/myRouteDetail.user";
	}
	
	@ResponseBody
	@PostMapping(value="checkSubject", produces = "text/html; charset=UTF-8")
	public String checkSubject(@RequestBody String subject) {
		String result = memberService.checkSubject(subject);
		return result;
	}

	//?????? ??????
	@PostMapping("routeSubjectUpdate")
	public String routeSubjectUpdate(String subject,String memo,String preSubject) {
//		System.out.println("subject" +subject + "preSubject"+preSubject +"memo"+memo );
		memberService.routeSubjectUpdate(subject,memo,preSubject);
		return "redirect:myRoute";
	}
	//?????? ?????? ??????
	@RequestMapping("myRouteDelete")
	public String myRouteDelete(String subject, RedirectAttributes ra) {
		System.out.println("subject : " + subject);
		memberService.myRouteDelete(subject);
		return "redirect:myRoute";
	}

}