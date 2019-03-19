package global.dclass.team5.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import global.dclass.team5.DAO.AdminDAO;
import global.dclass.team5.VO.Application;

@Service
public class AdminService {
	
	@Autowired
	AdminDAO dao;

	public ArrayList<Application> searchApplication() {
		return dao.searchApplication();
	}

	public int insertGroupBoard() {
		return dao.insertGroupBoard();
	}

	public Application selectApplication(int applicationSeq) {
		return dao.selectApplication(applicationSeq);
	}

	public int updateApplication(int applicationSeq) {
		return dao.updateApplication(applicationSeq);
	}
	
	

}
