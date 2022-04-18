package com.kh.tpo.rest.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tpo.rest.domain.Room;
import com.kh.tpo.rest.service.RestService;

@Controller
public class RoomController {

	@Autowired
	private RestService reService;

	@RequestMapping(value="roomInsesrt.tpo", method=RequestMethod.GET)
	public void roomInsert(ArrayList<Room> list) throws IOException{
		list = RoomInfo.roomAPI();
		//System.out.println("controller 결과는?" + list.toString());
		//for(int i =0; i<list.size(); list.get(i)) {
		int result = reService.insertRoom(list);
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		//}
	}
	
	@RequestMapping(value="roomInfo.tpo", method=RequestMethod.GET)
	public ModelAndView roomInfo(ModelAndView mv ,int rNo) {
		Room room = reService.roomInfo(rNo);
		if(room != null) {
			mv.addObject("room", room).setViewName("rest/roomOne");
		}
		return mv;
	}


}
