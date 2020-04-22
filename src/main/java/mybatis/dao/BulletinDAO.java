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


	// 게시물 쓰기
	public boolean writePost(BulletinVO vo) {
		boolean chk = false;

		int cnt = ss.insert("bulletin.writePost", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 게시물 수
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

	// 게시물 삭제
	public boolean delPost(String b_idx) {
		boolean chk = false;

		int cnt = ss.update("bulletin.delPost", b_idx);
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
	
	// 전체, 제목, 이름, 내용 검색한 후 총 게시물 수
	public int searchBulletinCount(String searchType, String searchValue, String b_category) {
		
		Map<String, String > map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		map.put("b_category", b_category);

		int total = ss.selectOne("bulletin.searchBulletinCount", map);

		return total;
	}

	// 전체, 제목, 이름, 내용 게시판 검색기능
	public BulletinVO[] searchBulletin(String begin, String end, String searchType, String searchValue, String b_category) {
		BulletinVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		map.put("b_category", b_category);

		List<BulletinVO> list = ss.selectList("bulletin.searchBulletin", map);
		if (list != null && !list.isEmpty()) {
			ar = new BulletinVO[list.size()];
			list.toArray(ar);
		}

		return ar;
	}
	
	// 관리자용 전체, 제목, 이름, 내용 검색한 후 총 게시물 수
	public int searchBulletinCountForAdmin(String searchTypeForAdmin, String searchValueForAdmin, String b_category) {
		
		Map<String, String > map = new HashMap<String, String>();
		map.put("searchTypeForAdmin", searchTypeForAdmin);
		map.put("searchValueForAdmin", searchValueForAdmin);
		map.put("b_category", b_category);

		int total = ss.selectOne("bulletin.searchBulletinCountForAdmin", map);

		return total;
	}

	// 관리자용 전체, 제목, 이름, 내용 게시판 검색기능
	public BulletinVO[] searchBulletinForAdmin(String begin, String end, String searchTypeForAdmin, String searchValueForAdmin, String b_category) {
		BulletinVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("searchTypeForAdmin", searchTypeForAdmin);
		map.put("searchValueForAdmin", searchValueForAdmin);
		map.put("b_category", b_category);

		List<BulletinVO> list = ss.selectList("bulletin.searchBulletinForAdmin", map);
		if (list != null && !list.isEmpty()) {
			ar = new BulletinVO[list.size()];
			list.toArray(ar);
		}

		return ar;
	}
	
}
