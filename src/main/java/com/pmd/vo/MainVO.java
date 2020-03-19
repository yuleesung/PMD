package com.pmd.vo;

public class MainVO {

	/*
 	<HRDNet>		XML문서의 최상위 노드입니다.	
<scn_cnt>	string	검색된 총 건수	</scn_cnt>
<pageNum>	string	현재페이지	</pageNum>
<pageSize>	string	페이지당 출력개수, 페이지당 표현될 자료의 개수	</pageSize>
	
ADDRESS	string	주소	<address></address>

COURSE_MAN	string	수강비	<courseMan></courseMan>

IMG_GUBUN	string	제목 아이콘 구분	<imgGubun></imgGubun>
INST_CD	string	훈련기관 코드	<instCd></instCd>
NCS_CD	string	NCS 코드	<ncsCd></ncsCd>
REAL_MAN	string	실제 훈련비	<ncsCd></ncsCd>
REG_COURSE_MAN	string	수강신청 인원	<regCourseMan></regCourseMan>
SUB_TITLE	string	부 제목	<subTitle></subTitle>
SUB_TITLE_LINK	string	부 제목 링크	<subTitleLink></subTitleLink>
SUPER_VISER	string	주관부처	<superViser></superViser>
TEL_NO	string	전화번호	<telNo></telNo>
TITLE	string	제목	<title></title>
TITLE_ICON	string	제목 아이콘	<titleIcon></titleIcon>
???TITLE_LINK	string	제목 링크	<titleLink></titleLink>
TRA_END_DATE	string	훈련종료일자	<traEndDate></traEndDate>
TRA_START_DATE	string	훈련시작일자	<traStartDate></traStartDate>
TRAIN_TARGET	string	훈련대상	<trainTarget></trainTarget>

TRAINST_CST_ID	string	훈련기관ID	<trainstCstId></trainstCstId>
TRPR_DEGR	string	훈련과정 순차	<trprDegr></trprDegr>
TRPR_ID	string	훈련과정ID	<trprId></trprId>
YARD_MAN	string	정원	<yardMan></yardMan>
</scn_list>			
</srchList>			
</HRDNet>
 */
	
	private String address, courseMan, imgGubun, instCd, ncsCd, 
					regCourseMan, subTitle, subTitleLink, superViser, 
					telNo, title, titleIcon, titleLink, traEndDate,
					traStartDate, trainTarget, trainstCstId, trprDegr,
					trprId, yardMan;

	private String category;

	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCourseMan() {
		return courseMan;
	}

	public void setCourseMan(String courseMan) {
		this.courseMan = courseMan;
	}

	public String getImgGubun() {
		return imgGubun;
	}

	public void setImgGubun(String imgGubun) {
		this.imgGubun = imgGubun;
	}

	public String getInstCd() {
		return instCd;
	}

	public void setInstCd(String instCd) {
		this.instCd = instCd;
	}

	public String getNcsCd() {
		return ncsCd;
	}

	public void setNcsCd(String ncsCd) {
		this.ncsCd = ncsCd;
	}

	public String getRegCourseMan() {
		return regCourseMan;
	}

	public void setRegCourseMan(String regCourseMan) {
		this.regCourseMan = regCourseMan;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getSubTitleLink() {
		return subTitleLink;
	}

	public void setSubTitleLink(String subTitleLink) {
		this.subTitleLink = subTitleLink;
	}

	public String getSuperViser() {
		return superViser;
	}

	public void setSuperViser(String superViser) {
		this.superViser = superViser;
	}

	public String getTelNo() {
		return telNo;
	}

	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleIcon() {
		return titleIcon;
	}

	public void setTitleIcon(String titleIcon) {
		this.titleIcon = titleIcon;
	}

	public String getTitleLink() {
		return titleLink;
	}

	public void setTitleLink(String titleLink) {
		this.titleLink = titleLink;
	}

	public String getTraEndDate() {
		return traEndDate;
	}

	public void setTraEndDate(String traEndDate) {
		this.traEndDate = traEndDate;
	}

	public String getTraStartDate() {
		return traStartDate;
	}

	public void setTraStartDate(String traStartDate) {
		this.traStartDate = traStartDate;
	}

	public String getTrainTarget() {
		return trainTarget;
	}

	public void setTrainTarget(String trainTarget) {
		this.trainTarget = trainTarget;
	}

	public String getTrainstCstId() {
		return trainstCstId;
	}

	public void setTrainstCstId(String trainstCstId) {
		this.trainstCstId = trainstCstId;
	}

	public String getTrprDegr() {
		return trprDegr;
	}

	public void setTrprDegr(String trprDegr) {
		this.trprDegr = trprDegr;
	}

	public String getTrprId() {
		return trprId;
	}

	public void setTrprId(String trprId) {
		this.trprId = trprId;
	}

	public String getYardMan() {
		return yardMan;
	}

	public void setYardMan(String yardMan) {
		this.yardMan = yardMan;
	}
	
	
}
