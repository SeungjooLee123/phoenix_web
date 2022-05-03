package sns;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SnsDAO {
	@Autowired private SqlSession sql;
	
	//성장일기 리스트
	public List<GrowthVO> groList(String baby_id) {
		return sql.selectList("sns.mapper.list", baby_id);
	}
	
	//성장일기 추가
	public boolean snsInsert(GrowthVO Imgvo) {
		sql.insert("sns.mapper.insert", Imgvo);
		String filename = Imgvo.getImgList().get(0);
		int test = sql.selectOne("sns.mapper.check", filename);
		return test > 0 ? true : false;
	}
	
	//수정할 성장일기 선택
	//해당글 이미지들 가져오기
	public List<GrowthVO> select_imgs(int no) {
		return sql.selectList("sns.mapper.select_imgs", no);
	}
	
	//이미지 수정 -> 이미지 지움(db)
	public boolean del_img(int no) {
		return sql.delete("sns.mapper.del_img", no) > 0 ? true : false;
	}
	//글 조회
		public GrowthVO select_text(int no) {
			return sql.selectOne("sns.mapper.select_text", no);
		}
		//글 업데이트
		public GrowthVO text_update(GrowthVO vo) {
			int result = 0;
			result = sql.update("sns.mapper.text_update", vo);
			System.out.println(result > 0 ? true : false);
			int no = vo.getGro_no();
			return sql.selectOne("sns.mapper.choice", no);			
		}
		//다시 담기
		public List<GrowthVO> insertall(GrowthVO vo) {
			int result = 0;
			result = sql.insert("sns.mapper.insertall", vo);
			System.out.println(result > 0 ? true : false);
			int no = vo.getGro_no();
			return sql.selectList("sns.mapper.choice_all", no);
		}
	
	
	
	//성장일기 삭제
	//해당 게시글 사진 목록 조회
	public List<GrowthVO>  gro_img(int no) {
		return sql.selectList("sns.mapper.gro_img", no);
	}
	//해당 게시글 삭제
	public boolean groDelete(int no) {
		return sql.delete("sns.mapper.delete", no) > 0 ? true : false;
	}
	

	
	
	
}
