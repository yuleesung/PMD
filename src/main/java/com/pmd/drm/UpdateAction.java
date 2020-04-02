package com.pmd.drm;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.BulletinVO;

import mybatis.dao.BulletinDAO;

@Controller
public class UpdateAction {

	@Autowired
	private BulletinDAO b_dao;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private ServletContext application;
	
	
	private String imgPath = "resources/upload";
	

	
	@RequestMapping("/updateBoard.inc")
	public ModelAndView updateBoard(String b_idx, String b_category, String nowPage) { // 수정페이지로 이동
			
		BulletinVO vo = b_dao.viewPost(b_idx);
		vo.setNowPage(nowPage);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		mv.setViewName("updateBoard");
		 
		return mv;
	}
	
	
	@RequestMapping(value = "/edit.inc", method = RequestMethod.POST)
	public ModelAndView edit(BulletinVO vo) throws Exception{ 
		// 해당 게시물의 b_idx는 수정페이지에 히든으로 넣기	
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip); // IP 셋팅
		
		MultipartFile mf = vo.getUpload();
		
		ModelAndView mv = new ModelAndView();
		
		if(mf.getSize()>0 && mf!=null) {
			String path = application.getRealPath(imgPath);
			String file_name = mf.getOriginalFilename();
			
			vo.setFile_name(file_name);
			
			mf.transferTo(new File(path, file_name));
		} else {
			vo.setFile_name("");
		}	
		
		boolean chk = b_dao.editPost(vo);
		
		mv.setViewName("redirect:/viewBoard.inc?b_idx="+vo.getB_idx()+"&nowPage=1&b_category="+vo.getB_category());
		
		return mv;
	}
}
