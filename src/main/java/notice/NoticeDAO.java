package notice;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NoticeDAO implements NoticeService {
	@Autowired private SqlSession sql;

	@Override
	public int notice_insert(NoticeVO vo) {
		return sql.insert("notice.mapper.insert", vo);
	}

	@Override
	public int notice_update(NoticeVO vo) {
		return sql.update("notice.mapper.update", vo);
	}

	@Override
	public NoticeVO notice_detail(int id) {
		return sql.selectOne("notice.mapper.detail", id);
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		//전체 게시글 수 조회
		System.out.println("asd"+page.getBeginList());
		System.out.println(page.getEndList());
		
		page.setTotalList(sql.selectOne("notice.mapper.totalList", page));
		
		//페이징 처리된 전체 게시글 조회
		List<NoticeVO> list = sql.selectList("notice.mapper.list", page); 
		for(int i=0 ; i<list.size(); i++) {
			System.out.println(list.get(i).getNo());
		}
		page.setList(list);
		System.out.println("asd"+page.getBeginList());
		System.out.println(page.getEndList());
		return page;
	}

	@Override
	public int notice_delete(int id) {
		return sql.delete("notice.mapper.delete", id);
	}

	@Override
	public int notice_count(int id) {
		return sql.update("notice.mapper.count", id);
	}
}