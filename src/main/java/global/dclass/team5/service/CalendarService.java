package global.dclass.team5.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import global.dclass.team5.DAO.CalendarDAO;
import global.dclass.team5.DAO.MessageDAO;
import global.dclass.team5.VO.Calendar;
import global.dclass.team5.VO.Member;

@Service
public class CalendarService {

	
	@Autowired
	CalendarDAO dao;


	public ArrayList<Calendar> selectCalendar (Member member){
		
		return dao.selectCalendar(member);

	}
	
	public ArrayList<Calendar> date_Calendar(Member member){
		
		ArrayList<Calendar> result = dao.date_Calendar(member);
		
		System.out.println("Service member:"+member);
		System.out.println(result);
		return result;
		
		
	}
}
