package project.C.P003.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

import project.C.P003.vo.C_P003VO;
import project.C.P003.vo.PageVO;


public interface C_P003DAO {

	public List noticeItem() throws DataAccessException;
	
	public List noticeItem2() throws DataAccessException;
	
	public List noticeDetail(Map<String, Object> dataMap) throws DataAccessException;

	public List noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException;
	
	public List Allquestions(PageVO vo1) throws DataAccessException;
	
	public List Allquestions1(PageVO vo1) throws DataAccessException;
	
	public List questionDetail(Map<String, Object> dataMap3) throws DataAccessException;
	
	public List questionDetail1(Map<String, Object> dataMap4) throws DataAccessException;
	
	public void writes(Map<String, Object> dataMap5);
	
	public void writes2(Map<String, Object> dataMap6);
	
	public void writes3(Map<String, Object> dataMap7);
	
	public List Allquestions2(PageVO vo2) throws DataAccessException;
	
	public List questionDetail2(Map<String, Object> dataMap8) throws DataAccessException;
	
	public int countBoard();
	
	public int countBoard2();
	
	public List selectOrderInfo(String mem_id) throws DataAccessException;
	
	public List responseInfo(String qu_number) throws DataAccessException;

	public void responseInfo2(Map<String, Object> dataMap10);
	
	public List selectQuestion(String mem_id) throws DataAccessException;
	
	public void dewrite(Map<String, Object> dataMap11);
	
  
}
