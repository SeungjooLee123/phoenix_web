package community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired private CommunityDAO dao;

	@Override
	public int Community_insert(CommunityVO vo) {
		
		return 0;
	}

	@Override
	public CommunityPage Community_list(CommunityPage page) {
		return dao.Community_list(page);
	}

	@Override
	public CommunityVO Community_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int Community_read(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Community_update(CommunityVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Community_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Community_comment_insert(CommunityCommentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Community_comment_update(CommunityVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Community_comment_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommunityCommentVO> Community_comment_list(int pid) {
		// TODO Auto-generated method stub
		return null;
	}

}
