package customer;

import java.util.List;


public interface CustomerService {
	//삽입 저장
	void customer_insert(CustomerVO vo);
	
	//목록 조회
	List<CustomerVO> customer_list(String category);
	
	//상세 조회
	CustomerVO customer_detail(int id);
	
	//변경 저장
	void customer_update(CustomerVO vo);
	
	//고객 정보 삭제
	void customer_delete(int id);
}
