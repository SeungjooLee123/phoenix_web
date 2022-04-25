package welfare;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WelfareDAO implements WelfareService {
	@Autowired private SqlSession sql;

	@Override
	public boolean wel_insert(WelfareVO vo) {
		return sql.insert("welfare.mapper.insert", vo) == 1 ? true : false;
	}

	@Override
	public boolean wel_update(WelfareVO vo) {
		return sql.update("welfare.mapper.update", vo) == 1 ? true : false;
	}

	@Override
	public WelfareVO wel_detail(int id) {
		return sql.selectOne("welfare.mapper.detail", id);
	}

	@Override
	public WelfarePage wel_list(WelfarePage page) {
		int a = sql.selectOne("welfare.mapper.totalList", page);
		page.setTotalList( a );
		
		List<WelfareVO> list = sql.selectList("welfare.mapper.list", page);
		page.setList(list);
		
		return page;
	}

	@Override
	public void wel_delete(int id) {
		 sql.delete("welfare.mapper.delete", id);
	}
	
}