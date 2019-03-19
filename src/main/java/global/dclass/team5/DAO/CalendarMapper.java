package global.dclass.team5.DAO;

import java.util.ArrayList;

import global.dclass.team5.VO.Calendar;
import global.dclass.team5.VO.Member;

public interface CalendarMapper {

	
	public ArrayList<Calendar> selectCalendar (Member member);
	
	public ArrayList<Calendar> date_Calendar (Member member);
}
