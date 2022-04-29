package share;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;
@Component
public class SharePage extends PageVO{

	private List<ShareVO> list;

	
	
	
	public List<ShareVO> getList() {
		return list;
	}

	public void setList(List<ShareVO> list) {
		this.list = list;
	}
	
	
}
