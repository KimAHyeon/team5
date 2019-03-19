package global.dclass.team5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import global.dclass.team5.DAO.GroupBoardDAO;

@Service
public class GroupBoardService {

	@Autowired
	GroupBoardDAO dao;
}
