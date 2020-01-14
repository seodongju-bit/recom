package project.C.P003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.C.P003.vo.C_P003VO;
import project.C.P003.vo.PageVO;

public interface C_P003Service {

	
	public List searchnotice() throws DataAccessException;
	public List searchnotice2() throws DataAccessException;
	
	public List<Map<String,Object>> noticeDetail(Map<String, Object> dataMap) throws DataAccessException;
	public List<Map<String,Object>> noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException;

	public List listquestion(PageVO vo1) throws DataAccessException;
	public List listquestion1(PageVO vo1) throws DataAccessException;
	
	public List<Map<String,Object>> questionDetail(Map<String, Object> dataMap3) throws DataAccessException;
	public List<Map<String,Object>> questionDetail1(Map<String, Object> dataMap4) throws DataAccessException;
	
	public void questionwrite(Map<String, Object> dataMap5);
	
	public void questionwrite3(Map<String, Object> dataMap6);
	
	public void questionwrite5(Map<String, Object> dataMap7);
	
	public List listquestion2(PageVO vo2) throws DataAccessException;
	public List<Map<String,Object>> questionDetail2(Map<String, Object> dataMap8) throws DataAccessException;
	
	public int countBoard();
	
	public int countBoard2();
	
	public List selectOrderInfo(String mem_id) throws DataAccessException;
	
	public List responseInfo(String qu_number) throws DataAccessException;
	
	public void responseInfo2(Map<String, Object> dataMap10);
	
	
	public List selectQuestion(String mem_id) throws DataAccessException;

	public void dequestion(Map<String, Object> dataMap11);
}
