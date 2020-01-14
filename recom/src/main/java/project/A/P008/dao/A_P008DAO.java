package project.A.P008.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P008.vo.A_P008VO;

public interface A_P008DAO {
	public List<A_P008VO> searchMember(Map<String, Object> searchMap) throws DataAccessException;
	public void insertData(Map<String, String> row) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;
	public List<A_P008VO> conditionMember(Map<String, Object> searchMap) throws DataAccessException;
}