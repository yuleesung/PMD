package com.pmd.drm;

import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.MainVO;
import com.pmd.vo.ViewVO;

@Controller
public class MainAction {

	@Autowired
	private HttpSession session;
	
	@RequestMapping("/main.inc")
	public ModelAndView main() throws Exception{
		
	
		// 카테고리별 목록 10개씩 받아 옴
		MainVO[] ar1 = makeURL("01");
		MainVO[] ar2 = makeURL("02");
		MainVO[] ar3 = makeURL("03");
		MainVO[] ar4 = makeURL("04");
		MainVO[] ar5 = makeURL("05");
		MainVO[] ar6 = makeURL("06");
		MainVO[] ar7 = makeURL("07");
		MainVO[] ar8 = makeURL("08");
		MainVO[] ar9 = makeURL("09");
		MainVO[] ar10 = makeURL("10");
		MainVO[] ar11 = makeURL("11");
		MainVO[] ar12 = makeURL("12");
		MainVO[] ar13 = makeURL("13");
		MainVO[] ar14 = makeURL("14");
		MainVO[] ar15 = makeURL("15");
		MainVO[] ar16 = makeURL("16");
		MainVO[] ar17 = makeURL("17");
		MainVO[] ar18 = makeURL("18");
		MainVO[] ar19 = makeURL("19");
		MainVO[] ar20 = makeURL("20");
		MainVO[] ar21 = makeURL("21");
		MainVO[] ar22 = makeURL("22");
		MainVO[] ar23 = makeURL("23");
		MainVO[] ar24 = makeURL("24");
		
		
		List<MainVO> total_ar = new ArrayList<MainVO>();
		
		if(ar1.length>1 && ar1 != null) {
			int ran = (int) (Math.random() * ar1.length-1);
			total_ar.add(ar1[ran]);
		}
		if(ar2.length>1 && ar2 != null) {
			int ran = (int) (Math.random() * ar2.length-1);
			total_ar.add(ar2[ran]);
		}
		if(ar3.length>1 && ar3 != null) {
			int ran = (int) (Math.random() * ar3.length-1);
			total_ar.add(ar3[ran]);
		}
		if(ar4.length>1 && ar4 != null) {
			int ran = (int) (Math.random() * ar4.length-1);
			total_ar.add(ar4[ran]);
		}
		if(ar5.length>1 && ar5 != null) {
			int ran = (int) (Math.random() * ar5.length-1);
			total_ar.add(ar5[ran]);
		}
		if(ar6.length>1 && ar6 != null) {
			int ran = (int) (Math.random() * ar6.length-1);
			total_ar.add(ar6[ran]);
		}
		if(ar7.length>1 && ar7 != null) {
			int ran = (int) (Math.random() * ar7.length-1);
			total_ar.add(ar7[ran]);
		}
		if(ar8.length>1 && ar8 != null) {
			int ran = (int) (Math.random() * ar8.length-1);
			total_ar.add(ar8[ran]);
		}
		if(ar9.length>1 && ar9 != null) {
			int ran = (int) (Math.random() * ar9.length-1);
			total_ar.add(ar9[ran]);
		}
		if(ar10.length>1 && ar10 != null) {
			int ran = (int) (Math.random() * ar10.length-1);
			total_ar.add(ar10[ran]);
		}
		if(ar11.length>1 && ar11 != null) {
			int ran = (int) (Math.random() * ar11.length-1);
			total_ar.add(ar11[ran]);
		}
		if(ar12.length>1 && ar12 != null) {
			int ran = (int) (Math.random() * ar12.length-1);
			total_ar.add(ar12[ran]);
		}
		if(ar13.length>1 && ar13 != null) {
			int ran = (int) (Math.random() * ar13.length-1);
			total_ar.add(ar13[ran]);
		}
		if(ar14.length>1 && ar14 != null) {
			int ran = (int) (Math.random() * ar14.length-1);
			total_ar.add(ar14[ran]);
		}
		if(ar15.length>1 && ar15 != null) {
			int ran = (int) (Math.random() * ar15.length-1);
			total_ar.add(ar15[ran]);
		}
		if(ar16.length>1 && ar16 != null) {
			int ran = (int) (Math.random() * ar16.length-1);
			total_ar.add(ar16[ran]);
		}
		if(ar17.length>1 && ar17 != null) {
			int ran = (int) (Math.random() * ar17.length-1);
			total_ar.add(ar17[ran]);
		}
		if(ar18.length>1 && ar18 != null) {
			int ran = (int) (Math.random() * ar18.length-1);
			total_ar.add(ar18[ran]);
		}
		if(ar19.length>1 && ar19 != null) {
			int ran = (int) (Math.random() * ar19.length-1);
			total_ar.add(ar19[ran]);
		}
		if(ar20.length>1 && ar20 != null) {
			int ran = (int) (Math.random() * ar20.length-1);
			total_ar.add(ar20[ran]);
		}
		if(ar21.length>1 && ar21 != null) {
			int ran = (int) (Math.random() * ar21.length-1);
			total_ar.add(ar21[ran]);
		}
		if(ar22.length>1 && ar22 != null) {
			int ran = (int) (Math.random() * ar22.length-1);
			total_ar.add(ar22[ran]);
		}
		if(ar23.length>1 && ar23 != null) {
			int ran = (int) (Math.random() * ar23.length-1);
			total_ar.add(ar23[ran]);
		}
		if(ar24.length>1 && ar24 != null) {
			int ran = (int) (Math.random() * ar24.length-1);
			total_ar.add(ar24[ran]);
		}

		
		// jsp에 보내기 위한 ar
		MainVO[] ar =null;
		
		if(!total_ar.isEmpty() && total_ar != null) {
			ar = new MainVO[total_ar.size()];
			
			total_ar.toArray(ar);
		}
		
		session.setAttribute("path", "main");
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("ar", ar);
		mv.setViewName("main");

		return mv;
	}
	
	
	public MainVO[] makeURL(String category) throws Exception {

		String categoryNm = null;
		
		if(category.equals("01")) {
			categoryNm = "사업관리";
		} else if(category.equals("02")) {
			categoryNm = "경영·회계·사무";
		} else if(category.equals("03")) {
			categoryNm = "금융·보험";
		} else if(category.equals("04")) {
			categoryNm = "교육·자연·사회과학";
		} else if(category.equals("05")) {
			categoryNm = "법률·경찰·소방·교도·국방";
		} else if(category.equals("06")) {
			categoryNm = "보건·의료";
		} else if(category.equals("07")) {
			categoryNm = "사회복지·종교";
		} else if(category.equals("08")) {
			categoryNm = "문화·예술·디자인·방송";
		} else if(category.equals("09")) {
			categoryNm = "운전·운송";
		} else if(category.equals("10")) {
			categoryNm = "영업판매";
		} else if(category.equals("11")) {
			categoryNm = "경비·청소";
		} else if(category.equals("12")) {
			categoryNm = "이용·숙박·여행·오락·스포츠";
		} else if(category.equals("13")) {
			categoryNm = "음식서비스";
		} else if(category.equals("14")) {
			categoryNm = "건설";
		} else if(category.equals("15")) {
			categoryNm = "기계";
		} else if(category.equals("16")) {
			categoryNm = "재료";
		} else if(category.equals("17")) {
			categoryNm = "화학";
		} else if(category.equals("18")) {
			categoryNm = "섬유·의복";
		} else if(category.equals("19")) {
			categoryNm = "전기·전자";
		} else if(category.equals("20")) {
			categoryNm = "정보통신";
		} else if(category.equals("21")) {
			categoryNm = "식품가공";
		} else if(category.equals("22")) {
			categoryNm = "인쇄·목재·가구·공예";
		} else if(category.equals("23")) {
			categoryNm = "환경·에너지·안전";
		} else if(category.equals("24")) {
			categoryNm = "농림어업";
		}
		
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		
		Calendar cal = Calendar.getInstance(); // 오늘날짜
		String today = format1.format(cal.getTime());
		
		cal.add(Calendar.MONTH, 6); // 6개월 뒤
		String future = format1.format(cal.getTime());
		
		// url은 현재날짜 기준으로 6개월 뒤 까지의 교육과정을 가져옴
		// 리스트는 최소 10개이상
		URL url = new URL("http://www.hrd.go.kr/hrdp/api/apipo/APIPO0101T.do?returnType=XML&pageNum=1&"
				+ "&authKey=Aflc7YIke55KR8qliEbmLwJGWIpsH2DL&sort=ASC&outType=1&srchTraStDt="+today+"&"
				+ "srchKeco1="+category+"&pageSize=10&sortCol=TR_STT_DT&srchTraEndDt="+future+"&srchTraPattern=N1&srchPart=-99"
				+ "&apiRequstPageUrlAdres=/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp&apiRequstIp=211.118.162.124");

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();

		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());

		Element root = doc.getRootElement();

		Element srchList = root.getChild("srchList");

		if(srchList != null) {
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
			vo.setCategoryNm(categoryNm);
			
			ar[i] = vo;
			i++;
		}

		
		return ar;
		
		} else {
			MainVO[] ar = new MainVO[1];

			return ar;
		}
		
	}
}
