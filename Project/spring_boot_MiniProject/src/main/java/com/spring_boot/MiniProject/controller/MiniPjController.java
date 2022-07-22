package com.spring_boot.MiniProject.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.spring_boot.MiniProject.model.CategoryVO;
import com.spring_boot.MiniProject.model.CommentVO;
import com.spring_boot.MiniProject.model.NoteVO;
import com.spring_boot.MiniProject.model.UserVO;
import com.spring_boot.MiniProject.service.NoteService;
import com.spring_boot.MiniProject.service.UserService;

@Controller
public class MiniPjController {

	@Autowired
	UserService userService;

	@Autowired
	NoteService noteService;

	@Autowired
	PasswordEncoder pwEncoder;

	@RequestMapping("/")
	public String viewIndex() {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/test")
	public String test() {
		
		for(int i=0;i<50;i++) {
			NoteVO vo = new NoteVO();

			vo.setUserId("hong");
			vo.setCategoryId(2);
			vo.setNoteTitle("자유게시판"+i);
			vo.setNote("<p><img style=\"width: 480px;\" src=\"http://localhost:8080/summernote_upload/96c709b1-60b0-4413-a3fb-f9a5081635db.png\"><br></p>");

			noteService.InsertNote(vo);
			
			
		}
		return "";
		
	}
	

	// ********************** 게시판 *********************

	// 공지사항페이지 보기
	@RequestMapping("/noticePage")
	public String viewNoticePage(@RequestParam(required = false) Integer page,
			@RequestParam(required = false) String tag, @RequestParam(required = false) String title,
			@RequestParam(required = false) String filter, Model model) {

		if (page == null)
			return "/subPage/noticePage";

		System.out.println("title" + title);
		System.out.println("tag" + tag);

		if (filter == null || filter == "")
			filter = "noteId";

		System.out.println(filter);

		ArrayList<String> hashtagList = noteService.selectHashtag();

		ArrayList<NoteVO> noteList;
		int maxCount = 0;

		if (tag == null || tag == "") {
			noteList = noteService.selectNoteListTitle(page * 12, 0, title, filter);
			maxCount = noteService.selectNoteListTitleCount(title, 0);
		} else {
			noteList = noteService.selectNoteListHashtag(page * 12, 0, title, tag, filter);
			maxCount = noteService.selectNoteListHashtagCount(title, 0, tag);
		}

		for (int i = 0; i < noteList.size(); i++) {
			ArrayList<String> hashtag = new ArrayList<String>();
			if (noteList.get(i).getHashName1() != null) {
				hashtag.add(noteList.get(i).getHashName1());
			}
			if (noteList.get(i).getHashName2() != null) {
				hashtag.add(noteList.get(i).getHashName2());
			}
			if (noteList.get(i).getHashName3() != null) {
				hashtag.add(noteList.get(i).getHashName3());
			}
			if (noteList.get(i).getHashName4() != null) {
				hashtag.add(noteList.get(i).getHashName4());
			}
			if (noteList.get(i).getHashName5() != null) {
				hashtag.add(noteList.get(i).getHashName5());
			}
			if (noteList.get(i).getHashName6() != null) {
				hashtag.add(noteList.get(i).getHashName6());
			}
			if (noteList.get(i).getHashName7() != null) {
				hashtag.add(noteList.get(i).getHashName7());
			}
			if (noteList.get(i).getHashName8() != null) {
				hashtag.add(noteList.get(i).getHashName8());
			}
			if (noteList.get(i).getHashName9() != null) {
				hashtag.add(noteList.get(i).getHashName9());
			}
			if (noteList.get(i).getHashName10() != null) {
				hashtag.add(noteList.get(i).getHashName10());
			}
			noteList.get(i).setHashname(hashtag);
			noteList.get(i).setUserNickname(userService.selectUserNickname(noteList.get(i).getUserId()));
			noteList.get(i).setUserImg(userService.selectUserImg(noteList.get(i).getUserId()));

			String tagRemove = noteList.get(i).getNote().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>",
					"");
			noteList.get(i).setNote(tagRemove.substring(0, (tagRemove.length() < 120 ? tagRemove.length() : 120)));
		}

		model.addAttribute("hashtagList", hashtagList);
		model.addAttribute("noteList", noteList);
		model.addAttribute("page", page);
		model.addAttribute("maxCount", (int) maxCount / 12);

		return "subPage/noticeSearchResultView";
	}

	// 질문페이지 보기
	@RequestMapping("/questionPage")
	public String viewQuestionPage(@RequestParam(required = false) Integer page,
			@RequestParam(required = false) String tag, @RequestParam(required = false) String title,
			@RequestParam(required = false) String filter, Model model) {

		if (page == null)
			return "subPage/questionPage";

		if (filter == null || filter == "")
			filter = "noteId";

		System.out.println("title " + title);
		System.out.println("tag " + tag);
		System.out.println("page " + page);
		System.out.println("filter " + filter);

		ArrayList<String> hashtagList = noteService.selectHashtag();

		ArrayList<NoteVO> noteList;
		int maxCount = 0;

		if (tag == null || tag == "") {
			noteList = noteService.selectNoteListTitle(page * 12, 1, title, filter);
			maxCount = noteService.selectNoteListTitleCount(title, 1);
		} else {
			noteList = noteService.selectNoteListHashtag(page * 12, 1, title, tag, filter);
			maxCount = noteService.selectNoteListHashtagCount(title, 1, tag);
		}

		for (int i = 0; i < noteList.size(); i++) {
			ArrayList<String> hashtag = new ArrayList<String>();
			if (noteList.get(i).getHashName1() != null) {
				hashtag.add(noteList.get(i).getHashName1());
			}
			if (noteList.get(i).getHashName2() != null) {
				hashtag.add(noteList.get(i).getHashName2());
			}
			if (noteList.get(i).getHashName3() != null) {
				hashtag.add(noteList.get(i).getHashName3());
			}
			if (noteList.get(i).getHashName4() != null) {
				hashtag.add(noteList.get(i).getHashName4());
			}
			if (noteList.get(i).getHashName5() != null) {
				hashtag.add(noteList.get(i).getHashName5());
			}
			if (noteList.get(i).getHashName6() != null) {
				hashtag.add(noteList.get(i).getHashName6());
			}
			if (noteList.get(i).getHashName7() != null) {
				hashtag.add(noteList.get(i).getHashName7());
			}
			if (noteList.get(i).getHashName8() != null) {
				hashtag.add(noteList.get(i).getHashName8());
			}
			if (noteList.get(i).getHashName9() != null) {
				hashtag.add(noteList.get(i).getHashName9());
			}
			if (noteList.get(i).getHashName10() != null) {
				hashtag.add(noteList.get(i).getHashName10());
			}
			noteList.get(i).setHashname(hashtag);
			noteList.get(i).setUserNickname(userService.selectUserNickname(noteList.get(i).getUserId()));
			noteList.get(i).setUserImg(userService.selectUserImg(noteList.get(i).getUserId()));

			String tagRemove = noteList.get(i).getNote().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>",
					"");
			noteList.get(i).setNote(tagRemove.substring(0, (tagRemove.length() < 120 ? tagRemove.length() : 120)));

		}

		model.addAttribute("hashtagList", hashtagList);
		model.addAttribute("noteList", noteList);
		model.addAttribute("page", page);
		model.addAttribute("maxCount", (int) maxCount / 12);

		return "subPage/questionSearchResultView";
	}

	// 자유페이지 보기
	@RequestMapping("/talkPage")
	public String viewtalkPage(
			@RequestParam(required = false) Integer page,
				@RequestParam(required = false) String tag, 
				@RequestParam(required = false) String title,
				@RequestParam(required = false) String filter, 
				Model model) {

			if (page == null)
				return "subPage/talkPage";

			if (filter == null || filter == "")
				filter = "noteId";

			System.out.println("title " + title);
			System.out.println("tag " + tag);
			System.out.println("page " + page);
			System.out.println("filter " + filter);

			ArrayList<String> hashtagList = noteService.selectHashtag();

			ArrayList<NoteVO> noteList;
			int maxCount = 0;

			if (tag == null || tag == "") {
				noteList = noteService.selectNoteListTitle(page * 10, 2, title, filter);
				maxCount = noteService.selectNoteListTitleCount(title, 2);
			} else {
				noteList = noteService.selectNoteListHashtag(page * 10, 2, title, tag, filter);
				maxCount = noteService.selectNoteListHashtagCount(title, 2, tag);
			}

			for (int i = 0; i < noteList.size(); i++) {
				ArrayList<String> hashtag = new ArrayList<String>();
				if (noteList.get(i).getHashName1() != null) {
					hashtag.add(noteList.get(i).getHashName1());
				}
				if (noteList.get(i).getHashName2() != null) {
					hashtag.add(noteList.get(i).getHashName2());
				}
				if (noteList.get(i).getHashName3() != null) {
					hashtag.add(noteList.get(i).getHashName3());
				}
				if (noteList.get(i).getHashName4() != null) {
					hashtag.add(noteList.get(i).getHashName4());
				}
				if (noteList.get(i).getHashName5() != null) {
					hashtag.add(noteList.get(i).getHashName5());
				}
				if (noteList.get(i).getHashName6() != null) {
					hashtag.add(noteList.get(i).getHashName6());
				}
				if (noteList.get(i).getHashName7() != null) {
					hashtag.add(noteList.get(i).getHashName7());
				}
				if (noteList.get(i).getHashName8() != null) {
					hashtag.add(noteList.get(i).getHashName8());
				}
				if (noteList.get(i).getHashName9() != null) {
					hashtag.add(noteList.get(i).getHashName9());
				}
				if (noteList.get(i).getHashName10() != null) {
					hashtag.add(noteList.get(i).getHashName10());
				}
				noteList.get(i).setHashname(hashtag);
				noteList.get(i).setUserNickname(userService.selectUserNickname(noteList.get(i).getUserId()));
				noteList.get(i).setUserImg(userService.selectUserImg(noteList.get(i).getUserId()));

				int begin = noteList.get(i).getNote().indexOf("<img");
				if(begin > 0)
				{
					int begin1 = noteList.get(i).getNote().indexOf("src",begin)+5;
					int end = noteList.get(i).getNote().indexOf("\"",begin1);
					noteList.get(i).setPreView(noteList.get(i).getNote().substring(begin1,end));
					System.out.println(noteList.get(i).getPreView());
				}
				

			}

			model.addAttribute("hashtagList", hashtagList);
			model.addAttribute("noteList", noteList);
			model.addAttribute("page", page);
			model.addAttribute("maxCount", (int) maxCount / 10);
		
		
		return "subPage/talkSearchResultView";
	}

	// 뉴스페이지 보기
	@RequestMapping("/ITNewsPage")
	public String viewITNewsPage() {
		return "subPage/ITNewsPage";
	}

	// 게시글 작성페이지 보기
	@RequestMapping("/writePage")
	public String viewWritePage(Model model, HttpSession session) {

		ArrayList<CategoryVO> categoryList;

		// System.out.println(session.getAttribute("sid"));

		if (session.getAttribute("sid") == null) {
			return "redirect:/";
		} else if (Integer.parseInt(session.getAttribute("roll").toString()) == 0) {
			categoryList = noteService.selectUserCategory();
		} else {
			categoryList = noteService.selectAllCategory();
		}

		model.addAttribute("categoryList", categoryList);

		return "subPage/writePage";
	}

	// 게시글 작성 처리
	@ResponseBody
	@RequestMapping("/write")
	public String write(@RequestParam("categoryId") int categoryId, @RequestParam("noteTitle") String noteTitle,
			@RequestParam("hashtag[]") ArrayList<String> hashtag, @RequestParam("note") String note,
			HttpSession session) {

		if ((int) session.getAttribute("roll") == 0 && categoryId == 0)
			return "FAIL";

		NoteVO vo = new NoteVO();

		vo.setUserId(session.getAttribute("sid").toString());
		vo.setCategoryId(categoryId);
		vo.setNoteTitle(noteTitle);
		vo.setNote(note);

		if (!hashtag.get(0).equals("null")) {
			if (hashtag.size() > 0)
				vo.setHashName1(hashtag.get(0));
			if (hashtag.size() > 1)
				vo.setHashName2(hashtag.get(1));
			if (hashtag.size() > 2)
				vo.setHashName3(hashtag.get(2));
			if (hashtag.size() > 3)
				vo.setHashName4(hashtag.get(3));
			if (hashtag.size() > 4)
				vo.setHashName5(hashtag.get(4));
			if (hashtag.size() > 5)
				vo.setHashName6(hashtag.get(5));
			if (hashtag.size() > 6)
				vo.setHashName7(hashtag.get(6));
			if (hashtag.size() > 7)
				vo.setHashName8(hashtag.get(7));
			if (hashtag.size() > 8)
				vo.setHashName9(hashtag.get(8));
			if (hashtag.size() > 9)
				vo.setHashName10(hashtag.get(9));
		}

		noteService.InsertNote(vo);

		return "SUCCESS";
	}

	// 뷰페이지 보기
	@RequestMapping("/viewPage/{noteId}")
	public String viewViewPage(@PathVariable int noteId, Model model) {

		NoteVO note = noteService.selectNote(noteId);

		if (note.getPageViewState() == 1)
			return "test/error";

		noteService.updateNoteView(noteId);

		ArrayList<String> hashtag = new ArrayList<String>();
		if (note.getHashName1() != null) {
			hashtag.add(note.getHashName1());
		}
		if (note.getHashName2() != null) {
			hashtag.add(note.getHashName2());
		}
		if (note.getHashName3() != null) {
			hashtag.add(note.getHashName3());
		}
		if (note.getHashName4() != null) {
			hashtag.add(note.getHashName4());
		}
		if (note.getHashName5() != null) {
			hashtag.add(note.getHashName5());
		}
		if (note.getHashName6() != null) {
			hashtag.add(note.getHashName6());
		}
		if (note.getHashName7() != null) {
			hashtag.add(note.getHashName7());
		}
		if (note.getHashName8() != null) {
			hashtag.add(note.getHashName8());
		}
		if (note.getHashName9() != null) {
			hashtag.add(note.getHashName9());
		}
		if (note.getHashName10() != null) {
			hashtag.add(note.getHashName10());
		}

		note.setHashname(hashtag);
		note.setUserNickname(userService.selectUserNickname(note.getUserId()));
		note.setUserImg(userService.selectUserImg(note.getUserId()));

		ArrayList<CommentVO> commentList = noteService.selectAllComment(noteId);

		model.addAttribute("note", note);
		model.addAttribute("commentList", commentList);

		

		return "subPage/viewPage";
	}

	// 게시글 수정
	@RequestMapping("/updateNote/{noteId}")
	public String updateNote(@PathVariable int noteId, Model model, HttpSession session) {

		NoteVO note = noteService.selectNote(noteId);

		if (!session.getAttribute("sid").toString().equals(note.getUserId()))
			return "error";

		ArrayList<String> hashtag = new ArrayList<String>();
		if (note.getHashName1() != null) {
			hashtag.add(note.getHashName1());
		}
		if (note.getHashName2() != null) {
			hashtag.add(note.getHashName2());
		}
		if (note.getHashName3() != null) {
			hashtag.add(note.getHashName3());
		}
		if (note.getHashName4() != null) {
			hashtag.add(note.getHashName4());
		}
		if (note.getHashName5() != null) {
			hashtag.add(note.getHashName5());
		}
		if (note.getHashName6() != null) {
			hashtag.add(note.getHashName6());
		}
		if (note.getHashName7() != null) {
			hashtag.add(note.getHashName7());
		}
		if (note.getHashName8() != null) {
			hashtag.add(note.getHashName8());
		}
		if (note.getHashName9() != null) {
			hashtag.add(note.getHashName9());
		}
		if (note.getHashName10() != null) {
			hashtag.add(note.getHashName10());
		}

		note.setHashname(hashtag);
		note.setUserNickname(userService.selectUserNickname(note.getUserId()));
		note.setUserImg(userService.selectUserImg(note.getUserId()));

		model.addAttribute("note", note);

		ArrayList<CategoryVO> categoryList;

		// System.out.println(session.getAttribute("sid"));

		if (session.getAttribute("sid") == null) {
			return "redirect:/";
		} else if (Integer.parseInt(session.getAttribute("roll").toString()) == 0) {
			categoryList = noteService.selectUserCategory();
		} else {
			categoryList = noteService.selectAllCategory();
		}

		model.addAttribute("categoryList", categoryList);

		return "subPage/updatePage";
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public String write(
			@RequestParam("noteId") int noteId, 
			@RequestParam("categoryId") int categoryId,
			@RequestParam("noteTitle") String noteTitle, 
			@RequestParam("hashtag[]") ArrayList<String> hashtag,
			@RequestParam("note") String note, 
			HttpSession session) {

		NoteVO vo = new NoteVO();

		vo.setNoteId(noteId);
		vo.setUserId(session.getAttribute("sid").toString());
		vo.setCategoryId(categoryId);
		vo.setNoteTitle(noteTitle);
		vo.setNote(note);

		if (!hashtag.get(0).equals("null")) {
			if (hashtag.size() > 0)
				vo.setHashName1(hashtag.get(0));
			if (hashtag.size() > 1)
				vo.setHashName2(hashtag.get(1));
			if (hashtag.size() > 2)
				vo.setHashName3(hashtag.get(2));
			if (hashtag.size() > 3)
				vo.setHashName4(hashtag.get(3));
			if (hashtag.size() > 4)
				vo.setHashName5(hashtag.get(4));
			if (hashtag.size() > 5)
				vo.setHashName6(hashtag.get(5));
			if (hashtag.size() > 6)
				vo.setHashName7(hashtag.get(6));
			if (hashtag.size() > 7)
				vo.setHashName8(hashtag.get(7));
			if (hashtag.size() > 8)
				vo.setHashName9(hashtag.get(8));
			if (hashtag.size() > 9)
				vo.setHashName10(hashtag.get(9));
		}

		noteService.updateNote(vo);

		return "SUCCESS";
	}

	// 게시글 삭제
	@RequestMapping("/deleteNote/{noteId}")
	public String deleteNote(@PathVariable int noteId, HttpSession session) {

		noteService.deleteNote(noteId);

		return "redirect:/questionPage";
	}

	// 댓글 작성
	@ResponseBody
	@RequestMapping("/writeComment")
	public String writeComment(@RequestParam int noteId, @RequestParam String comment, Model model,
			HttpSession session) {

		String userId = session.getAttribute("sid").toString();

		if (userId == null)
			return null;

		int userState = userService.selectUserState(userId);

		if (userState != 0)
			return null;

		CommentVO vo = new CommentVO();

		vo.setUserId(userId);
		vo.setNoteId(noteId);
		vo.setComment(comment);

		noteService.insertComment(vo);
		noteService.updateNoteCommentPlus(noteId);

		return "SUCCESS";
	}

	// 해시태그 전체 조회
	@ResponseBody
	@RequestMapping("/getTags")
	public ArrayList<String> getTags() {
		return noteService.selectHashtag();
	}

	@ResponseBody
	@RequestMapping("/getCurrentTags")
	public ArrayList<String> getCurrentTags(@RequestParam("noteId") int notdId) {

		NoteVO note = noteService.selectNoteHashtag(notdId);

		ArrayList<String> hashtag = new ArrayList<String>();
		if (note.getHashName1() != null) {
			hashtag.add(note.getHashName1());
		}
		if (note.getHashName2() != null) {
			hashtag.add(note.getHashName2());
		}
		if (note.getHashName3() != null) {
			hashtag.add(note.getHashName3());
		}
		if (note.getHashName4() != null) {
			hashtag.add(note.getHashName4());
		}
		if (note.getHashName5() != null) {
			hashtag.add(note.getHashName5());
		}
		if (note.getHashName6() != null) {
			hashtag.add(note.getHashName6());
		}
		if (note.getHashName7() != null) {
			hashtag.add(note.getHashName7());
		}
		if (note.getHashName8() != null) {
			hashtag.add(note.getHashName8());
		}
		if (note.getHashName9() != null) {
			hashtag.add(note.getHashName9());
		}
		if (note.getHashName10() != null) {
			hashtag.add(note.getHashName10());
		}

		return hashtag;
	}

	// ********************** 댓글 ***********************************
	// 질문페이지 보기
	@ResponseBody
	@RequestMapping("/updateComment")
	public String updateComment(@RequestParam int commentId, @RequestParam String comment, HttpSession session) {

		String userId = session.getAttribute("sid").toString();

		if (userId == null)
			return null;

		int userState = userService.selectUserState(userId);

		if (userState != 0)
			return null;

		CommentVO vo = new CommentVO();

		vo.setCommentId(commentId);
		vo.setComment(comment);
		vo.setUserId(userId);

		System.out.println(comment);

		noteService.updateComment(vo);

		return "SUCCESS";
	}

	// 질문페이지 보기
	@ResponseBody
	@RequestMapping("/deleteComment")
	public String deleteComment(@RequestParam int commentId, HttpSession session) {

		String userId = session.getAttribute("sid").toString();

		if (userId == null)
			return null;

		int userState = userService.selectUserState(userId);

		if (userState != 0)
			return null;

		CommentVO vo = new CommentVO();

		vo.setCommentId(commentId);
		vo.setUserId(userId);
		vo.setNoteId(noteService.selectNoteId(commentId));

		noteService.deleteComment(vo);
		noteService.updateNoteCommentMinus(vo.getNoteId());

		return "SUCCESS";
	}

	// ************ 게시글 좋아요 ********************

	// 게시글 좋아요 체크 유무
	@ResponseBody
	@RequestMapping("/noteLikeCheck")
	public String noteLikeCheck(@RequestParam("noteId") int noteId, HttpSession session) {

		String userId = session.getAttribute("sid").toString();

		if (userId == null)
			return "FALSE";

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("noteId", noteId);
		map.put("userId", userId);

		if (noteService.selectNoteLike(map) > 0) {
			return "TRUE";
		} else {
			return "FALSE";
		}
	}

	// 게시글 좋아요
	@ResponseBody
	@RequestMapping("/noteLikeUpdate")
	public String noteLikeCUpdate(@RequestParam("noteId") int noteId, HttpSession session) {

		String userId = session.getAttribute("sid").toString();

		if (userId == null)
			return "FALSE";

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("noteId", noteId);
		map.put("userId", userId);

		if (noteService.selectNoteLike(map) > 0) {
			noteService.deleteNoteLike(map);
			noteService.updateNoteLikeMinus(noteId);
			return "FALSE";
		} else {
			noteService.insertNoteLike(map);
			noteService.updateNoteLikePlus(noteId);
			return "TRUE";
		}
	}

	// ***************** 썸머노트 이미지 처리 ******************

	
	@ResponseBody
	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json")
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws IOException {

		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = new ClassPathResource("/static/summernote_upload").getFile().getAbsolutePath(); // 저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		System.out.println(fileRoot + savedFileName);
		
		File targetFile = new File(fileRoot + "/" + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url","http://localhost:8080/summernote_upload/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}

		return jsonObject;
	}

	// ********************** 로그인 *********************

	// 로그인페이지 보기
	@RequestMapping("/loginForm")
	public String viewlogin() {
		return "subPage/loginForm";
	}

	// 로그인 처리
	@ResponseBody
	@RequestMapping("/login")
	public String userlogin(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw,
			HttpSession session) {

		UserVO vo = userService.selectUser(userId);

		// vo가 null이면 로그인 실패
		if (vo == null) {
			return "FAIL";
		} else {

			if (!pwEncoder.matches(userPw, vo.getUserPw()))
				return "FAIL";

			// 세션저장
			session.setAttribute("sid", vo.getUserId());
			session.setAttribute("userNickname", vo.getUserNickname());
			session.setAttribute("userEmail", vo.getUserEmail());
			session.setAttribute("userImg", vo.getUserImg());
			session.setAttribute("roll", vo.getRoll());
			return "SUCCESS";

		}

	}

	// 로그아웃 처리
	@RequestMapping("/logout1")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 아이디찾기 보기
	@RequestMapping("/idSearchForm")
	public String viewidSearchForm() {
		return "subPage/idSearchForm";
	}

	// 비밀번호찾기 보기
	@RequestMapping("/pwSearchForm")
	public String viewpwSearchForm() {
		return "subPage/pwSearchForm";
	}

	// ********************** 회원가입 *********************

	// 회원가입페이지 보기
	@RequestMapping("/joinForm")
	public String viewjoin() {
		return "subPage/joinForm";
	}

	// 회원가입
	@ResponseBody
	@RequestMapping("/join")
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
	
	// 회원가입 완료페이지 보기
	@RequestMapping("/joinComplete")
	public String viewjoinComplete() {
		return "subPage/joinComplete";
	}

	// ********************** 마이페이지 *********************
	// 마이페이지 보기
	@RequestMapping("/myPage/{userId}")
	public String viewMyPage(@PathVariable String userId, Model model) {

		UserVO vo = userService.selectUser(userId);
		
		model.addAttribute("user", vo);
		
		return "/subPage/myPage";
	}
	
	// 마이페이지(질문) 보기
	@RequestMapping("/myPageQuestion/{userId}")
	public String viewMyPageQuestion(@PathVariable String userId, Model model) {

		UserVO vo = userService.selectUser(userId);
		
		model.addAttribute("user", vo);
		
		return "/subPage/myPageQuestion";
	}
	
	// 마이페이지(답변) 보기
	@RequestMapping("/myPageAnswer/{userId}")
	public String viewMyPageAnswer(@PathVariable String userId, Model model) {

		UserVO vo = userService.selectUser(userId);
		
		model.addAttribute("user", vo);
		
		return "/subPage/myPageAnswer";
	}
	
	// 마이페이지(코멘트) 보기
	@RequestMapping("/myPageComment/{userId}")
	public String viewMyPageComment(@PathVariable String userId, Model model) {

		UserVO vo = userService.selectUser(userId);
		
		model.addAttribute("user", vo);
		
		return "/subPage/myPageComment";
	}
	
	// 마이페이지 수정 보기
	@RequestMapping("/myPageEdit/{userId}")
	public String viewMyPageEdit(@PathVariable String userId, Model model) {
		UserVO vo = userService.selectUser(userId);

		model.addAttribute("user", vo);
		
		return "/subPage/myPageEdit";
	}
	
	
	// 마이페이지 보기
	/*
	 * @RequestMapping("/myPage") public String viewMyPage() { return
	 * "subPage/myPage"; }
	 */

	// 마이페이지 질문 보기
	@RequestMapping("/myPageQuestion")
	public String myPageQuestion(
			@RequestParam(required = false) Integer page,
			@RequestParam(required = false) String title,
			@RequestParam(required = false) String filter,
			@RequestParam(required = false) Integer category, 
			HttpSession session,
			Model model) {
		
		String userId = session.getAttribute("sid").toString();
		
		System.out.println("userId"+userId);
		
		if(userId == null)
			return "redirect:/";

		if (page == null)
			return "/subPage/myPageQuestion";

		if (filter == null || filter == "")
			filter = "noteId";

		System.out.println("filter"+filter);

		ArrayList<String> hashtagList = noteService.selectHashtag();

		ArrayList<NoteVO> noteList;
		int maxCount = 0;

		noteList = noteService.selectNoteUserList(page * 6, category, title, filter, userId);
		maxCount = noteService.selectNoteUserListCount(title, category, userId);
		

		for (int i = 0; i < noteList.size(); i++) {
			ArrayList<String> hashtag = new ArrayList<String>();
			if (noteList.get(i).getHashName1() != null) {
				hashtag.add(noteList.get(i).getHashName1());
			}
			if (noteList.get(i).getHashName2() != null) {
				hashtag.add(noteList.get(i).getHashName2());
			}
			if (noteList.get(i).getHashName3() != null) {
				hashtag.add(noteList.get(i).getHashName3());
			}
			if (noteList.get(i).getHashName4() != null) {
				hashtag.add(noteList.get(i).getHashName4());
			}
			if (noteList.get(i).getHashName5() != null) {
				hashtag.add(noteList.get(i).getHashName5());
			}
			if (noteList.get(i).getHashName6() != null) {
				hashtag.add(noteList.get(i).getHashName6());
			}
			if (noteList.get(i).getHashName7() != null) {
				hashtag.add(noteList.get(i).getHashName7());
			}
			if (noteList.get(i).getHashName8() != null) {
				hashtag.add(noteList.get(i).getHashName8());
			}
			if (noteList.get(i).getHashName9() != null) {
				hashtag.add(noteList.get(i).getHashName9());
			}
			if (noteList.get(i).getHashName10() != null) {
				hashtag.add(noteList.get(i).getHashName10());
			}
			noteList.get(i).setHashname(hashtag);
			noteList.get(i).setUserNickname(userService.selectUserNickname(noteList.get(i).getUserId()));
			noteList.get(i).setUserImg(userService.selectUserImg(noteList.get(i).getUserId()));

		}

		model.addAttribute("hashtagList", hashtagList);
		model.addAttribute("noteList", noteList);
		model.addAttribute("page", page);
		model.addAttribute("maxCount", (int) maxCount / 6);
		model.addAttribute("maxCount1", maxCount);

		return "subPage/myPageQuestionResult";
	}

	// 마이페이지 답변 보기
	@RequestMapping("/myPageAnswer")
	public String viewMyPageAnswer() {
		return "subPage/myPageAnswer";
	}

	// ********************** 관리자페이지 *********************

	// 마이페이지 댓글 보기
	@RequestMapping("/myPageComment")
	public String viewMyPageComment() {
		return "subPage/myPageComment";
	}

	// 마이페이지 수정 보기
	@RequestMapping("/myPageEdit")
	public String viewMyPageEditPage() {
		return "subPage/myPageEdit";
	}

}
