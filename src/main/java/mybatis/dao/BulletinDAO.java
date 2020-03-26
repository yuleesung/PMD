package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.pmd.vo.BulletinVO;
import com.pmd.vo.Bulletin_C_VO;
import com.pmd.vo.UserVO;

public class BulletinDAO {

	@Autowired
	private SqlSessionTemplate ss;

	// 회원 아이디만 빼오기
	public String getID(String m_idx) {

		String id = ss.selectOne("bulletin.getID", m_idx);

		return id;
	}

	// 회원 로그인
	public UserVO login(String m_id, String pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("pw", pw);

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
	public String matchMember(String m_id) {

		String vo_id = ss.selectOne("bulletin.matchMember", m_id);

		return vo_id;
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
	public boolean delMember(String m_idx, String pw) {
		boolean chk = false;

		Map<String, String> map = new HashMap<String, String>();
		map.put("m_idx", m_idx);
		map.put("pw", pw);

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
	
	// 네이버 아이디로 회원가입
	public boolean naverReg(Map<String, String> map) {
		boolean chk = false;
		int cnt = ss.insert("bulletin.naverReg", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 네이버 아이디로 로그인
	public UserVO naverLogin(String sns_id) {
		UserVO vo = ss.selectOne("bulletin.naverLogin", sns_id);
		return vo;
	}
}
