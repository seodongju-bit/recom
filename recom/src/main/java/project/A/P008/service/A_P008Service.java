package project.A.P008.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P008.vo.A_P008VO;

public interface A_P008Service {
	public List<A_P008VO> searchMember(Map<String, Object> searchMap) throws DataAccessException;
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException;
	public List<A_P008VO> conditionMember(Map<String, Object> searchMap) throws DataAccessException;
}