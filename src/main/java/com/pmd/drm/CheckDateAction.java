package com.pmd.drm;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pmd.vo.AdvVO;

import mybatis.dao.BulletinDAO;

@Controller
public class CheckDateAction {

	@Autowired
	private BulletinDAO b_dao;
	
	
	@RequestMapping(value = "/checkDate.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkInputDate(String adv_group, String inputDate) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean chk = false;
		AdvVO[] ar = b_dao.searchDateOnAdv_t(adv_group);
		for(int i=0; i<ar.length; i++) {
			if(checkDate(inputDate, ar[i].getStart_date(), ar[i].getEnd_date())){
				chk = true;
				break;
			}
		}
		
		map.put("chk", chk);
		
		return map;
	}
	
	@RequestMapping(value = "/checkDateForUpdate.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkInputDateForUpdate(String a_idx, String adv_group, String inputDate) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean chk = false;
		AdvVO[] ar = b_dao.searchDateOnAdv_tForUpdate(a_idx, adv_group);
		for(int i=0; i<ar.length; i++) {
			if(checkDate(inputDate, ar[i].getStart_date(), ar[i].getEnd_date())){
				chk = true;
				break;
			}
		}
		
		map.put("chk", chk);
		
		return map;
	}
	
	@RequestMapping(value = "/checkBothDateForUpdate.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkBothDateForUpdate(String a_idx, String adv_group, String start_date, String end_date) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean start_chk = false;
		boolean end_chk = false;
		AdvVO[] ar = b_dao.searchDateOnAdv_tForUpdate(a_idx, adv_group);
		for(int i=0; i<ar.length; i++) {
			if(checkDate(start_date, ar[i].getStart_date(), ar[i].getEnd_date())){
				start_chk = true;
				break;
			}
		}
		
		for(int i=0; i<ar.length; i++) {
			if(checkDate(end_date, ar[i].getStart_date(), ar[i].getEnd_date())){
				end_chk = true;
				break;
			}
		}
		
		map.put("start_chk", start_chk);
		map.put("end_chk", end_chk);
		
		return map;
	}
	
	private boolean checkDate(String inputDate, String start_date, String end_date) throws ParseException{
		boolean chk = false;

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		//Date타입으로 변경

		Date d1 = df.parse(start_date); // 시작 일
		Date d2 = df.parse(end_date); // 종료 일 
		
		Date d3 = df.parse(inputDate); // 입력 일

		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		
		Calendar c3 = Calendar.getInstance();

		//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
		c1.setTime(d1);
		c2.setTime(d2);
		
		c3.setTime(d3);

		
		//시작날짜와 끝 날짜를 비교해, 입력날짜가 같으면 true로 바꾸고 break;
		while(c1.compareTo(c2) != 1){

			if(c1.compareTo(c3) == 0) {
				chk = true;
				break;
			}
	
			//시작날짜 + 1 일
			c1.add(Calendar.DATE, 1);
		}
		
		return chk;
	}
	
}
