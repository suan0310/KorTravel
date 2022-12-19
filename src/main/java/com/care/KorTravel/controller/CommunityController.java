package com.care.KorTravel.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.KorTravel.dto.Commun_commentDTO;
import com.care.KorTravel.service.CheckDoubleLoginService;
import com.care.KorTravel.service.CommunityServiceImpl;
import com.care.KorTravel.service.ICommunityService;


@Controller
public class CommunityController {
	
	@Autowired CommunityServiceImpl communityService;
	@Autowired HttpServletRequest request;
	@Autowired HttpServletResponse response;
	@Autowired HttpSession session;
	@Autowired CheckDoubleLoginService check;
	

	@RequestMapping("community")
	public String community(Model model, RedirectAttributes ra,@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage,
			String search, String select, HttpServletRequest req) throws UnknownHostException {
		

		communityService.communityProc(model, currentPage, search, select,req);
		
		return "communityView/community.user";
	}
	@RequestMapping("community_write_proc")
	public String community_write(Model model, String num) {
		communityService.edit(model, num);
		
		return "communityView/community_write.user";
	}

	@PostMapping(value = "/community_uploadImg/upload")
	public ModelAndView image(@RequestParam Map<String, Object> map, MultipartHttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<MultipartFile> uploadFile = request.getFiles("upload");
		
		String imgPath = null;
		
		for(MultipartFile mf : uploadFile) {
			if(uploadFile.get(0).getSize()>0) {
				//파일의 원래 이름
				String originalFileName = mf.getOriginalFilename();
				//파일 확장자
				String ext = originalFileName.substring(originalFileName.indexOf("."));
				//중복된 파일 방지
				String newFilename = UUID.randomUUID()+ext;
				
				
				//현재 경로 알아내기
				String realPath = request.getServletContext().getRealPath("/");
				System.out.println("realPath : " + realPath);
				
//				현재경로/community_uploadImg/파일명 으로 저장
				String savePath = realPath+"community_uploadImg/upload/" + newFilename;
				//브라우저에서 이미지 불러올 때 절대 경로로 불러오면 보안의 위험이 있음. 그래서 상대경로 만들음
				String uploadPath = "./community_uploadImg/upload/"+ newFilename;
				//저장경로로 파일 객체 생성
				File file = new File(savePath);
				//파일 업로드
				mf.transferTo(file);
				imgPath = uploadPath;
				
			}
		}
		mav.addObject("uploaded", true); //업로드 완료
		mav.addObject("url",imgPath); //업로드 파일의 경로

		return mav;
	}
	
	@RequestMapping(value="communityDetail")
	public String communityDetail(Model model, String num, @RequestParam(value="msg", required=false, defaultValue="y")String msg, String hit, RedirectAttributes ra) {
		
		int num1 = Integer.parseInt(num);
        
		if(hit.equals("1")) {
			communityService.hitIncrease(num1);
			hit="0";
		}
		else{
			hit="0";
		}
		if(msg.equals("no")) {
			ra.addFlashAttribute("msg", "로그인 후 이용하세요");
		}
		else {}
		
		return "redirect:communityDetailNoHit?num="+num+"&hit="+hit;
	}
	@RequestMapping(value="communityDetailNoHit")
	public String communityDetail1(Model model, String num, String hit) {
		
		int num1 = Integer.parseInt(num);
		communityService.communityDetail(model,num1);
		communityService.movePage(model, num1);
		communityService.getComment(model,num1);

		
		return "communityView/communityDetail.user";
	}
	
	@RequestMapping(value = "community_write")
	public String writeProc(MultipartHttpServletRequest multi, RedirectAttributes ra) {
		if(multi.getParameter("num")==null || multi.getParameter("num")=="") {

			int result = communityService.writeProc(multi);
			if(result==0) {
				ra.addFlashAttribute("msg", "등록에 실패하였습니다");
				 String referer = request.getHeader("Referer");
				    return "redirect:"+ referer;
			}
			else {
				ra.addFlashAttribute("msg", "성공적으로 등록되었습니다");
				return "redirect:community";
			}
		}
		else {
			int result = communityService.community_edit(multi);
			if(result==0) {
				ra.addFlashAttribute("msg", "수정에 실패하였습니다");
				 String referer = request.getHeader("Referer");
				    return "redirect:"+ referer;
			}
			else {
				ra.addFlashAttribute("msg", "성공적으로 수정되었습니다");
				return "redirect:community";
			}
		}
	}
	
	@RequestMapping(value = "download")
	public void download(String fileName,String writer, HttpServletResponse res) throws Exception {
		if(fileName == "" || fileName.equals("파일 없음"))
			return ;
			
		res.addHeader("Content-disposition", "attachment; filename="+fileName);
		File file = new File(ICommunityService.FILE_LOCATION + "\\"+writer+"\\" + fileName);
		FileInputStream input = new FileInputStream(file);
		FileCopyUtils.copy(input, res.getOutputStream());
		input.close();
		
	}
	
	@RequestMapping(value="my_write_delete")
	public String my_write_delete(String num, RedirectAttributes ra) {
		int result = communityService.my_write_delete(num);
		
		if(result==1) {
			ra.addFlashAttribute("msg", "삭제되었습니다");
		}
		else {
			ra.addFlashAttribute("msg", "삭제에 실패하였습니다");
		}
		return "redirect:community";
	}
		
	
	
	//첫댓글 저장 요청 처리
	@RequestMapping(value="comment_regist", produces = "text/html; charset=UTF-8")
	public String comment_reg(Commun_commentDTO commentDTO){
		
		communityService.saveComment(commentDTO);
		
		return "redirect:communityDetail?hit=0&num="+commentDTO.getWriteNo();

	}
	//대댓글 저장 요청 처리
	@RequestMapping(value="replyReply", produces = "text/html; charset = UTF-8")
	public String replyReply(Commun_commentDTO commentDTO, RedirectAttributes ra) {
		
		if(session.getAttribute("id")==null) {
			
			return "redirect:communityDetail?hit=0&msg=no&num="+commentDTO.getWriteNo();
		}
		communityService.saveReplyReply(commentDTO);
		
		return "redirect:communityDetail?hit=0&num="+commentDTO.getWriteNo();
	}
	
	@RequestMapping(value="replyUpdate")
	public String replyUpdate(Commun_commentDTO commentDTO) {
		communityService.replyUpdate(commentDTO);
		
		return "redirect:communityDetail?hit=0&num="+commentDTO.getWriteNo();
	}
	
	
	@RequestMapping(value="ReplyDelete")
	public String ReplyDelete(Commun_commentDTO commentDTO) {
		communityService.ReplyDelete(commentDTO.getReplyNo(), commentDTO.getWriteNo());
		
		return "redirect:communityDetail?hit=0&num="+commentDTO.getWriteNo();
	}
	
	@ResponseBody
	@RequestMapping(value="commentCount")
	public String commentCount(Model model, @RequestBody(required=false) String obj) {
		int num = Integer.parseInt(obj);
		int result = communityService.commentCount(num);
		if(result==0) {
			return "";
		}
		else {
			return"("+result+")";
		}
		
	}
}


