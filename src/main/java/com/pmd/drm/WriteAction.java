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
public class WriteAction {

	
	@Autowired
	private BulletinDAO b_dao;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private ServletContext application;
	
	
	private String imgPath = "resources/upload";
	
	
	
	 
	@RequestMapping("/write.inc")
	public ModelAndView writeForm(String nowPage, String b_category, String active) {
		ModelAndView mv = new ModelAndView();
		
		int ran1 = (int) ((Math.random()*9)+1);
		int ran2 = (int) ((Math.random()*9)+1);
		int ran_val = ran1+ran2;
		
		mv.addObject("ran1", ran1);
		mv.addObject("ran2", ran2);
		mv.addObject("ran_val", ran_val);
		
		mv.addObject("b_category", b_category);
		mv.addObject("nowPage", nowPage);
		mv.addObject("active", active);
		
		mv.setViewName("writeBoard");
		
		return mv;
	}
	
	
	@RequestMapping(value="/write.inc", method= RequestMethod.POST)
	public ModelAndView write(BulletinVO vo) throws Exception{
		// 폼의 모든 값들이 인자(vo)에 들어온다
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip); // IP
		
		MultipartFile mf = vo.getUpload();
		
		
		if(mf.getSize()>0 && mf!=null) {
			String path = application.getRealPath(imgPath);
			String file_name = mf.getOriginalFilename();
			
			vo.setFile_name(file_name);
			
			mf.transferTo(new File(path, file_name));
		} else {
			vo.setFile_name("");
		}
		
		b_dao.writePost(vo);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/list.inc?b_category="+vo.getB_category()+"&active="+vo.getActive()); // 최근 게시물 리스트로 돌아가야 함
					
		return mv;
	}
}
