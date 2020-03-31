package com.pmd.drm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pmd.vo.BulletinVO;
import com.pmd.vo.Bulletin_C_VO;

import mybatis.dao.BulletinDAO;

@Controller
public class CommentAction {

	@Autowired
	private BulletinDAO b_dao;
	
	@Autowired
	private HttpServletRequest request;
	
	
	@RequestMapping(value = "/comment.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> comment(Bulletin_C_VO cvo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		cvo.setIp(request.getRemoteAddr());
		b_dao.writeComment(cvo);
		
		BulletinVO vo = b_dao.viewPost(cvo.getB_idx());
		List<Bulletin_C_VO> c_list = vo.getC_list();
		
		Bulletin_C_VO[] c_ar = null;
		if(c_list != null && !c_list.isEmpty()) {
			c_ar = new Bulletin_C_VO[c_list.size()];
			c_list.toArray(c_ar);
		}
		
		map.put("c_ar", c_ar);
		
		return map;
	}
	
	@RequestMapping(value = "/updateComment.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateComment(Bulletin_C_VO cvo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		cvo.setIp(request.getRemoteAddr());
		b_dao.updateComment(cvo);
		
		BulletinVO vo = b_dao.viewPost(cvo.getB_idx());
		List<Bulletin_C_VO> c_list = vo.getC_list();
		
		Bulletin_C_VO[] c_ar = null;
		if(c_list != null && !c_list.isEmpty()) {
			c_ar = new Bulletin_C_VO[c_list.size()];
			c_list.toArray(c_ar);
		}
		
		map.put("c_ar", c_ar);
		
		return map;
	}
	
	@RequestMapping(value = "/delComment.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delComment(Bulletin_C_VO cvo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		cvo.setIp(request.getRemoteAddr());
		b_dao.delComment(cvo.getC_idx());
		
		BulletinVO vo = b_dao.viewPost(cvo.getB_idx());
		List<Bulletin_C_VO> c_list = vo.getC_list();
		
		Bulletin_C_VO[] c_ar = null;
		if(c_list != null && !c_list.isEmpty()) {
			c_ar = new Bulletin_C_VO[c_list.size()];
			c_list.toArray(c_ar);
		}
		
		map.put("c_ar", c_ar);
		
		return map;
	}
	
	@RequestMapping(value = "/viewComment.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> viewComment(String b_idx){
		Map<String, Object> map = new HashMap<String, Object>();
		
		BulletinVO vo = b_dao.viewPost(b_idx);
		List<Bulletin_C_VO> c_list = vo.getC_list();
		
		Bulletin_C_VO[] c_ar = null;
		if(c_list != null && !c_list.isEmpty()) {
			c_ar = new Bulletin_C_VO[c_list.size()];
			c_list.toArray(c_ar);
		}
		
		map.put("c_ar", c_ar);
		
		return map;
	}
	
}
