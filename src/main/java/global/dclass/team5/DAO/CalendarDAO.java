package global.dclass.team5.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.dclass.team5.VO.Calendar;
import global.dclass.team5.VO.Member;

@Repository
public class CalendarDAO {

	
	@Autowired 
	SqlSession sql;
	
	public ArrayList<Calendar> selectCalendar (Member member){
		
		CalendarMapper mapper = sql.getMapper(CalendarMapper.class);
		
		ArrayList<Calendar> result = mapper.selectCalendar(member);

		return result;
	}
	
	
	public ArrayList<Calendar> date_Calendar (Member member){
		
		CalendarMapper mapper = sql.getMapper(CalendarMapper.class);
		
		
		System.out.println("DAO "+member);
	
		ArrayList<Calendar> result = mapper.date_Calendar(member);
		
		System.out.println(result);
		return result;
		
	}


	
}
