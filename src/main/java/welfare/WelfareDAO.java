package welfare;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

@Repository
public class WelfareDAO implements WelfareService {
	@Autowired private SqlSession sql;
	Gson gson = new Gson();

	@Override
	public boolean wel_insert(WelfareVO vo) {
		return sql.insert("welfare.mapper.insert", vo) == 1 ? true : false;
	}

	@Override
	public boolean wel_update(WelfareVO vo) {
		return false;
	}

	@Override
	public WelfareVO wel_detail(int id) {
		return sql.selectOne("welfare.mapper.detail", id);
	}

	@Override
	public WelfarePage wel_list(HashMap<String, String> map) {
		WelfarePage page = gson.fromJson(map.get("page"), WelfarePage.class);
		int a = sql.selectOne("welfare.mapper.totalList", map);
		page.setTotalList(a);
		
		HashMap<String, String> temp = new HashMap<String, String>();
		map.put("category", map.get("category"));
		map.put("beginList", page.getBeginList()+"");
		map.put("endList", page.getEndList()+"");
		
		List<WelfareVO> list = sql.selectList("welfare.mapper.list", map);
		page.setList(list);
		
		return page;
	}

	@Override
	public void wel_delete(int id) {
		sql.delete("welfare.mapper.delete", id);
	}
}