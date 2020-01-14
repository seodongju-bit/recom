package project.A.P007.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P007.vo.A_P007VO;



public interface A_P007DAO {

	public int make(Map<String, Object> dataMap);

	public List<A_P007VO> listcoupon();

	public void updateData(Map<String, String> row);

	public void deleteData(Map<String, String> row);

}

