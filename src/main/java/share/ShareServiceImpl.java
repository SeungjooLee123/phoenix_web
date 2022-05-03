package share;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ShareServiceImpl implements ShareService {
	
	@Autowired private ShareDAO dao;

	@Override
	public int Share_insert(ShareVO vo) {
		return dao.Share_insert(vo);
	}

	@Override
	public SharePage Share_list(SharePage page) {
		return dao.Share_list(page);
	}

	@Override
	public ShareVO Share_detail(int id) {
		return dao.Share_detail(id);
	}

	@Override
	public int Share_read(int id) {
		return dao.Share_read(id);
	}

	@Override
	public int Share_update(ShareVO vo) {
		return dao.Share_update(vo);
	}

	@Override
	public int Share_delete(int id) {
		return dao.Share_delete(id);
	}

	@Override
	public int Share_comment_insert(ShareCommentVO vo) {
		return dao.Share_comment_insert(vo);
	}

	@Override
	public int Share_comment_update(ShareCommentVO vo) {
		return dao.Share_comment_update(vo);
	}

	@Override
	public int Share_comment_delete(int id) {
		return dao.Share_comment_delete(id);
	}

	@Override
	public List<ShareCommentVO> Share_comment_list(int pid) {
		return dao.Share_comment_list(pid);
	}

	@Override
	public boolean Share_co_comment_regist(int comment_id, ShareCommentVO vo) {
		return dao.Share_co_comment_regist(comment_id, vo);
	}

	@Override
	public int co_comment_secret(int comment_id, String secret) {
		return dao.co_comment_secret(comment_id, secret);
	}


}
