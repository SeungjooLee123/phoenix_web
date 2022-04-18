package welfare;

import java.util.List;

public interface WelfareService {
	//정책 전체 목록 조회
	List<WelfareVO> wel_list(String category);
	
	//정책 신규 저장
	boolean wel_insert(WelfareVO vo);
	
	//정책 수정
	boolean wel_update(WelfareVO vo);
	
	//정책 상세 조회
	WelfareVO wel_detail(int id);
	
	//정책 목록 조회(페이지 처리)
	WelfarePage wel_list(WelfarePage page);
	
	//정책 삭제
	void wel_delete(int id);
}