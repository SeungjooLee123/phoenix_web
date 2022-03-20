package babyinfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//저장소 역할 지정
@Repository
public class BabyInfoDAO {
	@Autowired private SqlSession sql;
	
	public List<BabyInfoVO> baby_info_list() {
		return sql.selectList("babyinfo.mapper.list");
	}

}
