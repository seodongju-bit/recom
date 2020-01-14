package project.A.P009.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P009.vo.A_P009VO;

public interface A_P009Service {
	
	public List<A_P009VO> declarationsList(Map<String, Object> searchMap) throws DataAccessException;
	public void saveDeclarations(Map<String, String[]> dataMap) throws DataAccessException;
	public List<A_P009VO> conditionDeclaration(Map<String, Object> searchMap) throws DataAccessException;
}
