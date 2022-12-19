
package com.care.KorTravel.service;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.KorTravel.dao.MemberDAO;
import com.care.KorTravel.dao.RouteDAO;
import com.care.KorTravel.dto.CalendarDTO;
import com.care.KorTravel.dto.MemberDTO;

@Service
public class MemberServiceImpl implements IMemberService{
	
	@Autowired MemberDAO memberDao;
	@Autowired RouteDAO routeDao;
	@Autowired private HttpSession session;
	
	@Override
	public MemberDTO userInfo(String id) {
		return memberDao.userInfo(id);
	}
	
	
	//이미지 업로드
		@Override
		public void imgUpdate(String id, String profilePhoto) {
			MemberDTO user  = userInfo(id); // 유저아이디로 유저찾음
			System.out.println(user.getEmail());
			user.setProfilePhoto(profilePhoto);
//			System.out.println(profilePhoto+"profilePhoto");
				
			saveProfile(user);
//			System.out.println(user.getProfilePhoto()+" imgUpdate");
		}

		@Override
		public void saveProfile(MemberDTO user) {
//			System.out.println(user.getProfilePhoto()+" save Profile");
			memberDao.saveProfile(user);
		}
	
	
	
	@Override
	public int login(MemberDTO id) {
		
		int result = memberDao.isExistId(id);
		return result;
	}
	
	@Override
	public String member_register(MemberDTO member) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		member.setPw(securePw);
		if(member.getProfilePhoto()==null || member.getProfilePhoto()=="") {
			System.out.println("카카오 로그인 : " + member.getProfilePhoto());
			member.setProfilePhoto("noProfile.png");
		}
		memberDao.member_register(member);
		return "회원가입을 축하합니다";
		
	}

	@Override
	public String loginCheck(MemberDTO member) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		MemberDTO memberDto = memberDao.loginCheck(member);

		if(memberDto==null) {
			return "아이디 또는 비밀번호가 맞지 않습니다.";
		}
		else if(encoder.matches(member.getPw(), memberDto.getPw())==false) {
			return "아이디 또는 비밀번호가 맞지 않습니다.";
		}
		else if(memberDto.getDel().equals("Y")) {
			return "탈퇴한 회원의 아이디입니다";
		}
		return "로그인 성공";
	}

	public int edit_Pw(MemberDTO member) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		member.setPw(securePw);
		int result = memberDao.edit_Pw(member);
		return result;
	}

	@Override
	public boolean userDelete(MemberDTO check) {
		
		String id = (String) session.getAttribute("id");
//		if(check.getPw().equals(check.getConfirmPw())==false) {
//			return false;
//		}       
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		MemberDTO member = memberDao.userInfo(id);
		if(member == null || encoder.matches(check.getPw(), member.getPw())==false) {
			return false;
		}
		memberDao.userDelete(id);
		session.invalidate();
		return true;
	}
	
	@Override
	public boolean userUpdateCheck(MemberDTO check) {
		String id = (String)session.getAttribute("id");
		if(!check.getPw().equals(check.getPw())) {
			return false;
		}
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		MemberDTO member = memberDao.userPassword(id);
//		System.out.println("boolean : " + encoder.matches(check.getPw(), member.getPw()));
		if(member == null || !encoder.matches(check.getPw(), member.getPw())) {
			System.out.println("member : " + member);
			return false;
		}
		MemberDTO user = userInfo(id);
//		user.setPw(member.getPw());
		session.setAttribute("user", user);
		System.out.println("phone : " + user.getPhone());
		return true;
	}

	@Override
	public String userUpdate(MemberDTO user) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		
		String tmp = encoder.encode(user.getPw());
		user.setPw(tmp);
		int result = memberDao.userUpdate(user);
		if(result==1) {
		return "회원수정";}
		return "";
	}

	@Override
	public void lastAccess(String ip, String code, String country) {
		String id = (String)session.getAttribute("id");
		
		String accessList = memberDao.getLastAccess(id);
		String ipList = memberDao.getIp(id);
		String codeList = memberDao.getCode(id);
		String countryList = memberDao.getCountry(id);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String now = sdf.format(date);
		String nowdate = now+",";
		String nowip = ip + ",";
		String nowcode = code + ",";
		String nowcountry = country + ",";
		
		if(accessList==null || accessList=="") {
			memberDao.lastAccess(nowdate,nowip, nowcode, nowcountry, id);
		}
		else {
			String newAccess = "";
			String newIp = "";
			String newCode = "";
			String newCountry = "";
			String[] accesssplit = accessList.split(",");
			String[] accessip = ipList.split(",");
			String[] accesscode = codeList.split(",");
			String[] accesscountry = countryList.split(",");
			if(accesssplit.length==10) {
				for(int i=1; i<=9;i++) {
					newAccess+=accesssplit[i]+",";
					newIp+=accessip[i]+",";
					newCode+=accesscode[i]+",";
					newCountry+=accesscountry[i]+",";
				}
				memberDao.lastAccess(newAccess+nowdate,newIp+nowip,newCode+nowcode,newCountry+nowcountry,id);
			}
			else memberDao.lastAccess(accessList+nowdate,ipList+nowip, codeList+nowcode, countryList+nowcountry,id);
		}


	}


	@Override
	public void getLogin(Model model,String id) {
		id = (String)session.getAttribute("id");
		MemberDTO getLoginList = memberDao.getLogin(id);
		model.addAttribute("getLoginList",getLoginList);
		
	}
	
	@Override
	public String getIPProc(String id) {
		String ip = memberDao.getIpAddress(id);
		String[] ipList = ip.split(",");
		return ipList[ipList.length-1];
		
	}

	@Override
	public void myRouteDelete(String subject) {
		String id = (String)session.getAttribute("id");
		routeDao.deleteCalendar(id,subject);
	}

	@Override
	public ArrayList<CalendarDTO> getMyRouteDetail(String subject) {
		String id = (String)session.getAttribute("id"); 
		return routeDao.getMyRouteDetail(id, subject);
	}

	@Override
	public ArrayList<CalendarDTO> getMyRoute() {
		String id = (String)session.getAttribute("id");
		return routeDao.getMyRoute(id);
	}

	@Override
	public int routeSubjectUpdate(String subject, String memo,String preSubject) {
		String id= (String)session.getAttribute("id");
		return routeDao.routeSubjectUpdate(id,subject,memo,preSubject);
	}


	public String checkSubject(String subject) {
		String id = (String)session.getAttribute("id");
		ArrayList<CalendarDTO> result= routeDao.checkSubject(id,subject);
		if(result==null || result.isEmpty()) {
			return "사용가능";
		}
		return "이미 존재하는 제목입니다.";
		
	}


	


	
}
