package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.pmd.vo.Bulletin_C_VO;

public class Bulletin_C_DAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	
	// 댓글 쓰기
	public boolean writeComment(Bulletin_C_VO vo) {
		boolean chk = false;

		int cnt = ss.insert("bulletin_c.writeComment", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 댓글 삭제
	public boolean delComment(String c_idx) {
		boolean chk = false;

		int cnt = ss.update("bulletin_c.delComment", c_idx);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	// 댓글 수정
	public boolean updateComment(Bulletin_C_VO vo) {
		boolean chk = false;

		int cnt = ss.update("bulletin_c.updateComment", vo);
		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}
	
	// 게시물 하나당 전체 댓글 수
	public int commCount(String b_idx) {
		return ss.selectOne("bulletin_c.commCount", b_idx);
	}
	
	// 게시물 하나당 전체 댓글 수
	public int commCountForAdmin(String u_idx) {
		return ss.selectOne("bulletin_c.commCountForAdmin", u_idx);
	}
	
	// ajax용 게시물 댓글 모음
	public Bulletin_C_VO[] commListForAjax(String b_idx, String begin, String end) {
		Bulletin_C_VO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("b_idx", b_idx);
		map.put("begin", begin);
		map.put("end", end);
		
		List<Bulletin_C_VO> list = ss.selectList("bulletin_c.commListForAjax", map);
		if(list != null && !list.isEmpty()) {
			ar = new Bulletin_C_VO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// ajax용 유저의 댓글 모음
	public Bulletin_C_VO[] u_commListForAjax(String u_idx, String begin, String end) {
		Bulletin_C_VO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_idx", u_idx);
		map.put("begin", begin);
		map.put("end", end);
		
		List<Bulletin_C_VO> list = ss.selectList("bulletin_c.u_commListForAjax", map);
		if(list != null && !list.isEmpty()) {
			ar = new Bulletin_C_VO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 댓글 복구
	public boolean restoreComm(String c_idx) {
		boolean chk = false;
		
		int cnt = ss.update("bulletin_c.restoreComm", c_idx);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}

}
