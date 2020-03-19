package com.pmd.drm;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.MainVO;
import com.pmd.vo.ViewVO;

@Controller
public class MainControl {

	
	@RequestMapping("/main.inc")
	public ModelAndView main() throws Exception{
		
		// 지역코드값dddd
		int[] area = {11, 26, 27, 28, 29, 30, 31,
						 41, 42, 43, 44, 45, 46, 47, 48, 50};
		
		int ran = (int)(Math.random()*area.length);
		
		
		// url은 임의 값임. 지역값을 랜덤값으로 변경
		// 리스트는 최소 10개이상
		URL url = new URL("http://www.hrd.go.kr/hrdp/api/apipo/APIPO0101T.do?returnType=XML&pageNum=1&"
						+"srchTraArea1="+area[ran]+"&authKey=Aflc7YIke55KR8qliEbmLwJGWIpsH2DL&sort=ASC&outType=1&srchTraStDt=20200318&"
						+"srchKeco1=20&pageSize=12&sortCol=TR_STT_DT&srchTraEndDt=20200618&srchTraPattern=N1&srchPart=-99"
						+"&apiRequstPageUrlAdres=/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp&apiRequstIp=211.118.162.124");
		
	
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element srchList = root.getChild("srchList");
		
		
		List<Element>scn_list = srchList.getChildren("scn_list");
		
		MainVO[] ar = new MainVO[scn_list.size()];
		
		int i = 0;
		
		for(Element e : scn_list) {
			MainVO vo = new MainVO();
			
			
			vo.setAddress(e.getChildText("address"));
			vo.setCourseMan(e.getChildText("courseMan"));
			vo.setImgGubun(e.getChildText("imgGubun"));
			vo.setInstCd(e.getChildText("instCd"));
			vo.setNcsCd(e.getChildText("ncsCd"));
			vo.setRegCourseMan(e.getChildText("regCourseMan"));
			vo.setSubTitle(e.getChildText("subTitle"));
			vo.setSubTitleLink(e.getChildText("subTitleLink"));
			vo.setSuperViser(e.getChildText("superViser"));
			vo.setTelNo(e.getChildText("telNo"));
			vo.setTitle(e.getChildText("title"));
			vo.setTitleIcon(e.getChildText("titleIcon"));
			vo.setTitleLink(e.getChildText("titleLink"));
			vo.setTraEndDate(e.getChildText("traEndDate"));
			vo.setTraStartDate(e.getChildText("traStartDate"));
			vo.setTrainTarget(e.getChildText("trainTarget"));
			vo.setTrainstCstId(e.getChildText("trainstCstId"));
			vo.setTrprDegr(e.getChildText("trprDegr"));
			vo.setTrprId(e.getChildText("trprId"));
			vo.setYardMan(e.getChildText("yardMan"));
			
			URL v_url = new URL("http://www.hrd.go.kr/hrdp/api/apipo/APIPO0102T.do?srchTrprId="+vo.getTrprId()+"&outType=2&srchTrprDegr="+vo.getTrprDegr()+"&"
					+"authKey=Aflc7YIke55KR8qliEbmLwJGWIpsH2DL&returnType=XML&srchTraPattern=N1&srchPart=1&apiRequstPageUrlAdres="
					+"/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_2.jsp&apiRequstIp=211.118.162.124");
			
			SAXBuilder v_builder = new SAXBuilder();
			HttpURLConnection v_conn = (HttpURLConnection) v_url.openConnection();
			v_conn.setRequestProperty("Content-Type", "application/xml");
			v_conn.connect();
			
			Document v_doc = v_builder.build(v_conn.getInputStream());
			Element v_root = v_doc.getRootElement();

			Element base_info = v_root.getChild("inst_base_info");
			
			ViewVO vvo = new ViewVO();			
			vvo.setFilePath(base_info.getChildText("filePath"));
			
			vo.setVvo(vvo);
			
			ar[i] = vo;
			i++;
			
			
			System.out.println(vo.getAddress());
		}
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("ar", ar);
		mv.setViewName("main");
		
		return mv;
	}
}
