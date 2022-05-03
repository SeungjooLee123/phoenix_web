package share;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import share.ShareCommentVO;
import share.SharePage;
import share.ShareVO;

@Repository
public class ShareDAO implements ShareService {

	@Autowired @Qualifier ("bteam") private SqlSession sql;

	@Override
	public int Share_insert(ShareVO vo) {
		return sql.insert("share.mapper.insert", vo);
	}

	@Override
	public SharePage Share_list(SharePage page) {
		int a = sql.selectOne("share.mapper.totalList", page);
		page.setTotalList(a);
		
		List<ShareCommentVO>list = sql.selectList("share.mapper.list", page);
		page.setList(list);
		return page;
	}

	@Override
	public ShareVO Share_detail(int id) {
		return sql.selectOne("share.mapper.detail", id);
	}

	@Override
	public int Share_read(int id) {
		return sql.update("share.mapper.count", id);
	}

	@Override
	public int Share_update(ShareVO vo) {
		return sql.update("share.mapper.update", vo);
	}

	@Override
	public int Share_delete(int id) {
		return sql.delete("share.mapper.delete", id);
	}

	@Override
	public int Share_comment_insert(ShareCommentVO vo) {

		//System.out.println("제발ㄹㄹㄹ"+vo.getComment_id() +"/"+ vo.getContent());
		return sql.insert("share.mapper.comment_insert", vo);
	}

	@Override
	public int Share_comment_update(ShareCommentVO vo) {
		return sql.update("share.mapper.comment_update", vo);
	}

	@Override
	public int Share_comment_delete(int id) {
		return sql.delete("share.mapper.comment_delete", id);
	}

	@Override
	public List<ShareCommentVO> Share_comment_list(int id) {
		List<ShareCommentVO> list = sql.selectList("share.mapper.comment_list", id);
		return list;
	}

	@Override
	public boolean Share_co_comment_regist(int comment_id, ShareCommentVO vo) {
		sql.update("share.mapper.step_up", comment_id);
		vo.setComment_id(comment_id);
		return sql.insert("share.mapper.co_comment_regist",vo) == 1 ? true : false;
	}

	@Override
	public int co_comment_secret(int comment_id, String secret) {
		ShareCommentVO vo = new ShareCommentVO();
		vo.setComment_id(comment_id);
		vo.setSecret(secret);
		
		
		
		return sql.update("share.mapper.co_comment_secret" ,  vo );
	}

	
}
