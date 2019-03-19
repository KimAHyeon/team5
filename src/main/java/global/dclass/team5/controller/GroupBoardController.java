package global.dclass.team5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import global.dclass.team5.service.GroupBoardService;

@Controller
public class GroupBoardController {

	@Autowired
	GroupBoardService service;
	
}
