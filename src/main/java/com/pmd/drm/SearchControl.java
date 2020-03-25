package com.pmd.drm;

import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pmd.util.Paging;
import com.pmd.vo.SearchVO;

@Controller
public class SearchControl {

	/*!!!!!!!!!!!!!! 
	 * url의 path값은 임의 값임 => 92Line (url_rink로) 바꿔야 함 
	 * !!!!!!!!!! */
	
	// 페이징 기법을 위한 상수
	public final int BLOCK_LIST = 12; // 페이지 당 보여질 게시물 수
	public final int BLOCK_PAGE = 5; // 블럭 당 보여질 페이지 수
	
	int nowPage; // 현재 페이지 값
	int rowTotal; // 전체 게시물 수
	String pageCode; // 페이징  처리 된 HTML코드값
	
	//@RequestMapping("/search.inc") // 테스트용
	@RequestMapping(value="/search.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(String crseTracseSe, String srchTraOrganNm, String srchTraProcessNm,
									String srchTraArea1, String srchKeco1, String srchTraStDt, 
									String srchTraEndDt, String nowPage) throws Exception{
		
		
		
		
		/*
		::: 받는 인자들 :::
	 	훈련유형(선):crseTracseSe -> 배열로 넘어올 듯?.. 전체선택은 null값
		훈련기관명(선):srchTraOrganNm
		훈련과정명(선):srchTraProcessNm
		훈련지역(선): srchTraArea1 -> 코드값 있음. 배열 http://www.hrd.go.kr/hrdp/ap/papco/PAPCO0700T.do
		훈련분야(선): srchKeco1 -> 코드값 있음. 배열
		시작날짜(필):srchTraStDt
		마지막날짜(필):srchTraEndDt
		
		현재페이지 :  nowPage
		 */
	
		// 현재 페이지값 받기
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		// 날짜값을 받지 못 했을 경우
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		if(srchTraStDt == null) //시작날짜:today
			srchTraStDt = format1.format(cal.getTime()); 		
		
		if(srchTraEndDt == null) { //마지막날짜:today+6month
			cal.add(Calendar.MONTH, 6);
			srchTraEndDt = format1.format(cal.getTime()); 
		}
		

		
		// url 링크주소를 만들기 위한 sb
		StringBuffer sb = new StringBuffer();
		
		// 기본적으로 필요한 url
		sb.append("http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML&authKey=Aflc7YIke55KR8qliEbmLwJGWIpsH2DL"
				+"&pageNum="+this.nowPage+"&pageSize=12&srchTraStDt="+srchTraStDt+"&srchTraEndDt="+srchTraEndDt+"&outType=1&sort=ASC&sortCol=TR_STT_DT");
			
		// 조건 값이 null이 아닐 때 sb에 추가되는 영역
		if(crseTracseSe != null) 
			sb.append("&crseTracseSe="+crseTracseSe);
		if(srchTraOrganNm != null)
			sb.append("&srchTraOrganNm="+srchTraOrganNm);
		if(srchTraProcessNm != null)
			sb.append("&srchTraProcessNm="+srchTraProcessNm);
		if(srchTraArea1 != null)
			sb.append("&srchTraArea1="+srchTraArea1);
		if(srchKeco1 != null)
			sb.append("&srchKeco1="+srchKeco1);
		
		
		String url_rink = sb.toString(); // url주소(sb)를 스트링 값으로 변환(url_rink)
		
		
		URL url = new URL(url_rink);
		
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element srchList = root.getChild("srchList");
		
		// 검색 목록의 값들 얻기
		List<Element> scn_list = srchList.getChildren("scn_list");
		
		// list 요소들을 vo배열에 넣기
		SearchVO[] ar = new SearchVO[scn_list.size()];
		
		int i = 0;
		
		for(Element e : scn_list) {
			SearchVO vo = new SearchVO();
			
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
			
			ar[i] = vo;
			i++;
		}
		
		
		/* 페이징 영역 */
		// 검색결과 총 갯수
		rowTotal = Integer.parseInt(root.getChildText("scn_cnt"));
		
		// 메서드 호출
		Paging page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		// 페이지 버튼 코드
		pageCode = page.getSb().toString();
	
		
		
		// json에 반환할 map 생성
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("ar", ar); // 검색 결과값
		map.put("pageCode", pageCode); // 페이지버튼
		map.put("nowPage", page.getNowPage()); // 현재페이지
		map.put("rowTotal", rowTotal); // 검색결과 총 갯수
		map.put("blockList", BLOCK_LIST); // 한 페이지에 보여질 리스트 갯수
		
		return map;
	}
}
