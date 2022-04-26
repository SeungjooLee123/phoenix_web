package welfare;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.PageVO;

@Repository
public class VideoDAO implements VideoService {
	@Autowired private SqlSession sql;
	
	@Override
	public List<VideoVO> video_list(PageVO page) {
		return sql.selectList("video.mapper.list", page);
	}

	@Override
	public boolean video_insert(VideoVO vo) {
		return sql.insert("video.mapper.insert", vo) == 1 ? true : false;
	}

	@Override
	public void video_delete(int no) {
		sql.delete("video.mapper.delete", no);
	}

}
