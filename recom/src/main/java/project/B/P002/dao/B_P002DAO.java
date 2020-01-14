package project.B.P002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.B.P002.vo.B_P002VO;
import project.main.paging.MainPagingVO;


public interface B_P002DAO {

	void addSell(B_P002VO b_P002VO) throws DataAccessException;

	List<B_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;

	void addOption(Map<String, Object> optionMap);

	public List orderRequestList(MainPagingVO mainPagingVO) throws DataAccessException;
	public int countOrdererList(String p_id) throws Exception;

	public List<Map<String,Object>> ordererInfoList(Map<String, Object> ordererInfoList) throws DataAccessException;
	 
	List<Map<String,Object>> changeState(Map<String, Object> dataMap) throws DataAccessException;
	 
	 
}
