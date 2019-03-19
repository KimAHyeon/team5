package global.dclass.team5.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dclass.team5.DAO.MemberDAO;
import global.dclass.team5.VO.Application;
import global.dclass.team5.VO.Member;
import global.dclass.team5.VO.Message;
import global.dclass.team5.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	//회원가입 폼 이동
	@RequestMapping(value="/joinMember", method=RequestMethod.GET)
	public String joinForm() {
		return "/member/joinForm";
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="checkId", method=RequestMethod.GET)
	public int checkId(String id) {
		
		Member result = service.selectMember(id);
		
		if (result != null) {
			return 1;
		}
		
		return 0;
	}
	
	//회원가입
	@RequestMapping(value="joinMember", method=RequestMethod.POST)
	public String joinMember(Member member) {
		
		int result  = service.insertMember(member);
		
		if (result != 1) {
			return "redirect:/joinForm";
		}
		
		return "redirect:/";
	}
	
	//로그인폼 이동
	@RequestMapping(value="loginMember", method=RequestMethod.GET)
	public String loginForm() {
		return "/member/loginForm";
	}
	
	//로그인
	@RequestMapping(value="loginMember", method=RequestMethod.POST)
	public String loginMember(String id, String pw, HttpSession session) {

		Member result = service.selectMember(id);
		
		if (!result.getPw().equals(pw)) {
			return "redirect:/member/loginForm";
		}

		session.setAttribute("loginId", result.getId());
		session.setAttribute("loginName", result.getName());
		session.setAttribute("loginDivision", result.getDivision());
		
		return "home";
	}
	
	//로그아웃
	@RequestMapping(value="logoutMember", method=RequestMethod.GET)
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원정보 보기
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String Memberpage(Model model,HttpSession session) {
	
	
			String id= (String) session.getAttribute("loginId");			
			Member result = service.selectMember(id);
			model.addAttribute("member", result);
		
			return "/member/mypage";
	
	}

	//회원정보 수정폼으로 가기
	@RequestMapping(value="updateMember", method=RequestMethod.GET)
	public String updateMember_GET(HttpSession session,Model model) {

		String id= (String) session.getAttribute("loginId");
		Member result = service.selectMember(id);
		model.addAttribute("member", result);

		return "/member/updateForm";
	}

	//회원정보 수정
	@RequestMapping(value="updateMember", method=RequestMethod.POST)
	public String updateMember(HttpSession session,Member member,Model model) {

		String id= (String) session.getAttribute("loginId");			
		Member member_select = service.selectMember(id);
		member_select.setDepartment(member.getDepartment());

		int result = service.updateMember(member_select);

		if(result ==1) {
				return "redirect:/";
		}

		model.addAttribute("member",  member_select);

		return "/member/mypage";
	}

	//독립게시판 신청하기 폼
	@RequestMapping(value="applicationForm", method=RequestMethod.GET)
	public String applicationForm() {
		return "/member/applicationForm";
	}
	
	//독립게시판 신청하기
	@RequestMapping(value="insertApplication", method=RequestMethod.POST)
	public String insertApplication(Application application, HttpSession session) {

		String id = (String) session.getAttribute("loginId");
		application.setId(id);
		
		if (application.getMember2().equals("")) {
			application.setMemberNum(2);
		} else if (application.getMember3().equals("")) {
			application.setMemberNum(3);
		} else if (application.getMember4().equals("")) {
			application.setMemberNum(4);
		} else {
			application.setMemberNum(5);
		}

		int result = service.insertApplication(application);
		
		if (result != 1) {
			return "redirect:/member/applicationForm";
		}
		
		sendConfirmMessage(id, session);

		return "redirect:/";
	}

	//멤버에게 확인 메세지 보내기
	public void sendConfirmMessage(String id, HttpSession session) {

		String name = (String)session.getAttribute("loginName");

		Application application = service.selectApplication(id);

		Message message1 = new Message();

		message1.setApplicationSeq(application.getApplicationSeq());
		message1.setToId(application.getMember1());
		message1.setMessageContent(name+"様が チーム掲示板に 招待しました。ご同意の場合は受諾のボタンを押してください。");

		service.sendConfirmMessage(message1);

		if (application.getMemberNum() == 3) {
			Message message2 = new Message();

			message2.setApplicationSeq(application.getApplicationSeq());
			message2.setToId(application.getMember2());
			message2.setMessageContent(name+"様が チーム掲示板に 招待しました。ご同意の場合は受諾のボタンを押してください。");

			service.sendConfirmMessage(message2);
		} else if (application.getMemberNum() == 4)  {
			Message message2 = new Message();
			Message message3 = new Message();

			message2.setApplicationSeq(application.getApplicationSeq());
			message2.setToId(application.getMember2());
			message2.setMessageContent(name+"様が チーム掲示板に 招待しました。ご同意の場合は受諾のボタンを押してください。");
			message3.setApplicationSeq(application.getApplicationSeq());
			message3.setToId(application.getMember3());
			message3.setMessageContent(name+"様が チーム掲示板に 招待しました。ご同意の場合は受諾のボタンを押してください。");

			service.sendConfirmMessage(message2);
			service.sendConfirmMessage(message3);
		} else {
			Message message2 = new Message();
			Message message3 = new Message();
			Message message4 = new Message();

			message2.setApplicationSeq(application.getApplicationSeq());
			message2.setToId(application.getMember2());
			message2.setMessageContent(name+"様が チーム掲示板に 招待しました。ご同意の場合は受諾のボタンを押してください。");
			message3.setApplicationSeq(application.getApplicationSeq());
			message3.setToId(application.getMember3());
			message3.setMessageContent(name+"様が チーム掲示板に 招待しました。ご同意の場合は受諾のボタンを押してください。");
			message4.setApplicationSeq(application.getApplicationSeq());
			message4.setToId(application.getMember4());
			message4.setMessageContent(name+"様が チーム掲示板に 招待しました。ご同意の場合は受諾のボタンを押してください。");

			service.sendConfirmMessage(message2);
			service.sendConfirmMessage(message3);
			service.sendConfirmMessage(message4);
		}
	}

	
//	학과 별 가이드라인 셀렉트
	@RequestMapping(value="guideline",method=RequestMethod.GET)
	public String guideline(Member member) {
		
		
		
		return "";
	}
	
	
}
