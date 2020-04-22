package com.pmd.drm;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.Paging_ViewBoard_Comm;
import com.pmd.vo.BulletinVO;

import mybatis.dao.BulletinDAO;
import mybatis.dao.Bulletin_C_DAO;

@Controller
public class ViewBoardAction {
	
	// 페이징 기법을 위한 상수들
	public final int BLOCK_LIST = 10; // 한 페이지당 보여질 게시물의 수
	public final int BLOCK_PAGE = 5; // 한 블록당 보여질 페이지 수
	
	int nowPage; // 현재 페이지 값
	int rowTotal; // 전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드값
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BulletinDAO b_dao;
	
	@Autowired
	private Bulletin_C_DAO b_c_dao;
	
	
	@RequestMapping("/viewBoard.inc")
	public ModelAndView viewBoard(String b_idx, String nowPage, String b_category, String active) {
		ModelAndView mv = new ModelAndView();
		
		session.setAttribute("path", "viewBoard");
		session.setAttribute("b_idx", b_idx);
		session.setAttribute("nowPage", nowPage);
		session.setAttribute("b_category", b_category);
		
		BulletinVO vo = b_dao.viewPost(b_idx);
		
		Object obj = session.getAttribute("read_bbs");
		
		if(vo != null){
			boolean chk = false;
			List<BulletinVO> list = null;
			 
			if(obj == null){
				list = new ArrayList<BulletinVO>();
				session.setAttribute("read_bbs", list);
			}else{
				list = (List<BulletinVO>)obj;
				
				for(BulletinVO r_vo : list){
					if(b_idx.equals(r_vo.getB_idx())){
						chk = true;
						break;
					}
				} 
			}
			
			if(!chk){
				
				int hit = Integer.parseInt(vo.getHit());
				++hit;
				
				vo.setHit(String.valueOf(hit)); 
				
				
				b_dao.hit(b_idx);
				
				
				list.add(vo);
			}
		}
		
		// 댓글 페이징을 위한 값 설정
		this.nowPage = 1;
		rowTotal = b_c_dao.commCount(b_idx);
		Paging_ViewBoard_Comm page = new Paging_ViewBoard_Comm(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_idx);
		pageCode = page.getSb().toString();
		
		
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		mv.addObject("b_category", b_category);
		mv.addObject("c_length", b_c_dao.commCount(b_idx));
		mv.addObject("pageCode", pageCode);
		mv.addObject("active", active);
		mv.setViewName("viewBoard");
		
		
		return mv;
	}

}
