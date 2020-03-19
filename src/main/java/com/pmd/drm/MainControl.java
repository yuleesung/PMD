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
		
	
		// 카테고리별 목록 10개씩 받아 옴
		MainVO[] ar1 = makeURL("01"); MainVO[] ar2 =  makeURL("02"); MainVO[] ar3 =  makeURL("03");
		MainVO[] ar4 = makeURL("04"); MainVO[] ar5 =  makeURL("05"); MainVO[] ar6 =  makeURL("06");
		MainVO[] ar7 =  makeURL("07"); MainVO[] ar8 =  makeURL("08"); MainVO[] ar9 =  makeURL("09");
		MainVO[] ar10 =  makeURL("10"); MainVO[] ar11 =  makeURL("11"); MainVO[] ar12 =  makeURL("12");
		MainVO[] ar13 =  makeURL("13"); MainVO[] ar14 =  makeURL("14"); MainVO[] ar15 =  makeURL("15");
		MainVO[] ar16 =  makeURL("16"); MainVO[] ar17 =  makeURL("17"); MainVO[] ar18 =  makeURL("18");
		MainVO[] ar19 =  makeURL("19"); MainVO[] ar20 =  makeURL("20"); MainVO[] ar21 =  makeURL("21");
		MainVO[] ar22 =  makeURL("22"); MainVO[] ar23 =  makeURL("23"); MainVO[] ar24 =  makeURL("24");
		
		// 카테고리별(24개)내용을 각각 1개씩 배열에 넣어 줌 
		MainVO[] total_ar = new MainVO[24];
		
		for(int i=0; i<total_ar.length; i++) {
			int ran = (int) (Math.random() * 9);
			
			switch (i) {
			case 0:
				total_ar[i] = ar1[ran];
				break;
			case 1:
				total_ar[i] = ar2[ran];
				break;
			case 2:
				total_ar[i] = ar3[ran];
				break;
			case 3:
				total_ar[i] = ar4[ran];
				break;
			case 4:
				total_ar[i] = ar5[ran];
				break;
			case 5:
				total_ar[i] = ar6[ran];
				break;
			case 6:
				total_ar[i] = ar7[ran];
				break;
			case 7:
				total_ar[i] = ar8[ran];
				break;
			case 8:
				total_ar[i] = ar9[ran];
				break;
			case 9:
				total_ar[i] = ar10[ran];
				break;
			case 10:
				total_ar[i] = ar11[ran];
				break;
			case 11:
				total_ar[i] = ar12[ran];
				break;
			case 12:
				total_ar[i] = ar13[ran];
				break;
			case 13:
				total_ar[i] = ar14[ran];
				break;
			case 14:
				total_ar[i] = ar15[ran];
				break;
			case 15:
				total_ar[i] = ar16[ran];
				break;
			case 16:
				total_ar[i] = ar17[ran];
				break;
			case 17:
				total_ar[i] = ar18[ran];
				break;
			case 18:
				total_ar[i] = ar19[ran];
				break;
			case 19:
				total_ar[i] = ar20[ran];
				break;
			case 20:
				total_ar[i] = ar21[ran];
				break;
			case 21:
				total_ar[i] = ar22[ran];
				break;
			case 22:
				total_ar[i] = ar23[ran];
				break;
			case 23:
				total_ar[i] = ar24[ran];
				break;			
			}
		}
		
		// jsp에 보내기 위한 ar
		MainVO[] ar = new MainVO[9];
		
		for(int i=0; i<ar.length; i++) {
			int ran = (int) (Math.random() * 23);
			
			ar[i] = total_ar[ran];
		}
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("ar", ar);
		mv.setViewName("main");
		
		return mv;
	}
	
	
	public MainVO[] makeURL(String category) throws Exception {
		// 지역코드값
		int[] area = {11, 26, 27, 28, 29, 30, 31, 41, 42, 43, 44, 45, 46, 47, 48, 50};

		int ran = (int) (Math.random() * area.length);

		// url은 임의 값임. 지역값을 랜덤값으로 변경
		// 리스트는 최소 10개이상
		URL url = new URL("http://www.hrd.go.kr/hrdp/api/apipo/APIPO0101T.do?returnType=XML&pageNum=1&"
				+ "srchTraArea1="+ area[ran]+"&authKey=Aflc7YIke55KR8qliEbmLwJGWIpsH2DL&sort=ASC&outType=1&srchTraStDt=20200318&"
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
