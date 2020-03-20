package com.pmd.drm;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
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
		
	
		// 카테고리별 목록 10개씩 받아 옴
		MainVO[] ar1 = makeURL("01"); MainVO[] ar2 =  makeURL("02"); MainVO[] ar3 =  makeURL("03");
		MainVO[] ar4 = makeURL("04"); MainVO[] ar5 =  makeURL("05"); MainVO[] ar6 =  makeURL("06");
		MainVO[] ar7 =  makeURL("07"); MainVO[] ar8 =  makeURL("08"); MainVO[] ar9 =  makeURL("09");
		MainVO[] ar10 =  makeURL("10"); MainVO[] ar11 =  makeURL("11"); MainVO[] ar12 =  makeURL("12");
		MainVO[] ar13 =  makeURL("13"); MainVO[] ar14 =  makeURL("14"); MainVO[] ar15 =  makeURL("15");
		MainVO[] ar16 =  makeURL("16"); MainVO[] ar17 =  makeURL("17"); MainVO[] ar18 =  makeURL("18");
		MainVO[] ar19 =  makeURL("19"); MainVO[] ar20 =  makeURL("20"); MainVO[] ar21 =  makeURL("21");
		MainVO[] ar22 =  makeURL("22"); MainVO[] ar23 =  makeURL("23"); MainVO[] ar24 =  makeURL("24");
		
		
		List<MainVO> total_ar = new ArrayList<MainVO>();
		
		if(ar1.length>0) {
			int ran = (int) (Math.random() * ar1.length-1);
			total_ar.add(ar1[ran]);
		}
		if(ar2.length>0) {
			int ran = (int) (Math.random() * ar2.length-1);
			total_ar.add(ar2[ran]);
		}
		if(ar3.length>0) {
			int ran = (int) (Math.random() * ar3.length-1);
			total_ar.add(ar3[ran]);
		}
		if(ar4.length>0) {
			int ran = (int) (Math.random() * ar4.length-1);
			total_ar.add(ar4[ran]);
		}
		if(ar5.length>0) {
			int ran = (int) (Math.random() * ar5.length-1);
			total_ar.add(ar5[ran]);
		}
		if(ar6.length>0) {
			int ran = (int) (Math.random() * ar6.length-1);
			total_ar.add(ar6[ran]);
		}
		if(ar7.length>0) {
			int ran = (int) (Math.random() * ar7.length-1);
			total_ar.add(ar7[ran]);
		}
		if(ar8.length>0) {
			int ran = (int) (Math.random() * ar8.length-1);
			total_ar.add(ar8[ran]);
		}
		if(ar9.length>0) {
			int ran = (int) (Math.random() * ar9.length-1);
			total_ar.add(ar9[ran]);
		}
		if(ar10.length>0) {
			int ran = (int) (Math.random() * ar10.length-1);
			total_ar.add(ar10[ran]);
		}
		if(ar11.length>0) {
			int ran = (int) (Math.random() * ar11.length-1);
			total_ar.add(ar11[ran]);
		}
		if(ar12.length>0) {
			int ran = (int) (Math.random() * ar12.length-1);
			total_ar.add(ar12[ran]);
		}
		if(ar13.length>0) {
			int ran = (int) (Math.random() * ar13.length-1);
			total_ar.add(ar13[ran]);
		}
		if(ar14.length>0) {
			int ran = (int) (Math.random() * ar14.length-1);
			total_ar.add(ar14[ran]);
		}
		if(ar15.length>0) {
			int ran = (int) (Math.random() * ar15.length-1);
			total_ar.add(ar15[ran]);
		}
		if(ar16.length>0) {
			int ran = (int) (Math.random() * ar16.length-1);
			total_ar.add(ar16[ran]);
		}
		if(ar17.length>0) {
			int ran = (int) (Math.random() * ar17.length-1);
			total_ar.add(ar17[ran]);
		}
		if(ar18.length>0) {
			int ran = (int) (Math.random() * ar18.length-1);
			total_ar.add(ar18[ran]);
		}
		if(ar19.length>0) {
			int ran = (int) (Math.random() * ar19.length-1);
			total_ar.add(ar19[ran]);
		}
		if(ar20.length>0) {
			int ran = (int) (Math.random() * ar20.length-1);
			total_ar.add(ar20[ran]);
		}
		if(ar21.length>0) {
			int ran = (int) (Math.random() * ar21.length-1);
			total_ar.add(ar21[ran]);
		}
		if(ar22.length>0) {
			int ran = (int) (Math.random() * ar22.length-1);
			total_ar.add(ar22[ran]);
		}
		if(ar23.length>0) {
			int ran = (int) (Math.random() * ar23.length-1);
			total_ar.add(ar23[ran]);
		}
		if(ar24.length>0) {
			int ran = (int) (Math.random() * ar24.length-1);
			total_ar.add(ar24[ran]);
		}

		
		// jsp에 보내기 위한 ar
		MainVO[] ar =null;
		
		if(!total_ar.isEmpty() && total_ar != null) {
			ar = new MainVO[total_ar.size()];
			
			total_ar.toArray(ar);
		}
		
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("ar", ar);
		mv.setViewName("main");
		
		return mv;
	}
	
	
	public MainVO[] makeURL(String category) throws Exception {

		// url은 임의 값임. 지역값을 랜덤값으로 변경
		// 리스트는 최소 10개이상
		URL url = new URL("http://www.hrd.go.kr/hrdp/api/apipo/APIPO0101T.do?returnType=XML&pageNum=1&"
				+ "&authKey=Aflc7YIke55KR8qliEbmLwJGWIpsH2DL&sort=ASC&outType=1&srchTraStDt=20200318&"
				+ "srchKeco1="+category+"&pageSize=10&sortCol=TR_STT_DT&srchTraEndDt=20200618&srchTraPattern=N1&srchPart=-99"
				+ "&apiRequstPageUrlAdres=/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp&apiRequstIp=211.118.162.124");

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();

		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());

		Element root = doc.getRootElement();

		Element srchList = root.getChild("srchList");

		List<Element> scn_list = srchList.getChildren("scn_list");

		MainVO[] ar = new MainVO[scn_list.size()];

		int i = 0;

		for (Element e : scn_list) {
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
			vo.setCategory(category);
			
			
			ar[i] = vo;
			i++;
		}

		return ar;
	}
}
