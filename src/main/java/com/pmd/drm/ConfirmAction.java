package com.pmd.drm;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.BulletinDAO;

@Controller
public class ConfirmAction {

	@Autowired
	private BulletinDAO b_dao;
	
	
	
	@RequestMapping(value = "/idchk.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> idchk(String u_id) {
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		boolean value = b_dao.matchMember(u_id);
		map.put("value", value);
		
		return map;
		
	}
	
	
	@RequestMapping(value = "/emailchk.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> emailchk(String email) {
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		boolean value = b_dao.checkEmail(email);
		map.put("value", value);
		
		return map;
	}
	
	
	
	@RequestMapping(value = "/phonechk.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> phonechk(String u_phone) {
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		boolean value = b_dao.checkEmail(u_phone);
		map.put("value", value);
		
		return map;
	}
}
