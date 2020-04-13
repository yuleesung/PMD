package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.pmd.vo.AdvVO;
import com.pmd.vo.BulletinVO;
import com.pmd.vo.Bulletin_C_VO;
import com.pmd.vo.UserVO;

public class BulletinDAO {

	@Autowired
	private SqlSessionTemplate ss;

	// 회원 아이디만 빼오기
	public String getID(String u_idx) {

		String id = ss.selectOne("bulletin.getID", u_idx);

		return id;
	}

	// 회원 로그인
	public UserVO login(String u_id, String u_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);

		UserVO vo = ss.selectOne("bulletin.login", map);

		return vo;
	}

	// 회원 가입
	public boolean join(UserVO vo) {
		boolean chk = false;

		int cnt = ss.insert("bulletin.join", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 게시물 쓰기
	public boolean writePost(BulletinVO vo) {
		boolean chk = false;

		int cnt = ss.insert("bulletin.writePost", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 댓글 쓰기
	public boolean writeComment(Bulletin_C_VO vo) {
		boolean chk = false;

		int cnt = ss.insert("bulletin.writeComment", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 뉴스 게시물 수
	public int getCount(String b_category) {

		int total = ss.selectOne("bulletin.getCount", b_category);

		return total;
	}

	// 전체보기
	public BulletinVO[] getList(String begin, String end, String b_category) {
		BulletinVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("b_category", b_category);

		List<BulletinVO> list = ss.selectList("bulletin.getList", map);
		if (list != null && !list.isEmpty()) {
			ar = new BulletinVO[list.size()];
			list.toArray(ar);
		}

		return ar;
	}

	// 게시물 보기
	public BulletinVO viewPost(String b_idx) {

		BulletinVO vo = ss.selectOne("bulletin.viewPost", b_idx);

		return vo;
	}

	// 게시물 수정
	public boolean editPost(BulletinVO vo) {
		boolean chk = false;

		int cnt = ss.update("bulletin.editPost", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 회원가입시 아이디 일치 검사
	public boolean matchMember(String u_id) {
		boolean chk = false;
		String vo_id = ss.selectOne("bulletin.matchMember", u_id);
		if(vo_id != null)
			chk = true;

		return chk;
	}

	// 회원 정보 수정
	public boolean updateMember(UserVO vo) {
		boolean chk = false;

		int cnt = ss.update("bulletin.updateMember", vo);
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

		int cnt = ss.update("bulletin.delMember", map);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 게시물 삭제
	public boolean delPost(String b_idx) {
		boolean chk = false;

		int cnt = ss.update("bulletin.delPost", b_idx);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 댓글 삭제
	public boolean delComment(String c_idx) {
		boolean chk = false;

		int cnt = ss.update("bulletin.delComment", c_idx);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 댓글 수정
	public boolean updateComment(Bulletin_C_VO vo) {
		boolean chk = false;

		int cnt = ss.update("bulletin.updateComment", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 조회 수 올리는 기능 - 인자로 받은 b_idx의 게시물 hit를 증가하는 기능
	public boolean hit(String b_idx) {
		boolean chk = false;

		int cnt = ss.update("bulletin.hit", b_idx);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 전체게시판 검색한 후 총 게시물 수
	public int getSearchAllCount(String subject) {

		int total = ss.selectOne("bulletin.getSearchAllCount", subject);

		return total;
	}

	// 전체 게시판 검색기능
	public BulletinVO[] searchAll(String begin, String end, String subject) {
		BulletinVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("subject", subject);

		List<BulletinVO> list = ss.selectList("bulletin.searchAll", map);
		if (list != null && !list.isEmpty()) {
			ar = new BulletinVO[list.size()];
			list.toArray(ar);
		}

		return ar;
	}

	// 카테고리별 게시판 검색한 총 게시물 수
	public int getSearchBoardCount(String subject, String b_category) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("b_category", b_category);

		int total = ss.selectOne("bulletin.getSearchBoardCount", map);

		return total;
	}

	// 카테고리별 게시판 검색기능
	public BulletinVO[] searchBoard(String begin, String end, String subject, String b_category) {
		BulletinVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("subject", subject);
		map.put("b_category", b_category);

		List<BulletinVO> list = ss.selectList("bulletin.searchBoard", map);
		if (list != null && !list.isEmpty()) {
			ar = new BulletinVO[list.size()];
			list.toArray(ar);
		}

		return ar;
	}
	
	// 소셜 아이디로 회원가입
	public boolean socialReg(Map<String, String> map) {
		boolean chk = false;
		int cnt = ss.insert("bulletin.socialReg", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 소셜 아이디로 로그인
	public UserVO socialLogin(Map<String, String> map) {
		UserVO vo = ss.selectOne("bulletin.socialLogin", map);
		return vo;
	}
	
	// 소셜 회원탈퇴를 했을 때, DB에 저장된 ID값이 있는지 확인
	public UserVO socialCheck(Map<String, String> map) {
		UserVO vo = ss.selectOne("bulletin.socialCheck", map);
		return vo;
	}
	
	// 소셜 회원탈퇴 후 재가입을 할 경우
	public boolean socialReReg(Map<String, String> map) {
		boolean chk = false;
		
		int cnt = ss.update("bulletin.socialReReg", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 소셜 연동 해제(탈퇴)
	public boolean socialLeave(Map<String, String> map) {
		boolean chk = false;
		
		int cnt = ss.update("bulletin.socialLeave", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 이메일 중복검사
	public boolean checkEmail(String email) {
		boolean chk = false;
		String str = ss.selectOne("bulletin.checkEmail", email);
		if(str != null)
			chk = true;
		
		return chk;
	}
	
	// 전화번호 중복검사
	public boolean checkPhone(String u_phone) {
		boolean chk = false;
		
		String str = ss.selectOne("bulletin.checkPhone", u_phone);
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
		
		int cnt = ss.update("bulletin.blockOrRelUser", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 게시물 삭제 또는 복구
	public boolean delOrRestoreBoard(String b_idx, String status) {
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("b_idx", b_idx);
		map.put("status", status);
		
		int cnt = ss.update("bulletin.delOrRestoreBoard", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 광고 넣기
	public boolean addAdv(AdvVO vo) {
		boolean chk = false;
		
		int cnt = ss.insert("bulletin.addAdv", vo);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 광고목록 보기
	public AdvVO[] listAdv(String begin, String end, String adv_group) {
		AdvVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("adv_group", adv_group);
		
		List<AdvVO> list = ss.selectList("bulletin.listAdv", map);
		if(list != null && !list.isEmpty()) {
			ar = new AdvVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 광고 수정
	public boolean updateAdv(AdvVO vo) {
		boolean chk = false;
		
		int cnt = ss.update("bulletin.updateAdv", vo);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 광고 삭제 또는 복구 
	public boolean delOrRestoreAdv(String a_idx, String status) {
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("a_idx", a_idx);
		map.put("status", status);
		
		int cnt = ss.update("bulletin.delOrRestoreAdv", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 관리자 로그인
	public UserVO adminLogin(String u_id, String u_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
		
		UserVO vo = ss.selectOne("bulletin.adminLogin", map);
		
		return vo;
	}
	
	// 유저 목록
	public UserVO[] listUser(String begin, String end) {
		UserVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		
		List<UserVO> list = ss.selectList("bulletin.listUser", map);
		if(list != null && !list.isEmpty()) {
			ar = new UserVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 관리자용 게시물 전체보기
	public BulletinVO[] getListForAdmin(String begin, String end, String b_category) {
		BulletinVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("b_category", b_category);
		
		List<BulletinVO> list = ss.selectList("bulletin.getListForAdmin", map);
		if(list != null && !list.isEmpty()) {
			ar = new BulletinVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 관리자용 게시물 수
	public int getCountForAdmin(String b_category) {
		return ss.selectOne("bulletin.getCountForAdmin", b_category);
	}
	
	// 유저 수
	public int getCountUser() {
		return ss.selectOne("bulletin.getCountUser");
	}
	
	// 광고 게시물 수
	public int getCountAdv(String adv_group) {
		return ss.selectOne("bulletin.getCountAdv", adv_group);
	}
	
	// 광고 하나 넣기
	public AdvVO viewAdv(String a_idx) {
		return ss.selectOne("bulletin.viewAdv", a_idx);
	}
	
	// 광고 상태를 모두 0으로 바꾸기
	public boolean setAdvZero(String adv_group) {
		boolean chk = false;
		
		int cnt = ss.update("bulletin.setAdvZero", adv_group);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 게시될 광고 가져오기
	public AdvVO[] showAdvOnMain() {
		AdvVO[] ar = null;
		
		List<AdvVO> list = ss.selectList("bulletin.showAdvOnMain");
		if(list != null && !list.isEmpty()) {
			ar = new AdvVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
}
