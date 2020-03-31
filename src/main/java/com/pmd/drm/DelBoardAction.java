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
public class DelBoardAction {

	@Autowired
	private BulletinDAO b_dao;
	
	@RequestMapping(value = "/delBoard.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delBoard(String b_idx){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean chk = b_dao.delPost(b_idx);
		
		map.put("chk", chk);
		
		return map;
	}
	
}
