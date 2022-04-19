package welfare;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class WelfarePage extends PageVO {
	private List<WelfareVO> list;

	public List<WelfareVO> getList() {
		return list;
	}

	public void setList(List<WelfareVO> list) {
		this.list = list;
	}
}