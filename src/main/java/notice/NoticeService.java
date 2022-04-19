package notice;

import java.util.List;


public interface NoticeService {
	
	//공지글 신규 저장
	int notice_insert(NoticeVO vo);
	
	//공지글 수정
	int notice_update(NoticeVO vo);
	
	//공지글 상세 조회
	NoticeVO notice_detail(int id);
	
	//공지글 목록 조회(페이지 처리)
	NoticePage notice_list(NoticePage page);
	
	//공지글 삭제
	int notice_delete(int id);
	
	//공지글 조회시 조회수 증가
	int notice_count(int id);
}