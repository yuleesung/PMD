package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.pmd.vo.UserVO;

public class UsersDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	// 회원 아이디만 빼오기
	public String getID(String u_idx) {

		String id = ss.selectOne("users.getID", u_idx);

		return id;
	}

	// 회원 로그인
	public UserVO login(String u_id, String u_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);

		UserVO vo = ss.selectOne("users.login", map);

		return vo;
	}

	// 회원 가입
	public boolean join(UserVO vo) {
		boolean chk = false;

		int cnt = ss.insert("users.join", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}
	
	// 회원가입시 아이디 일치 검사
	public boolean matchMember(String u_id) {
		boolean chk = false;
		String vo_id = ss.selectOne("users.matchMember", u_id);
		if(vo_id != null)
			chk = true;

		return chk;
	}

	// 회원 정보 수정
	public boolean updateMember(UserVO vo) {
		boolean chk = false;

		int cnt = ss.update("users.updateMember", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 회원 탈퇴
	public boolean delMember(String u_idx, String u_pw) {
		boolean chk = false;

		Map<String, String> map = new HashMap<String, String>();
		map.put("u_idx", u_idx);
		map.put("u_pw", u_pw);

		int cnt = ss.update("users.delMember", map);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}
	
	// 소셜 아이디로 회원가입
	public boolean socialReg(Map<String, String> map) {
		boolean chk = false;
		int cnt = ss.insert("users.socialReg", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 소셜 아이디로 로그인
	public UserVO socialLogin(Map<String, String> map) {
		UserVO vo = ss.selectOne("users.socialLogin", map);
		return vo;
	}
	
	// 소셜 회원탈퇴를 했을 때, DB에 저장된 ID값이 있는지 확인
	public UserVO socialCheck(Map<String, String> map) {
		UserVO vo = ss.selectOne("users.socialCheck", map);
		return vo;
	}
	
	// 소셜 회원탈퇴 후 재가입을 할 경우
	public boolean socialReReg(Map<String, String> map) {
		boolean chk = false;
		
		int cnt = ss.update("users.socialReReg", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 소셜 연동 해제(탈퇴)
	public boolean socialLeave(Map<String, String> map) {
		boolean chk = false;
		
		int cnt = ss.update("users.socialLeave", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 이메일 중복검사
	public boolean checkEmail(String email) {
		boolean chk = false;
		String str = ss.selectOne("users.checkEmail", email);
		if(str != null)
			chk = true;
		
		return chk;
	}
	
	// 전화번호 중복검사
	public boolean checkPhone(String u_phone) {
		boolean chk = false;
		
		String str = ss.selectOne("users.checkPhone", u_phone);
		if(str != null)
			chk = true;
		
		return chk;
	}
	
	// 회원 정지 또는 해제
	public boolean blockOrRelUser(String u_idx, String status) {
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_idx", u_idx);
		map.put("status", status);
		
		int cnt = ss.update("users.blockOrRelUser", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 관리자 로그인
	public UserVO adminLogin(String u_id, String u_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
		
		UserVO vo = ss.selectOne("users.adminLogin", map);
		
		return vo;
	}
	
	// 유저 목록
	public UserVO[] listUser(String begin, String end) {
		UserVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		
		List<UserVO> list = ss.selectList("users.listUser", map);
		if(list != null && !list.isEmpty()) {
			ar = new UserVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 유저 수
	public int getCountUser() {
		return ss.selectOne("users.getCountUser");
	}
	
	// 회원 검색 후 총 회원 수
	public int searchUserCountForAdmin(String u_id, String nickname, String u_name, String email, String sns_id, String reg_date, String total, String active, String stop, String leave, String choice) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("nickname", nickname);
		map.put("u_name", u_name);
		map.put("email", email);
		map.put("sns_id", sns_id);
		map.put("reg_date", reg_date);
		map.put("total", total);
		map.put("active", active);
		map.put("stop", stop);
		map.put("leave", leave);
		map.put("choice", choice);
		
		return ss.selectOne("users.searchUserCountForAdmin", map);
	}
	
	// 회원 검색 기능
	public UserVO[] searchUserForAdmin(String u_id, String nickname, String u_name, String email, String sns_id, String reg_date, String total, String active, String stop, String leave, String choice, String begin, String end) {
		UserVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("nickname", nickname);
		map.put("u_name", u_name);
		map.put("email", email);
		map.put("sns_id", sns_id);
		map.put("reg_date", reg_date);
		map.put("total", total);
		map.put("active", active);
		map.put("stop", stop);
		map.put("leave", leave);
		map.put("choice", choice);
		map.put("begin", begin);
		map.put("end", end);
		
		List<UserVO> list = ss.selectList("users.searchUserForAdmin", map);
		if(list != null && !list.isEmpty()) {
			ar = new UserVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 이전 비밀번호 확인
	public boolean checkPrePw(String u_idx, String u_pw) {
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_idx", u_idx);
		map.put("u_pw", u_pw);
		
		UserVO vo = ss.selectOne("users.checkPrePw", map);
		if(vo != null)
			chk = true;
		
		return chk;
	}
	
	// 회원 정보 수정 후 로그인 정보 갱신 후 세션 저장용
	public UserVO afterUpdateUserInfo(String u_idx) {
		return ss.selectOne("users.afterUpdateUserInfo", u_idx);
	}
	
}
