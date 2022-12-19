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

	// 프로필 이미지 변경
	@PostMapping(value = "imageInsert")
	public String imageInsert(HttpServletRequest request, @RequestParam("filename") MultipartFile mFile, Model model,
			HttpSession session) throws Exception {
//		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		String id = (String) session.getAttribute("id");
		MemberDTO user = memberService.userInfo(id);
		String upload_path = "C:\\javas\\project_workspace\\KorTravel\\src\\main\\resources\\static\\image\\profile\\"
				+ id; // 프로필 사진들 모아두는 폴더
//		String redirect_url = "redirect:member/myPage.user" ; // 사진업로드 이후 redirect될 url
		File folder = new File(upload_path);

		if (!folder.exists()) {
			try {
				folder.mkdir();
				System.out.println("프로필 폴더생성");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("폴더 있음");
		}

		try {
			if (user.getProfilePhoto() != null || folder.exists()) { // 이미 프로필 사진이 있을경우
				File file = new File(upload_path + user.getProfilePhoto()); // 경로 + 유저 프로필사진 이름을 가져와서
				file.delete(); // 원래파일 삭제
			}
			mFile.transferTo(new File(upload_path + "/" + mFile.getOriginalFilename())); // 경로에 업로드
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		memberService.imgUpdate(id, mFile.getOriginalFilename()); // 프로필 사진이름 db에 update
		return "redirect:userUpdateCheck";
	}

	@GetMapping("userUpdateCheck")
	public String userUpdateCheck() {
		return "member/userUpdateCheck.user";
	}

	// 내정보수정 비밀번호 확인
	@PostMapping(value = "userUpdateCheck")
	public String userUpdateCheck(MemberDTO check, Model model, HttpSession session) {
//		System.out.println("confirm : " + check.getConfirmPw());
		System.out.println("pw : " + check.getPw());

		boolean b = memberService.userUpdateCheck(check);
		if (b == false) {
			System.out.println("비밀번호 틀렸냐?");
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
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

	// 회원정보 수정
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
				+ id; // 프로필 사진들 모아두는 폴더
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
			if (msg.equals("회원수정")) {
				ra.addFlashAttribute("msg", "수정되었습니다. 다시 로그인 해주세요");
				return "redirect:logout?out=no";
			}
		}
		else {
			System.out.println("이쪽으로 오냐?");
			member.setFilename(user.getProfilePhoto());
			memberService.userUpdate(member);
			ra.addFlashAttribute("msg", "수정되었습니다. 다시 로그인 해주세요.");
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
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "member/userDelete.user";
		}
		
		model.addAttribute("deleteMsg", "회원탈퇴 처리가 완료되었습니다.");
		return "main.user";
	}

	// 커뮤니티 이용 내역
	@RequestMapping(value = "myLog")
	public String myLog(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpServletRequest req) {
//		 id = (String)session.getAttribute("id");
		comService.myLog(model, currentPage, req);
		return "member/myLog.user";
	}

	// 나의 일정
//	@PostMapping(value = "myRoute")
//	public String myRoute(Model model) {
//		return "member/myRoute.user";
//	}

	// 나의 로그인 기록
	@GetMapping(value = "myLogin")
	public String myLogin(Model model,String id) {
		memberService.getLogin(model,id);
		return "member/myLogin.user";
	}

	// 문의내역 리스트
	@RequestMapping(value = "myInquiry")
	public String myInquiry(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpServletRequest req) {
		inquiryService.inquiryProc(model, currentPage, req);
		return "member/myInquiry.user";
	}

	// 문의내역 상세
	@RequestMapping(value = "inquiryDetail")
	public String inquiryDetail(Model model, int num) {
		inquiryService.inquiryDetail(model, num);
		return "member/inquiryDetail.user";
	}

	// 문의내역 등록
	@GetMapping(value = "inquiryWrite")
	public String inquiryWrite() {
		return "member/inquiryWrite.user";
	}

	// 문의내역 등록 & 수정
	@PostMapping(value = "inquiryWrite")
	// num, title, type, inquiryContent
	public String inquiryWrite(HttpServletRequest req, RedirectAttributes ra) {
		if (req.getParameter("num") == null || req.getParameter("num").equals("")) {
			int result = inquiryService.inquiryWrite(req);
			if (result == 0) {
				return "redirect:";
			} else {
				ra.addFlashAttribute("msg", "등록되었습니다.");
			}
		} else {
			int result = inquiryService.inquiryModifyProc(req);
			if (result != 0)
				ra.addFlashAttribute("msg", "수정되었습니다.");
		}
		return "redirect:myInquiry";
	}

	// 문의내역 확인
	@RequestMapping(value = "inquiryModifyProc")
	public String inquiryModifyProc(Model model, int num) {
		inquiryService.inquiryDetail(model, num);
		return "member/inquiryWrite.user";
	}

	// 문의내역 삭제
	@RequestMapping("inquiryDeleteProc")
	public String inquiryDeleteProc(@RequestParam("num") int num, RedirectAttributes ra) {
		int check = inquiryService.inquiryDeleteProc(num);
		if (check == 1) {
			ra.addFlashAttribute("msg", "삭제되었습니다.");
		} else {
			ra.addFlashAttribute("msg", "다시 시도해주세요.");
		}
		return "redirect:myInquiry";
	}
	// 나의 일정 
	@GetMapping(value = "myRoute")
	public String myRoute(Model model) {
		ArrayList<CalendarDTO> tmp = memberService.getMyRoute();
//		System.out.println(tmp+"tmp");
		
		// 내 일정 없을시 하위 로직 안돌아가게 하기 위함.
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
		// index : 0번부터
		// size : 1개;
		if (!(tmp.size() <= 1)) {	//tmp(일정) 2개 이상일때 실행
			if (!tmp.get(tmp.size() - 1).equals(tmp.get(tmp.size() - 2).getTitle())) {
				//tmp의 사이즈가 12개이면 index는 11이기때문에 -1을해준다.
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

	// 나의 일정 상세
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

	//주제 수정
	@PostMapping("routeSubjectUpdate")
	public String routeSubjectUpdate(String subject,String memo,String preSubject) {
//		System.out.println("subject" +subject + "preSubject"+preSubject +"memo"+memo );
		memberService.routeSubjectUpdate(subject,memo,preSubject);
		return "redirect:myRoute";
	}
	//나의 일정 삭제
	@RequestMapping("myRouteDelete")
	public String myRouteDelete(String subject, RedirectAttributes ra) {
		System.out.println("subject : " + subject);
		memberService.myRouteDelete(subject);
		return "redirect:myRoute";
	}

}