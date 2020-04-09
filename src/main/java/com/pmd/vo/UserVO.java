package com.pmd.vo;

import java.io.Serializable;
import java.util.List;

public class UserVO implements Serializable{
	
	private String u_idx, u_id, u_pw, email, u_phone, reg_date, u_name, nickname, sns_id, sns_type, sns_profile, status;

	private List<BulletinVO> b_list;
	
	private List<Bulletin_C_VO> c_list;

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSns_id() {
		return sns_id;
	}

	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}

	public String getSns_type() {
		return sns_type;
	}

	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}

	public String getSns_profile() {
		return sns_profile;
	}

	public void setSns_profile(String sns_profile) {
		this.sns_profile = sns_profile;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<BulletinVO> getB_list() {
		return b_list;
	}

	public void setB_list(List<BulletinVO> b_list) {
		this.b_list = b_list;
	}

	public List<Bulletin_C_VO> getC_list() {
		return c_list;
	}

	public void setC_list(List<Bulletin_C_VO> c_list) {
		this.c_list = c_list;
	}

}
