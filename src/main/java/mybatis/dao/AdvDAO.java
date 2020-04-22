package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.pmd.vo.AdvVO;

public class AdvDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	
	// 광고 넣기
	public boolean addAdv(AdvVO vo) {
		boolean chk = false;
		
		int cnt = ss.insert("adv.addAdv", vo);
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
		
		List<AdvVO> list = ss.selectList("adv.listAdv", map);
		if(list != null && !list.isEmpty()) {
			ar = new AdvVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 광고 수정
	public boolean updateAdv(AdvVO vo) {
		boolean chk = false;
		
		int cnt = ss.update("adv.updateAdv", vo);
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
		
		int cnt = ss.update("adv.delOrRestoreAdv", map);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 광고 게시물 수
	public int getCountAdv(String adv_group) {
		return ss.selectOne("adv.getCountAdv", adv_group);
	}
	
	// 광고 하나 넣기
	public AdvVO viewAdv(String a_idx) {
		return ss.selectOne("adv.viewAdv", a_idx);
	}
	
	// 광고 상태를 모두 0으로 바꾸기
	public boolean setAdvZero(String adv_group) {
		boolean chk = false;
		
		int cnt = ss.update("adv.setAdvZero", adv_group);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 게시될 광고 가져오기
	public AdvVO[] showAdvOnMain() {
		AdvVO[] ar = null;
		
		List<AdvVO> list = ss.selectList("adv.showAdvOnMain");
		if(list != null && !list.isEmpty()) {
			ar = new AdvVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 광고 전체, 회사, 이메일 검색하고난 후 총 광고 수
	public int searchAdvCount(String searchTypeForAdv, String searchValueForAdv, String adv_group) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchTypeForAdv", searchTypeForAdv);
		map.put("searchValueForAdv", searchValueForAdv);
		map.put("adv_group", adv_group);
		
		return ss.selectOne("adv.searchAdvCount", map);
	}
	
	// 광고 전체, 회사, 이메일로 검색하는 기능
	public AdvVO[] searchAdv(String searchTypeForAdv, String searchValueForAdv, String adv_group, String begin, String end) {
		AdvVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchTypeForAdv", searchTypeForAdv);
		map.put("searchValueForAdv", searchValueForAdv);
		map.put("adv_group", adv_group);
		map.put("begin", begin);
		map.put("end", end);
		
		List<AdvVO> list = ss.selectList("adv.searchAdv", map);
		if(list != null && !list.isEmpty()) {
			ar = new AdvVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 날짜 비교를 위한 adv_t 날짜 검색 기능
	public AdvVO[] searchDateOnAdv_t(String adv_group) {
		AdvVO[] ar = null;
		
		List<AdvVO> list = ss.selectList("adv.searchDateOnAdv_t", adv_group);
		if(list != null && !list.isEmpty()) {
			ar = new AdvVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	// 수정시 날짜 비교를 위한 adv_t 날짜 검색 기능
	public AdvVO[] searchDateOnAdv_tForUpdate(String a_idx, String adv_group) {
		AdvVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("a_idx", a_idx);
		map.put("adv_group", adv_group);
		
		List<AdvVO> list = ss.selectList("adv.searchDateOnAdv_tForUpdate", map);
		if(list != null && !list.isEmpty()) {
			ar = new AdvVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}

}
