package notice;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements NoticeService {
	@Autowired private SqlSession sql;

	@Override
	public List<NoticeVO> notice_list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean notice_insert(NoticeVO vo) {
		return false;
	}

	@Override
	public boolean notice_update(NoticeVO vo) {
		return false;
	}

	@Override
	public boolean notice_detail(int id) {
		return false;
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		return null;
	}

	@Override
	public boolean notice_delete(int id) {
		return false;
	}

	@Override
	public void notice_count(int id) {

	}


}