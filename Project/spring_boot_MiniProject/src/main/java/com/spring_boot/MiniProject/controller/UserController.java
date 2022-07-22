package com.spring_boot.MiniProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
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

//임의 난수 생성 패키지


@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	PasswordEncoder pwEncoder;

	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping("/subPage/chkNickname")
	public String chkUserNickname(@RequestParam("userNickname") String userNickname) {
		String result = "";
		String nickname = userService.chkNickname(userNickname);
		
		if(nickname != null)
			result = "FIND";
		
		return result;
	}
	
	// ID 중복 체크
	@ResponseBody
	@RequestMapping("/subPage/chkId")
	public String chkUserId(@RequestParam("userId") String userId) {
		String result = "";
		String id = userService.chkId(userId);
		
		if(id != null)
			result = "FIND";
		
		return result;
	}
	
	// Email 중복 체크
	@ResponseBody
	@RequestMapping("/subPage/chkEmail")
	public String chkUserEmail(@RequestParam("userEmail") String userEmail) {
		String result = "";
		String email = userService.chkEmail(userEmail);

		if(email != null)
			result = "FIND";
		
		return result;
	}
	
	@RequestMapping("/subPage/userController")
	public String userContrller() {
		return "/subPage/userController";
	}
	
	// 마이페이지 수정(이미지 추가, 항목 수정)
	@ResponseBody
	@RequestMapping("/subPage/updateUser")
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
		String uploadPath = "/Library/springWorkspace/upload/";
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
	
	// 마이페이지 회원 탈퇴
	@ResponseBody
	@RequestMapping("/subPage/quitUser")
	public String viewQuitUser(@RequestParam("userId") String userId,
							   HttpSession session) {
		// 탈퇴
		userService.quitUser(userId);
		session.invalidate();
		return "SUCCESS";
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/subPage/idSearch")
	public String viewIdSearch(@RequestParam HashMap<String, Object> param) {
		
		String result = userService.searchId(param);
		
		return result;
	}
	
	// 아이디 찾기 후 로그인 화면 이동
	@RequestMapping("/loginForm/{userId}")
	public String viewIdlogin(@PathVariable String userId, Model model) {
		model.addAttribute("userId", userId);
		
		return "/subPage/loginForm";
	}
	
	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping("/subPage/pwSearch")
	public String viewPwSearch(@RequestParam HashMap<String, Object> param) {
		
		String result = userService.searchPw(param);
		
		return result;
	}
	
	// 비밀번호 찾기 후 페이지 이동
	@RequestMapping("/subPage/pwComplete/{userId}")
	public String viewPwComplete(@PathVariable String userId,
								 HttpSession session, Model model) {
		
		// 8자리의 임의 문자열 생성
		String tmpPw = RandomStringUtils.randomAlphanumeric(8);
		
		model.addAttribute("tmpPw", tmpPw);
		
		// 비밀번호 암호화 처리한 후 서비스에게 전달
		String userPw = pwEncoder.encode(tmpPw);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		
		// 임시 비밀번호 반영
		userService.updateTmpPw(map);
		
		//반영 후 자동 로그인 하기 위해 해당 유저 조회
		UserVO vo = userService.selectUser(userId);
		
		// 세션저장
		session.setAttribute("sid", vo.getUserId());
		session.setAttribute("userNickname", vo.getUserNickname());
		session.setAttribute("userImg", vo.getUserImg());
		session.setAttribute("roll", vo.getRoll());
		
		return "/subPage/pwComplete";
	}
}
