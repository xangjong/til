package com.spring_boot.MiniProject.controller;

import java.io.File;
import java.io.IOException;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot.MiniProject.model.UserVO;
import com.spring_boot.MiniProject.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	PasswordEncoder pwEncoder;

	// 로그인페이지 보기
	@RequestMapping("/test/loginForm")
	public String viewlogin() {
		return "/test/loginForm";
	}

	// 회원가입페이지 보기
	@RequestMapping("/test/joinForm")
	public String viewjoin() {
		return "/test/joinForm";
	}
	
	// 회원가입성공 페이지 보기
	@RequestMapping("/test/joinComplete")
	public String viewjoinComplete() {
		return "/test/joinComplete";
	}

	// 마이페이지 보기
	@RequestMapping("/test/myPage/{userId}")
	public String viewMyPage(@PathVariable String userId, Model model) {
		UserVO vo = userService.selectUser(userId);
		
		model.addAttribute("user", vo);
		
		return "/test/myPage";
	}
	
	// 마이페이지 수정 보기
	@RequestMapping("/test/myPageEdit/{userId}")
	public String viewMyPageEdit(@PathVariable String userId, Model model) {
		UserVO vo = userService.selectUser(userId);

		model.addAttribute("user", vo);
		
		return "/test/myPageEdit";
	}

	@RequestMapping("/test/selectAllUser")
	public String selectAllUser(Model model) {
		model.addAttribute("userList", userService.selectAllUser());
		return "/test/selectAllUserView";
	}

	// 로그인 처리
	@ResponseBody
	@RequestMapping("/test/login")
	public String userlogin(
			@RequestParam("userId") String userId,
			@RequestParam("userPw") String userPw,
			HttpSession session) {

		UserVO vo = userService.selectUser(userId);

		// vo가 null이면 로그인 실패
		if (vo == null) {
			return "FAIL";
		} else {
			
			if(!pwEncoder.matches(userPw, vo.getUserPw()))
				return "FAIL";				
			
			// 세션저장
			session.setAttribute("sid", vo.getUserId());
			session.setAttribute("userNickname", vo.getUserNickname());
			session.setAttribute("userImg", vo.getUserImg());
			session.setAttribute("roll", vo.getRoll());
			return "SUCCESS";

		}

	}

	// 로그아웃 처리
	@RequestMapping("/test/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/test";
	}
	
	// 회원가입
	@ResponseBody
	@RequestMapping("/test/join")
	public String userJoin(@RequestParam("userName") String userName,
						   @RequestParam("userNickname") String userNickname,
						   @RequestParam("userId") String userId,
						   @RequestParam("userEmail") String userEmail,
						   @RequestParam("userPw") String userPw,
						   HttpSession session) {
		
		UserVO vo = new UserVO();
		vo.setUserName(userName);
		vo.setUserNickname(userNickname);
		vo.setUserId(userId);
		vo.setUserEmail(userEmail);
		vo.setUserPw(userPw);
		
		userService.insertUser(vo);
		
		// 세션저장
		session.setAttribute("sid", vo.getUserId());
		session.setAttribute("userNickname", vo.getUserNickname());
		session.setAttribute("userImg", vo.getUserImg());
		session.setAttribute("roll", vo.getRoll());
		
		return "SUCCESS";
	}
	
	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping("/test/chkNickname")
	public String chkUserNickname(@RequestParam("userNickname") String userNickname) {
		String result = "";
		String nickname = userService.chkNickname(userNickname);
		
		if(nickname != null)
			result = "FIND";
		
		return result;
	}
	
	// ID 중복 체크
	@ResponseBody
	@RequestMapping("/test/chkId")
	public String chkUserId(@RequestParam("userId") String userId) {
		String result = "";
		String id = userService.chkId(userId);
		
		if(id != null)
			result = "FIND";
		
		return result;
	}
	
	// Email 중복 체크
	@ResponseBody
	@RequestMapping("/test/chkEmail")
	public String chkUserEmail(@RequestParam("userEmail") String userEmail) {
		String result = "";
		String email = userService.chkEmail(userEmail);

		if(email != null)
			result = "FIND";
		
		return result;
	}
	
	@RequestMapping("/test/userController")
	public String userContrller() {
		return "/test/userController";
	}
	
	// 마이페이지 수정(이미지 추가, 항목 수정)
	@ResponseBody
	@RequestMapping("/test/updateUser")
	public String viewImgUpload(@RequestParam("uploadFile") MultipartFile file,
								@RequestParam("sessionFile") String sessionFile,
								@RequestParam("userId") String userId,
								@RequestParam("userName") String userName,
								@RequestParam("userNickname") String userNickname,
								@RequestParam("userCompany") String userCompany,
								@RequestParam("userEmail1") String userEmail1,
								@RequestParam("userEmail2") String userEmail2,
								@RequestParam("userPw") String userPw,
								HttpSession session) throws IOException {
		UserVO vo = new UserVO();
		String userEmail = userEmail1 + "@" +  userEmail2;

		vo.setUserName(userName);
		vo.setUserNickname(userNickname);
		vo.setUserId(userId);
		vo.setUserEmail(userEmail);
		vo.setUserCompany(userCompany);
		
		// 1. 파일 저장 경로 설정 : 실제 서비스 되는 위치(프로젝트 외부에 저장)
		String uploadPath = "c:/springWorkspace/upload/";
		// c:대소문자 상관없으며 마지막에 '/' 있어야 한다
		
		// 2. 원본 파일 이름 설정
		String originalFileName = file.getOriginalFilename();
		// 이미지가 추가되었을 때
		if(!originalFileName.equals("")) { 
			// 3. 파일 이름이 중복되지 않도록 파일 이름 변경
			// 사용자명과 조합하여 파일명 생성

			String savedFileName = userName + "_" + originalFileName;
			
			// 4. 파일 생성
			File newFile = new File(uploadPath + savedFileName);
			
			// 5. 서버로 전송
			file.transferTo(newFile);
			
			// 6. DB에 저장
			vo.setUserImg(savedFileName);
		} else {	// 이미지가 추가되지 않은 경우
			// 기존 추가된 이미지가 있을 경우
			if(!sessionFile.equals(""))
				vo.setUserImg(sessionFile);
		}
		
		
		if(!userPw.equals("")) {
			// 비밀번호 암호화 처리한 후 서비스에게 전달
			String encodedPwd = pwEncoder.encode(userPw);
			vo.setUserPw(encodedPwd);
		} else {
			UserVO voPw = userService.selectUser(userId);
			vo.setUserPw(voPw.getUserPw());
		}
		
		// 항목 수정
		userService.updateUser(vo);
		
		// 세션저장
		session.setAttribute("userNickname", vo.getUserNickname());
		session.setAttribute("userImg", vo.getUserImg());
					
		return "SUCCESS";
	}
	
	// 마이페이지 탈퇴
	@ResponseBody
	@RequestMapping("/test/quitUser")
	public String viewQuitUser(@RequestParam("userId") String userId,
							   HttpSession session) {
		// 탈퇴
		userService.quitUser(userId);
		session.invalidate();
		return "SUCCESS";
	}
}
