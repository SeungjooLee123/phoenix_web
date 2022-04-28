package community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired private CommunityDAO dao;

	@Override
	public int Community_insert(CommunityVO vo) {
		return dao.Community_insert(vo);
	}

	@Override
	public CommunityPage Community_list(CommunityPage page) {
		return dao.Community_list(page);
	}

	@Override
	public CommunityVO Community_detail(int id) {
		return dao.Community_detail(id);
	}

	@Override
	public int Community_read(int id) {
		return dao.Community_read(id);
	}

	@Override
	public int Community_update(CommunityVO vo) {
		return dao.Community_update(vo);
	}

	@Override
	public int Community_delete(int id) {
		return dao.Community_delete(id);
	}

	@Override
	public int Community_comment_insert(CommunityCommentVO vo) {
		return dao.Community_comment_insert(vo);
	}

	@Override
	public int Community_comment_update(CommunityCommentVO vo) {
		return dao.Community_comment_update(vo);
	}

	@Override
	public int Community_comment_delete(int id) {
		return dao.Community_comment_delete(id);
	}

	@Override
	public List<CommunityCommentVO> Community_comment_list(int id) {
		return dao.Community_comment_list(id);
	}


	@Override
	public boolean community_co_comment_regist(int comment_id, CommunityCommentVO vo) {
		return dao.community_co_comment_regist(comment_id, vo);
	}


}
