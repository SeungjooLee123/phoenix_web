package welfare;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WelfareDAO implements WelfareService {
	@Autowired private SqlSession sql;

	@Override
	public List<WelfareVO> wel_list(String category) {
		return null;
	}

	@Override
	public boolean wel_insert(WelfareVO vo) {
		return false;
	}

	@Override
	public boolean wel_update(WelfareVO vo) {
		return false;
	}

	@Override
	public WelfareVO wel_detail(int id) {
		return null;
	}

	@Override
	public WelfarePage wel_list(WelfarePage page) {
		List<WelfareVO> list = sql.selectList("welfare.mapper.list", page);
		page.setList(list);
		return page;
	}

	@Override
	public void wel_delete(int id) {
		
	}
}