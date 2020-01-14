package project.A.P005.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P005.vo.A_P005VO;



public interface A_P005Service {
	 public List listBasket(String mem_id) throws DataAccessException;
	 public void removeBasket(Map<String, Object> dataMap) throws DataAccessException;
	 public void updateBasket(Map<String, Object> dataMap) throws Exception;
}
