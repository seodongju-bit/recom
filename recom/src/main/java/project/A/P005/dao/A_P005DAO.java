package project.A.P005.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;



public interface A_P005DAO {
	 public List selectAllBasketList(String mem_id) throws DataAccessException;
	 public int deleteBasket(Map<String, Object> dataMap) throws DataAccessException;
	 public int updateBasket(Map<String, Object> dataMap) throws DataAccessException;
	 
}

