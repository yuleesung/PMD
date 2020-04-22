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

import com.pmd.util.Paging_ViewBoard_Comm;
import com.pmd.vo.BulletinVO;
import com.pmd.vo.Bulletin_C_VO;

import mybatis.dao.Bulletin_C_DAO;

@Controller
public class CommentAction {
	
	// 페이징 기법을 위한 상수들
	public final int BLOCK_LIST = 10; // 한 페이지당 보여질 게시물의 수
	public final int BLOCK_PAGE = 5; // 한 블록당 보여질 페이지 수

	int nowPage; // 현재 페이지 값
	int rowTotal; // 전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드값

	@Autowired
	private Bulletin_C_DAO b_c_dao;
	
	@Autowired
	private HttpServletRequest request;
	
	
	@RequestMapping(value = "/comment.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> comment(Bulletin_C_VO cvo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		cvo.setIp(request.getRemoteAddr());
		b_c_dao.writeComment(cvo);
		
		// 페이징처리 - 댓글은 오름차순으로 보여주기 때문에 가장 마지막 페이지가 최신글이다.
		rowTotal = b_c_dao.commCount(cvo.getB_idx());
		this.nowPage = (int)Math.ceil((double)rowTotal/BLOCK_LIST);
		Paging_ViewBoard_Comm page = new Paging_ViewBoard_Comm(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, cvo.getB_idx());
		
		pageCode = page.getSb().toString();
		
		String begin = String.valueOf(page.getBegin());
		String end = String.valueOf(page.getEnd());
		
		Bulletin_C_VO[] c_ar = b_c_dao.commListForAjax(cvo.getB_idx(), begin, end);
		
		map.put("c_ar", c_ar);
		map.put("nowPage", page.getNowPage());
		map.put("pageCode", pageCode);
		map.put("c_length", b_c_dao.commCount(cvo.getB_idx())); // 댓글 갯수 보여주기 용
		
		return map;
	}
	
	@RequestMapping(value = "/updateComment.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateComment(Bulletin_C_VO cvo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		cvo.setIp(request.getRemoteAddr());
		b_c_dao.updateComment(cvo);
		
		// 페이징처리
		this.nowPage = Integer.parseInt(cvo.getNowPage());
		rowTotal = b_c_dao.commCount(cvo.getB_idx()); 
		Paging_ViewBoard_Comm page = new Paging_ViewBoard_Comm(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, cvo.getB_idx());
		
		pageCode = page.getSb().toString();
		
		String begin = String.valueOf(page.getBegin());
		String end = String.valueOf(page.getEnd());
		
		Bulletin_C_VO[] c_ar = b_c_dao.commListForAjax(cvo.getB_idx(), begin, end);
		
		map.put("c_ar", c_ar);
		map.put("nowPage", page.getNowPage());
		map.put("pageCode", pageCode);
		map.put("c_length", b_c_dao.commCount(cvo.getB_idx()));
		
		return map;
	}
	
	@RequestMapping(value = "/delComment.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delComment(Bulletin_C_VO cvo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		cvo.setIp(request.getRemoteAddr());
		b_c_dao.delComment(cvo.getC_idx());
		
		// 페이징처리
		this.nowPage = Integer.parseInt(cvo.getNowPage());
		rowTotal = b_c_dao.commCount(cvo.getB_idx()); 
		Paging_ViewBoard_Comm page = new Paging_ViewBoard_Comm(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, cvo.getB_idx());
		
		pageCode = page.getSb().toString();
		
		String begin = String.valueOf(page.getBegin());
		String end = String.valueOf(page.getEnd());
		
		Bulletin_C_VO[] c_ar = b_c_dao.commListForAjax(cvo.getB_idx(), begin, end);
		
		map.put("c_ar", c_ar);
		map.put("nowPage", page.getNowPage());
		map.put("pageCode", pageCode);
		map.put("c_length", b_c_dao.commCount(cvo.getB_idx()));
		
		return map;
	}
	
	@RequestMapping(value = "/viewComment.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> viewComment(String b_idx, String nowPage){
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 페이징처리
		this.nowPage = Integer.parseInt(nowPage);
		rowTotal = b_c_dao.commCount(b_idx); 
		Paging_ViewBoard_Comm page = new Paging_ViewBoard_Comm(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_idx);
		
		pageCode = page.getSb().toString();
		
		String begin = String.valueOf(page.getBegin());
		String end = String.valueOf(page.getEnd());
		
		Bulletin_C_VO[] c_ar = b_c_dao.commListForAjax(b_idx, begin, end);
		
		map.put("c_ar", c_ar);
		map.put("nowPage", page.getNowPage());
		map.put("pageCode", pageCode);
		map.put("c_length", b_c_dao.commCount(b_idx));
		
		return map;
	}
	
}
