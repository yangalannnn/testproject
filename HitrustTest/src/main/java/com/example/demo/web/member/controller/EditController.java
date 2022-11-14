package com.example.demo.web.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.web.member.dao.MemberDao;
import com.example.demo.web.member.pojo.Member;

@Controller
public class EditController {
	
	@Autowired
	@Qualifier(value ="memberDao")
	private MemberDao memberdao;

	@GetMapping("/update")
	public String aaa() {
		return "update";
	}
	
	@GetMapping("/updatemember")
	public ModelAndView showmember(@RequestParam String findinput) {
		
		List<String> errorMsgList = new ArrayList<>();
		
		Member findmember=memberdao.findByMemselfid(findinput);
		
		ModelAndView m = new ModelAndView();
		if(findmember==null) {
			errorMsgList.add("查無資料");
			m.setViewName("update");
			m.addObject("errorMsgList", errorMsgList);
			return m;
		}else {
			m.setViewName("update");
			m.addObject("findmember", findmember);
			return m;
		}
	}
	
	@PostMapping("/updatemember")
	public ModelAndView update(@RequestParam String memselfid,@RequestParam String inputmemname,@RequestParam String inputmememail) {
		
		ModelAndView m = new ModelAndView();
		Member member = new Member();
		member.setMemselfid(memselfid);
		member.setMemname(inputmemname);
		member.setMememail(inputmememail);
		memberdao.save(member);
		m.setViewName("update");
		m.addObject("findmember", member);
		
		return m;
	}
	
	
}
