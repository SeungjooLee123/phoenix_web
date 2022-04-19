package notice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDAO dao;
	

	@Override
	public int notice_update(NoticeVO vo) {
		return dao.notice_update(vo);
	}

	@Override
	public NoticeVO notice_detail(int id) {
		return dao.notice_detail(id);
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		return dao.notice_list(page);
	}

	@Override
	public int notice_delete(int id) {
		return dao.notice_delete(id);
	}

	@Override
	public int notice_count(int id) {
		return dao.notice_count(id);
	}

	@Override
	public int notice_insert(NoticeVO vo) {
		return dao.notice_insert(vo);
	}
}