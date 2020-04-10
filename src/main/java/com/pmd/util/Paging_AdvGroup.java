package com.pmd.util;

public class Paging_AdvGroup {

	private int nowPage, 
				rowTotal, 
				blockList, 
				blockPage, 
				totalPage, startPage, endPage, 
				begin, end;	
				/*
				현재 페이지
				총 게시물 수
				한 페이지에 표현 될 게시물 수
				한 블럭당 표현할  페이지 수
				..
				..
				*/
	
	private boolean isPrePage; // 이전 기능 가능여부
	private boolean isNextPage; // 다음 기능 가능여부
	
	private StringBuffer sb; // JSP에서 표현할 페이징 HTML코드를 저장할 곳

	private String adv_group;
	
	public Paging_AdvGroup(int nowPage, int rowTotal, int blockList, int blockPage, String adv_group) {
		super();
		this.nowPage = nowPage;
		this.rowTotal = rowTotal;
		this.blockList = blockList;
		this.blockPage = blockPage;
		this.adv_group = adv_group;
		
		// 이전 기능과 다음 기능을 초기화 시킨다
		isPrePage = false;
		isNextPage = false;
		
		// 입력 된 전체 게시물의 수를 통해 전체 페이지 수를 구한다
		totalPage = (int)Math.ceil((double)rowTotal/blockList);
		
		// 현재 페이지의 값이 전체 페이지 값보다 크다면,
		// 전체 페이지 값을 현재 페이지 값으로 지정
		if(nowPage>totalPage)
			nowPage = totalPage;
		
		// 현재 블럭의 시작페이지 값과 마지막 페이지 값을 구함
		startPage = (int)((nowPage-1)/blockPage)*blockPage+1;
		endPage = startPage+blockPage-1;
		
		// 마지막 페이지 값이 전체페이지 값보다 크면,
		// 전체 페이지 값으로 지정
		if(endPage>totalPage)
			endPage = totalPage;
		
		// 현재 페이지 값에 의해서 시작 게시물의 행번호(begin)와
		// 마지막 게시물의 행번호(end)를 지정한다
		begin = (nowPage-1)*blockList+1;
		end = begin+blockList-1;
		
		// 이전 기능 가능여부 확인
		if(startPage>1)
			isPrePage = true;
		
		// 다음 기능 가능여부 확인
		if(endPage<totalPage)
			isNextPage = true;
		
		// 이제 현재페이지 값도 알고, 시작페이지와 마지막페이지 값을 알았으니
		// 페이지 기법에 사용할 코드를 작성하여 StringBuffer에 저장하자!
		sb = new StringBuffer("<ul class='pagination-v4'>");
		
		if(isPrePage) { // 이전기능 활성
			sb.append("<li><a href='javascript:page(\"");
			sb.append(nowPage-blockPage);
			sb.append("\", \"");
			sb.append(adv_group);
			sb.append("\")'> &lt; </a></li>");
		}else { // 이전기능이 비활성화 상태
			sb.append("<li class='disable'> &lt; </li>");
		}
		
		// 페이지 번호 출력하는 반복문
		for(int i=startPage; i<=endPage; i++) {
			// i의 값이 현재페이지 값과 같을 때는
			// a태그를 지정하지 않고 숫자만 출력
			if(i == nowPage) {
				sb.append("<li><a class='active'>");
				sb.append(i);
				sb.append("</a></li>");
			}else { // 현재페이지가 아닌경우
				sb.append("<li><a href='javascript:page(\"");
				sb.append(i); // 파라미터 값
				sb.append("\", \"");
				sb.append(adv_group);
				sb.append("\")'>");
				sb.append(i); // 화면에 보이는 값
				sb.append("</a></li>");
			}
		}
		
		
		if(isNextPage) { // 다음기능 활성
			sb.append("<li><a href='javascript:page(\"");
			sb.append(nowPage+blockPage);
			sb.append("\", \"");
			sb.append(adv_group);
			sb.append("\")'> &gt; </a></li>");
		}else { // 다음기능이 비활성화 상태
			sb.append("<li class='disable'> &gt; </li>");
		}
		
		sb.append("</ul>");
	}


	
	public int getNowPage() {
		if(nowPage >= totalPage)
			nowPage = totalPage;
		
		return nowPage;
	}


	public void setNowPage(int nowPage) {

		this.nowPage = nowPage;
	}


	public int getRowTotal() {
		
		return rowTotal;
	}


	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}


	public int getBlockList() {
		return blockList;
	}


	public void setBlockList(int blockList) {
		this.blockList = blockList;
	}


	public int getBlockPage() {
		return blockPage;
	}


	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getBegin() {
		return begin;
	}


	public void setBegin(int begin) {
		this.begin = begin;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}


	public boolean isPrePage() {
		return isPrePage;
	}


	public void setPrePage(boolean isPrePage) {
		this.isPrePage = isPrePage;
	}


	public boolean isNextPage() {
		return isNextPage;
	}


	public void setNextPage(boolean isNextPage) {
		this.isNextPage = isNextPage;
	}


	public StringBuffer getSb() {
		return sb;
	}


	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}


	public String getAdv_group() {
		return adv_group;
	}

	public void setAdv_group(String adv_group) {
		this.adv_group = adv_group;
	}

}








