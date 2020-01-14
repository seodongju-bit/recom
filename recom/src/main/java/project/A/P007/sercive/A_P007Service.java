package project.A.P007.sercive;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P004.vo.A_P004VO;
import project.A.P007.vo.A_P007VO;



public interface A_P007Service {
	public void make(Map<String, Object> dataMap) throws DataAccessException;
	public List<A_P007VO> listcoupon();
	public void saveData(Map<String, String[]> dataMap);
}
