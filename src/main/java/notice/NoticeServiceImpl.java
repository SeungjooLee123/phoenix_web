package notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDAO dao;
	
	@Override
	public List<NoticeVO> notice_list() {
		return dao.notice_list();
	}

	@Override
	public boolean notice_insert(NoticeVO vo) {
		return dao.notice_insert(vo);
	}

	@Override
	public boolean notice_update(NoticeVO vo) {
		return dao.notice_update(vo);
	}

	@Override
	public boolean notice_detail(int id) {
		return dao.notice_delete(id);
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		return dao.notice_list(page);
	}

	@Override
	public boolean notice_delete(int id) {
		return dao.notice_delete(id);
	}

	@Override
	public void notice_count(int id) {
		dao.notice_count(id);
	}
}