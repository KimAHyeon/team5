package global.dclass.team5.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dclass.team5.DAO.AdminDAO;
import global.dclass.team5.VO.Application;
import global.dclass.team5.VO.GroupBoardInfo;
import global.dclass.team5.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping(value="insertApplicationForm", method=RequestMethod.GET)
	public String insertApplicationForm() {
		return "/admin/insertApplicationForm";
	}
	
	@ResponseBody
	@RequestMapping(value="searchApplication", method=RequestMethod.GET)
	public ArrayList<Application> searchApplication() {
		ArrayList<Application> result = new ArrayList<Application>();
		
		result = service.searchApplication();
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="insertGroupBoard", method=RequestMethod.POST)
	public GroupBoardInfo insertGroupBoard() {
		GroupBoardInfo result = new GroupBoardInfo();
		
		int success = service.insertGroupBoard();
		
		if (success != 1) {
			return null;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="updateApplication", method=RequestMethod.POST)
	public int updateApplication(int applicationSeq) {
		int result = 0;
		
		Application application = service.selectApplication(applicationSeq);
		
		if (application == null) {
			return 0;
		}
		
		result = service.updateApplication(applicationSeq);
		
		if (result != 1) {
			return 0;
		}
		
		return result;
	}
}
