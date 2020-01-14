package project.D.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.D.P001.vo.D_P001VO;

public interface D_P001Service {

	//void reviewwrite(Map<String, Object> dataMap);

	List reviewItem2(String p_id)  throws DataAccessException;

	void reviewWrite(Map<String, Object> dataMap);

	void addReview(Map<String, Object> resultMap) throws DataAccessException;

	public List<Map<String,Object>> reviewItem3(Map<String, Object> searchMaps2)  throws DataAccessException;


}
            