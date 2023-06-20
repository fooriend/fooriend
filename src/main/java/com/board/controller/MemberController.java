package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.domain.BoardVO;
import com.board.domain.LikeVO;
import com.board.service.BoardService;
import com.board.service.LikeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.MemberService;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/member/*")
public class MemberController {

private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   @Inject
   MemberService service;

	@Autowired
	private LikeService likeService;

	@Autowired
	private BoardService boardService;

   // 회원 가입 get
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void getRegister() throws Exception {
    logger.info("get register");
   }

   // 회원 가입 post
   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String postRegister(MemberVO vo) throws Exception {
    logger.info("post resister");

    service.register(vo);
    return "redirect:/member/login";
   }

	// 회원 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
	   logger.info("post idCheck");

	   String userId = req.getParameter("userId");
	   MemberVO idCheck =  service.idCheck(userId);

	   int result = 0;

	   if(idCheck != null) {
	    result = 1;
	   }

	   return result;
	}

	//닉네임 확인
	@ResponseBody
	@RequestMapping(value = "/nameCheck", method = RequestMethod.POST)
	public int postNameCheck(HttpServletRequest req) throws Exception {
		logger.info("post nameCheck");

		String userName = req.getParameter("userName");
		MemberVO nameCheck =  service.nameCheck(userName);

		int result1 = 0;

		if(nameCheck != null) {
			result1 = 1;
		}

		return result1;
	}


	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		logger.info("get login");
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, HttpServletResponse response, RedirectAttributes rttr) throws Exception {

	   HttpSession session = req.getSession();
	   MemberVO login = service.login(vo);

	   if(login != null){
		   session.setAttribute("member", login);
		   logger.info("post login");
		   return "redirect:/";
	   }
	   else {
		   logger.info("fail login");
		   response.setContentType("text/html; charset=UTF-8");
		   PrintWriter out = response.getWriter();
		   /*
		   if(login.getUserId()!= vo.getUserId()){
			   out.write("<script>alert('존재하지 않는 아이디입니다.'); location.href='/member/login';</script>");
			   out.flush();
			   out.close();
			   return "redirect:/member/login";
		   } else if (login.getUserPass()!= vo.getUserPass()) {
			   out.write("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='/member/login';</script>");
			   out.flush();
			   out.close();
			   return "redirect:/member/login";
		   } else{*/
			   out.write("<script>alert('로그인에 실패하였습니다.'); location.href='/member/login';</script>");
			   out.flush();
			   out.close();
			   return "redirect:/member/login";

	   }

		/*
		logger.info("post login");
	   if(login == null) {
		   session.setAttribute("member", null);
		   rttr.addFlashAttribute("msg", false);
	   } else {
		   session.setAttribute("member", login);
	   }

	   return "redirect:/";*/
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
	   logger.info("get logout");

	   session.invalidate();

	   return "redirect:/";
	}

	// 회원 정보 수정 get
	@RequestMapping(value = "/modify", method=RequestMethod.GET)
	public void getModify() throws Exception {
		logger.info("get modify");
	}

	// 회원 정보 수정 post
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(HttpSession session, MemberVO vo) throws Exception {
	   logger.info("post modify");

	   service.modify(vo);

	   session.invalidate();

	   return "redirect:/";
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public void getWithdrawal() throws Exception {
	   logger.info("get withdrawal");

	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	public String postWithdrawal(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
	   logger.info("post withdrawal");

	   MemberVO member = (MemberVO)session.getAttribute("member");

	   String oldPass = member.getUserPass();
	   String newPass = vo.getUserPass();

	   if(!(oldPass.equals(newPass))) {
	    rttr.addFlashAttribute("msg", false);
	    return "redirect:/member/withdrawal";
	   }

	   service.withdrawal(vo);

	   session.invalidate();

	   return "redirect:/";
	}

//	// 찜 목록
//	@RequestMapping(value = "/board/likelist", method = RequestMethod.GET)
//	public void likeList(HttpSession session, Model model) throws Exception {
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
//		List<LikeVO> likeList = likeService.listLike(memberVO.getUserId());
//		List<BoardVO> boardList = new ArrayList<BoardVO>();
//		for(LikeVO like : likeList) {
//			BoardVO board = boardService.getBoard(like.getBno());
//			boardList.add(board);
//		}
//		model.addAttribute("likeList", likeList);
//		model.addAttribute("boardList", boardList);
//	}

}
