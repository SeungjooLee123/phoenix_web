package share;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import share.ShareCommentVO;
import share.SharePage;
import share.ShareVO;


public interface ShareService {

	int Share_insert(ShareVO vo);						//방명록 신규 저장(C)
	
	SharePage Share_list(SharePage page );				//방명록 목록 조회 -페이지 처리된 (R)
	
	ShareVO Share_detail(int id);						// 방명록 상세 조회
	
	int Share_read(int id);								// 방명록 조회수 처리 (U)
	
	int Share_update(ShareVO vo);						// 방명록 변경 저장(U)
	
	int Share_delete(int id);							//방명록 삭제처리(D)
	
	int Share_comment_insert(ShareCommentVO vo);		//방명록 댓글 신규 저장 처리
	
	int Share_comment_update(ShareCommentVO vo);	//방명록 댓글 변경 저장 처리
	
	int Share_comment_delete(int id);					//방명록 댓글 삭제처리
	
	List<ShareCommentVO> Share_comment_list(int id);	//방명록 댓글 목록 조회	pid : 원글의 id
	
	boolean Share_co_comment_regist(int comment_id, ShareCommentVO vo);
	
	
	
	
	
}
