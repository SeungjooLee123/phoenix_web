package community;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import community.CommunityCommentVO;
import community.CommunityPage;
import community.CommunityVO;


public interface CommunityService {

	int Community_insert(CommunityVO vo);						//방명록 신규 저장(C)
	
	CommunityPage Community_list(CommunityPage page );				//방명록 목록 조회 -페이지 처리된 (R)
	
	CommunityVO Community_detail(int id);						// 방명록 상세 조회
	
	int Community_read(int id);								// 방명록 조회수 처리 (U)
	
	int Community_update(CommunityVO vo);						// 방명록 변경 저장(U)
	
	int Community_delete(int id);							//방명록 삭제처리(D)
	
	int Community_comment_insert(CommunityCommentVO vo);		//방명록 댓글 신규 저장 처리
	
	int Community_comment_update(CommunityCommentVO vo);	//방명록 댓글 변경 저장 처리
	
	int Community_comment_delete(int id);					//방명록 댓글 삭제처리
	
	List<CommunityCommentVO> Community_comment_list(int pid);	//방명록 댓글 목록 조회	pid : 원글의 id
	
	boolean community_co_comment_regist(int comment_id, CommunityCommentVO vo);
	
	
	
	
	
}
