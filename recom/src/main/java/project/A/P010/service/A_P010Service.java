package project.A.P010.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


public interface A_P010Service {

	List<Map<String, Object>> searchProfile(Map<String, Object> searchMap);

	void saveProfile(Map<String, String> map);

	List<Map<String, Object>> searchReview(Map<String, Object> searchMap);


}
