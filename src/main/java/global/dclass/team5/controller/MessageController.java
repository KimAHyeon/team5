package global.dclass.team5.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dclass.team5.VO.Message;
import global.dclass.team5.service.MessageService;

@Controller
	public class MessageController {
	
		@Autowired
		MessageService service;
		// 최신 5개 메시지 불러오기
		@RequestMapping(value = "selectFiveMessages",method = RequestMethod.GET)
		@ResponseBody
		public ArrayList<Message> select_five_messages(HttpSession session) {
			String id = (String) session.getAttribute("loginId");
			ArrayList<Message> newList = service.select_five_messages(id);
			return newList;
		}
		
		//전체 메시지 보는 창으로
		@RequestMapping(value = "viewAllMessages", method = RequestMethod.GET)
		public String select_all_messages_form() {
			
			return "/messages/allMessages";
		}
		
		@RequestMapping(value = "allMessages", method = RequestMethod.GET)
		@ResponseBody
		public ArrayList<Message> select_all_messages(HttpSession session){
			String id = (String) session.getAttribute("loginId");	
			 ArrayList<Message>	list = service.select_all_messages(id);
				System.out.println(list.toString());
			
			return list;
		}
		
		//메시지 삭제
		@RequestMapping(value = "deleteMsg", method = RequestMethod.GET)
		@ResponseBody
		public void delete_messages(String msg_seq) {
			System.out.println("결과값"+msg_seq);
			String[] temp = msg_seq.split(",");
			for (String string : temp) {
				int num = Integer.parseInt(string);
				service.delete_messages(num);
			}
		}
	}
