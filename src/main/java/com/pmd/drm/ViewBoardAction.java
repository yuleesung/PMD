package com.pmd.drm;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.BulletinVO;

import mybatis.dao.BulletinDAO;

@Controller
public class ViewBoardAction {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BulletinDAO b_dao;
	
	@RequestMapping("/viewBoard.inc")
	public ModelAndView viewBoard(String b_idx, String nowPage, String b_category) {
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
		
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		mv.addObject("b_category", b_category);
		mv.setViewName("viewBoard");
		
		
		
		return mv;
	}

}
