package com.pmd.vo;

public class ViewVO {

	/*
	 <inst_base_info>
ADDR1	string	주소지	<addr1></addr>
ADDR2	string	상세주소	<addr2></addr2>
FILE_PATH	string	파일경로	<filePath></filePath>
HP_ADDR	string	홈페이지 주소	<hpAddr></hpAddr>
INO_NM	string	훈련기관명	<inoNm></inoNm>
실제훈련비			<instPerTrco></instPerTrco>
NCS_CD	string	NCS 코드	<ncsCd></ncsCd>
NCS_NM	string	NCS 명	<ncsNm></ncsNm>
NCS_YN	string	NCS 여부	<ncsYn></ncsYn>
NON_NCS_COURSE_PRCTTQ_TIME	string	비 NCS교과 실기시간	<nonNcsCoursePrcttqTime></nonNcsCoursePrcttqTime>
NON_NCS_COURSE_THEORY_TIME	string	비 NCS교과 이론시간	<nonNcsCourseTheoryTime></nonNcsCourseTheoryTime>
PER_TRCO	string	정부지원금	<perTrco></perTrco>
TORG_PAR_GRAD	string	평가등급	<torgParGrad></torgParGrad>
TR_DCNT	string	총 훈련일수	<trDcnt></trDcnt>
TRPR_CHAP	string	담당자명	<trprChap></trprChap>
TRPR_CHAP_EMAIL	string	담당자 이메일	<trprChapEmail></trprChapEmail>
TRPR_CHAP_TEL	string	담당자 전화번호	<trprChapTel></trprChapTel>
TRPR_DEGR	string	훈련과정 회차	<trprDegr></trprDegr>
TRPR_GBN	string	훈련과정 구분	<trprGbn></trprGbn>
TRPR_ID	string	훈련과정ID	<trprId></trprId>
TRPR_NM	string	훈련과정명	<trprNm></trprNm>
TRPR_TARGET	string	주요 훈련과정 구분	<trprTarget></trprTarget>
TRPR_TARGET_NM	string	주요 훈련과정 구분명	<trprTargetNm></trprTargetNm>
TRTM	string	총 훈련시간	<trtm></trtm>
</inst_base_info>		훈련기관 기초정보	
<inst_detail_info>		훈련기관 상세정보	
GOV_BUSI_NM	string	훈련분야명	<govBusiNm></govBusiNm>
TOT_TRAING_DYCT	string	훈련일수	<totTraingDyct></totTraingDyct>
TOT_TRAING_TIME	string	훈련시간	<totTraingTime></totTraingTime>
TOTAL_CRS_AT	string	수강료	<totalCrsAt></totalCrsAt>
</inst_detail_info>		훈련기관 상세정보	
	 */
	
	// 훈련기관 기초정보
	private String addr1, addr2, filePath, hpAddr, inoNm, instPerTrco,
					ncsCd, ncsNm, ncsYn, nonNcsCoursePrcttqTime, nonNcsCourseTheoryTime,
					perTrco, torgParGrad, trDcnt, trprChap, trprChapEmail, trprChapTel,
					trprDegr, trprGbn, trprId, trprNm, trprTarget, trprTargetNm, trtm;
	
	// 훈련기관 상세정보
	private String govBusiNm, totTraingDyct, totTraingTime, totalCrsAt;

	
	
	
	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getHpAddr() {
		return hpAddr;
	}

	public void setHpAddr(String hpAddr) {
		this.hpAddr = hpAddr;
	}

	public String getInoNm() {
		return inoNm;
	}

	public void setInoNm(String inoNm) {
		this.inoNm = inoNm;
	}

	public String getInstPerTrco() {
		return instPerTrco;
	}

	public void setInstPerTrco(String instPerTrco) {
		this.instPerTrco = instPerTrco;
	}

	public String getNcsCd() {
		return ncsCd;
	}

	public void setNcsCd(String ncsCd) {
		this.ncsCd = ncsCd;
	}

	public String getNcsNm() {
		return ncsNm;
	}

	public void setNcsNm(String ncsNm) {
		this.ncsNm = ncsNm;
	}

	public String getNcsYn() {
		return ncsYn;
	}

	public void setNcsYn(String ncsYn) {
		this.ncsYn = ncsYn;
	}

	public String getNonNcsCoursePrcttqTime() {
		return nonNcsCoursePrcttqTime;
	}

	public void setNonNcsCoursePrcttqTime(String nonNcsCoursePrcttqTime) {
		this.nonNcsCoursePrcttqTime = nonNcsCoursePrcttqTime;
	}

	public String getNonNcsCourseTheoryTime() {
		return nonNcsCourseTheoryTime;
	}

	public void setNonNcsCourseTheoryTime(String nonNcsCourseTheoryTime) {
		this.nonNcsCourseTheoryTime = nonNcsCourseTheoryTime;
	}

	public String getPerTrco() {
		return perTrco;
	}

	public void setPerTrco(String perTrco) {
		this.perTrco = perTrco;
	}

	public String getTorgParGrad() {
		return torgParGrad;
	}

	public void setTorgParGrad(String torgParGrad) {
		this.torgParGrad = torgParGrad;
	}

	public String getTrDcnt() {
		return trDcnt;
	}

	public void setTrDcnt(String trDcnt) {
		this.trDcnt = trDcnt;
	}

	public String getTrprChap() {
		return trprChap;
	}

	public void setTrprChap(String trprChap) {
		this.trprChap = trprChap;
	}

	public String getTrprChapEmail() {
		return trprChapEmail;
	}

	public void setTrprChapEmail(String trprChapEmail) {
		this.trprChapEmail = trprChapEmail;
	}

	public String getTrprChapTel() {
		return trprChapTel;
	}

	public void setTrprChapTel(String trprChapTel) {
		this.trprChapTel = trprChapTel;
	}

	public String getTrprDegr() {
		return trprDegr;
	}

	public void setTrprDegr(String trprDegr) {
		this.trprDegr = trprDegr;
	}

	public String getTrprGbn() {
		return trprGbn;
	}

	public void setTrprGbn(String trprGbn) {
		this.trprGbn = trprGbn;
	}

	public String getTrprId() {
		return trprId;
	}

	public void setTrprId(String trprId) {
		this.trprId = trprId;
	}

	public String getTrprNm() {
		return trprNm;
	}

	public void setTrprNm(String trprNm) {
		this.trprNm = trprNm;
	}

	public String getTrprTarget() {
		return trprTarget;
	}

	public void setTrprTarget(String trprTarget) {
		this.trprTarget = trprTarget;
	}

	public String getTrprTargetNm() {
		return trprTargetNm;
	}

	public void setTrprTargetNm(String trprTargetNm) {
		this.trprTargetNm = trprTargetNm;
	}

	public String getTrtm() {
		return trtm;
	}

	public void setTrtm(String trtm) {
		this.trtm = trtm;
	}

	public String getGovBusiNm() {
		return govBusiNm;
	}

	public void setGovBusiNm(String govBusiNm) {
		this.govBusiNm = govBusiNm;
	}

	public String getTotTraingDyct() {
		return totTraingDyct;
	}

	public void setTotTraingDyct(String totTraingDyct) {
		this.totTraingDyct = totTraingDyct;
	}

	public String getTotTraingTime() {
		return totTraingTime;
	}

	public void setTotTraingTime(String totTraingTime) {
		this.totTraingTime = totTraingTime;
	}

	public String getTotalCrsAt() {
		return totalCrsAt;
	}

	public void setTotalCrsAt(String totalCrsAt) {
		this.totalCrsAt = totalCrsAt;
	}
	
	
}
