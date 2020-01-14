package project.D.P001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.D.P001.vo.D_P001VO;


public interface D_P001DAO {

	void reviewwrite(Map<String, Object> dataMap);
	public List reviewItem2(String p_id) throws DataAccessException;
	void addReview(Map<String, Object> resultMap) throws DataAccessException;
	
	public List<Map<String,Object>> myReview2(Map<String, Object> searchMaps2); 
	

}
