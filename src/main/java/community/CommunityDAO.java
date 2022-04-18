package community;

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

	/*
	 * @Override public CommunityPage Community_list(CommunityPage page) { //전체 게시글
	 * 수 조회 int a = sql.selectOne( "community.mapper.totalList" , page);
	 * page.setTotalList( a); System.out.println(a); //페이징 처리된 전체 게시글 조회
	 * //page.setList( sql.selectList("board.mapper.list" , page ) ); return page; }
	 */
	
	@Override
	public CommunityPage Community_list(CommunityPage page) {
		//전체 게시글 수 조회
		int a = sql.selectOne( "community.mapper.islist" , page);
		page.setTotalList( a);
		System.out.println(a);
		//페이징 처리된 전체 게시글 조회
		//page.setList( sql.selectList("board.mapper.list"  , page ) );
		return page;
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