package community;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAO implements CommunityService {

	@Autowired @Qualifier ("bteam") private SqlSession sql;
	
	@Override
	public int Community_insert(CommunityVO vo) {
		return sql.insert("community.mapper.insert", vo);
	}
	
	@Override
	public CommunityPage Community_list(CommunityPage page) {
		//전체 게시글 수 조회
		int a = sql.selectOne( "community.mapper.totalList" , page);
		page.setTotalList(a);
		//System.out.println("TotalList : " + a);
		/* System.out.println(page.getBeginList() + "/" + page.getEndList()); */
		
		//페이징 처리된 전체 게시글 조회
		List<CommunityVO> list = sql.selectList("community.mapper.list", page); 
		page.setList( list );
		for(int i =0; i<list.size(); i++) {
			//System.out.println("글번호 : " + list.get(i).getId());
		}
		return page;
	}

	@Override
	public CommunityVO Community_detail(int id) {
		return sql.selectOne("community.mapper.detail", id);
	}

	@Override
	public int Community_read(int id) {
		return sql.update("community.mapper.count", id);
	}

	@Override
	public int Community_update(CommunityVO vo) {
		return sql.update("community.mapper.update", vo);
	}

	@Override
	public int Community_delete(int id) {
		return sql.delete("community.mapper.delete", id);
	}

	@Override
	public int Community_comment_insert(CommunityCommentVO vo) {
		return sql.insert("community.mapper.comment_insert", vo);
	}

	@Override
	public int Community_comment_update(CommunityCommentVO vo) {
		return sql.update("community.mapper.comment_update", vo);
	}

	@Override
	public int Community_comment_delete(int id) {
		return sql.delete("community.mapper.comment_delete", id);
	}

	@Override
	public List<CommunityCommentVO> Community_comment_list(int id) {
		return sql.selectList("community.mapper.comment_list",id);
	}

	
}
