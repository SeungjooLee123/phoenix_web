package welfare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.PageVO;

@Service
public class VideoServiceImpl implements VideoService {
	@Autowired private VideoDAO dao;

	@Override
	public List<VideoVO> video_list(PageVO page) {
		return dao.video_list(page);
	}

	@Override
	public boolean video_insert(VideoVO vo) {
		return dao.video_insert(vo);
	}

	@Override
	public void video_delete(int no) {
		dao.video_delete(no);
	}

}
