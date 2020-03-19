package com.pmd.drm;

import java.net.HttpURLConnection;
import java.net.URL;
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
import com.pmd.vo.ListVO;

@Controller
public class ListAction {

	// 페이징 기법을 위한 상수
	public final int BLOCK_LIST = 12; // 페이지 당 보여질 게시물 수
	public final int BLOCK_PAGE = 3; // 블럭 당 보여질 페이지 수
	
	int nowPage; // 현재 페이지 값
	int rowTotal; // 전체 게시물 수
	String pageCode; // 페이징  처리 된 HTML코드값
	
	@RequestMapping("/list.inc")
	//@RequestMapping(value="/list.inc", method=RequestMethod.POST, produces="text/json;charset=utf-8")
	//@ResponseBody
	public Map<String, Object> list(String crseTracseSe, String srchTraOrganNm, String srchTraProcessNm,
										String srchTraArea1, String srchKeco1, String srchTraStDt, String srchTraEndDt,
										String nowPage) throws Exception{
		
		/*
	 	훈련유형(선):crseTracseSe
		훈련기관명(선):srchTraOrganNm
		훈련과정명(선):srchTraProcessNm
		훈련지역(선): srchTraArea1 -> 코드값 있음 http://www.hrd.go.kr/hrdp/ap/papco/PAPCO0700T.do
		훈련분야(선): srchKeco1 -> 코드값 있음
		시작날짜(필):srchTraStDt
		마지막날짜(필):srchTraEndDt
		+ nowPage
		 */
		
		
		/*url의 path값은 임의 값임 => 바꿔야 함*/
		
		
		
		
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		
		// url 링크주소를 만들기 위한 sb
		StringBuffer sb = new StringBuffer();
		
		// 기본적으로 필요한 url
		sb.append("http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML&authKey=SLteRyA9SmMtvydD2HhNkBc12HXRheCy"
				+"&pageNum="+this.nowPage+"&pageSize=12&srchTraStDt="+srchTraStDt+"&srchTraEndDt="+srchTraEndDt+"&outType=1&sort=ASC&sortCol=TR_STT_DT");
		
		// 조건 값이 null이 아닐 때 추가 됨
		if(crseTracseSe != null)
			sb.append("&crseTracseSe="+crseTracseSe);
		if(srchTraOrganNm != null)
			sb.append("&srchTraOrganNm="+srchTraOrganNm);
		if(srchTraProcessNm != null)
			sb.append("&srchTraProcessNm"+srchTraProcessNm);
		if(srchTraArea1 != null)
			sb.append("&srchTraArea1="+srchTraArea1);
		if(srchKeco1 != null)
			sb.append("&srchKeco1="+srchKeco1);
		
		String url_rink = sb.toString();
		
		URL url = new URL("http://www.hrd.go.kr/hrdp/api/apipo/APIPO0101T.do?returnType=XML&pageNum=1&authKey=SLteRyA9SmMtvydD2HhNkBc12HXRheCy&sort=ASC&outType=1&srchTraStDt=20200319&pageSize=12&sortCol=TR_STT_DT&srchTraEndDt=20200619&srchTraPattern=N1&srchPart=-99&apiRequstPageUrlAdres=/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp&apiRequstIp=211.118.162.124");
		
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
		ListVO[] ar = new ListVO[scn_list.size()];
		
		int i = 0;
		
		for(Element e : scn_list) {
			ListVO vo = new ListVO();
			
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
	
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("ar", ar); // 검색 데이터
		map.put("pageCode", pageCode);
		map.put("nowPage", page.getNowPage());
		map.put("rowTotal", rowTotal);
		map.put("blockList", BLOCK_LIST);
		
		return map;
	}
}