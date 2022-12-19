package com.care.KorTravel.controller;

import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.KorTravel.service.CheckDoubleLoginService;
import com.care.KorTravel.service.MainServiceImpl;
import com.care.KorTravel.service.NaverLoginService;

@Controller
public class HomeController {
	@Autowired HttpSession session;
	@Autowired NaverLoginService naverLoginService;
	@Autowired MainServiceImpl mainService;
	@Autowired CheckDoubleLoginService svc;
	
	@RequestMapping("main")
	public String main(Model model) {
		String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
		session.setAttribute("url",naverAuthUrl);
		mainService.recommendSights(model);
		mainService.getNotice(model);
		return "main.user";
	}
	
	@RequestMapping("register")
	public String register(RedirectAttributes ra) throws UnknownHostException {
		CheckDoubleLoginService check = new CheckDoubleLoginService();
		if(session.getAttribute("id")!=null) {
		String result = check.CheckDoubleLogin((String)session.getAttribute("id"));
		if(result.equals("다른 곳에서 로그인되었습니다")) {
			ra.addFlashAttribute("msg", result);
			return "redirect:logout";
		}
		}
		return "member/register.user";
	}
	

	@RequestMapping("duplicateLoginCheck")
	public String duplicateLoginCheck(String path, RedirectAttributes ra) throws UnknownHostException {
		if (session.getAttribute("id") != null) {
			String result = svc.CheckDoubleLogin((String) session.getAttribute("id"));
			
			if (result.equals("다른 곳에서 로그인되었습니다")) {
				ra.addFlashAttribute("msg", result);
				return "redirect:logout";
			}
		}
		return path;
	}
	
}
