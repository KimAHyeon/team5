package global.dclass.team5.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dclass.team5.DAO.CalendarDAO;
import global.dclass.team5.DAO.MemberDAO;
import global.dclass.team5.VO.Calendar;
import global.dclass.team5.VO.Member;
import global.dclass.team5.service.CalendarService;
import global.dclass.team5.service.MemberService;

@Controller
public class CalendarController {

	@Autowired
	CalendarService service;
	
	@Autowired
	MemberService member_service;
	 
	@RequestMapping(value="calendar",method=RequestMethod.GET)
	public String selectCalendar(Member member, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("loginId");
		
		Member memberInfo = member_service.selectMember(id);
		
		System.out.println(memberInfo);
		
		
		ArrayList<Calendar> select = service.selectCalendar(memberInfo);
	
		if(select != null) {			
			model.addAttribute("Calendar", select);		
			
			return "/calendar/calendar";
			
		}else {
						
		return "redirect:/member/mypage";
		
		}
	}
	
	@ResponseBody
	@RequestMapping(value="calendar",method=RequestMethod.POST)
	public ArrayList<Calendar> ajax_Calendar(Calendar calendar,Member member, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("loginId");
		
		Member memberInfo = member_service.selectMember(id);
		
		memberInfo.setStart_day(member.getStart_day());
		
		ArrayList<Calendar> select = service.date_Calendar(memberInfo);

		return select;
		
	}



}
