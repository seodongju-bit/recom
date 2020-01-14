package project.A.P009.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P009.vo.A_P009VO;

public interface A_P009DAO {

	public List<A_P009VO> declarationsList(Map<String, Object> searchMap) throws DataAccessException;
	public void insertData(Map<String, String> row) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;
	public List<A_P009VO> conditionDeclaration(Map<String, Object> searchMap) throws DataAccessException;
}
