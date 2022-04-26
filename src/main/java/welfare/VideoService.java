package welfare;

import java.util.List;

import common.PageVO;

public interface VideoService {
	//동영상 목록 조회하기
	List<VideoVO> video_list(PageVO page);
	
	//동영상 추가하기
	boolean video_insert(VideoVO vo);
	
	//동영상 삭제하기
	void video_delete(int no);
}