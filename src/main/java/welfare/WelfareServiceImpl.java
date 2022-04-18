package welfare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WelfareServiceImpl implements WelfareService {
	@Autowired private WelfareDAO dao;

	@Override
	public List<WelfareVO> wel_list(String category) {
		return dao.wel_list(category);
	}

	@Override
	public boolean wel_insert(WelfareVO vo) {
		return dao.wel_insert(vo);
	}

	@Override
	public boolean wel_update(WelfareVO vo) {
		return dao.wel_update(vo);
	}

	@Override
	public WelfareVO wel_detail(int id) {
		return dao.wel_detail(id);
	}

	@Override
	public WelfarePage wel_list(WelfarePage page) {
		return dao.wel_list(page);
	}

	@Override
	public void wel_delete(int id) {
		dao.wel_delete(id);
	}
}