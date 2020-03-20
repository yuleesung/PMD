package com.pmd.drm;

import java.net.HttpURLConnection;
import java.net.URL;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.ViewVO;

@Controller
public class ViewControl {

	
	@RequestMapping("/view.inc")
	public ModelAndView view(String srchTrprId, String srchTrprDegr, String traStartDate, String traEndDate, 
			String trainstCstId, String superViser, String trainTarget, String regCourseMan, String yardMan) throws Exception{
		

		// 훈련과정ID(srchTrprId. main에서는 trprId)
		// 과정회차(srchTrprDegr. main에서는 trprDegr)
		URL url = new URL("http://www.hrd.go.kr/hrdp/api/apipo/APIPO0102T.do?srchTrprId="+srchTrprId+"&outType=2&srchTrprDegr="+srchTrprDegr+"&"
							+"authKey=Aflc7YIke55KR8qliEbmLwJGWIpsH2DL&returnType=XML&srchTraPattern=N1&srchPart=1&apiRequstPageUrlAdres="
							+"/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_2.jsp&apiRequstIp=211.118.162.124");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		//inst_base_info
		Element base_info = root.getChild("inst_base_info");
		//inst_detail_info
		Element detail_info = root.getChild("inst_detail_info");
		
		ViewVO vo = new ViewVO();
		
		// 훈련기관 기초정보
		vo.setAddr1(base_info.getChildText("addr1"));
		vo.setAddr2(base_info.getChildText("addr2"));
		vo.setFilePath(base_info.getChildText("filePath"));
		
		String web = base_info.getChildText("hpAddr");
		if(!web.startsWith("http://")) {
			StringBuffer sb = new StringBuffer();
			sb.append("http://");
			sb.append(web);
			
			web = sb.toString();
		}
		
		vo.setHpAddr(web);
		vo.setInoNm(base_info.getChildText("inoNm"));
		vo.setInstPerTrco(base_info.getChildText("instPerTrco"));
		vo.setNcsCd(base_info.getChildText("ncsCd"));
		vo.setNcsNm(base_info.getChildText("ncsNm"));
		vo.setNcsYn(base_info.getChildText("ncsYn"));
		vo.setNonNcsCoursePrcttqTime(base_info.getChildText("nonNcsCoursePrcttqTime"));
		vo.setNonNcsCourseTheoryTime(base_info.getChildText("nonNcsCourseTheoryTime"));
		vo.setPerTrco(base_info.getChildText("perTrco"));
		vo.setTorgParGrad(base_info.getChildText("torgParGrad"));
		vo.setTrDcnt(base_info.getChildText("trDcnt"));
		vo.setTrprChap(base_info.getChildText("trprChap"));
		vo.setTrprChapEmail(base_info.getChildText("trprChapEmail"));
		vo.setTrprChapTel(base_info.getChildText("trprChapTel"));
		vo.setTrprDegr(base_info.getChildText("trprDegr"));
		vo.setTrprGbn(base_info.getChildText("trprGbn"));
		vo.setTrprId(base_info.getChildText("trprId"));
		vo.setTrprNm(base_info.getChildText("trprNm"));
		vo.setTrprTarget(base_info.getChildText("trprTarget"));
		vo.setTrprTargetNm(base_info.getChildText("trprTargetNm"));
		vo.setTrtm(base_info.getChildText("trtm"));
		
		
		// 훈련기관 상세정보
		vo.setGovBusiNm(detail_info.getChildText("govBusiNm"));
		vo.setTotTraingDyct(detail_info.getChildText("totTraingDyct"));
		vo.setTotTraingTime(detail_info.getChildText("totTraingTime"));
		vo.setTotalCrsAt(detail_info.getChildText("totalCrsAt"));
		
		int sin = Integer.parseInt(regCourseMan);
		int chong = Integer.parseInt(yardMan);
		String per = String.valueOf((double)sin/chong * 100);
		
		if(per.length()>5)
			per = per.substring(0, per.indexOf('.')+2);
		//String per = null;
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("traStartDate", traStartDate);
		mv.addObject("traEndDate", traEndDate);
		mv.addObject("trainstCstId", trainstCstId);
		mv.addObject("superViser", superViser);
		mv.addObject("trainTarget", trainTarget);
		mv.addObject("percent", per);
		mv.addObject("vo", vo);
		
		mv.setViewName("view");
			
		return mv;
	}
}
