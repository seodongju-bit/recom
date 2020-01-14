package project.B.P002.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.B.P001.vo.B_P001VO;
import project.B.P002.vo.B_P002VO;
import project.main.paging.MainPagingVO;




public interface B_P002Service {
	
	

	 void saveImg(HttpServletRequest request) throws DataAccessException;

	void addSell(B_P002VO b_P002VO);

	List<B_P002VO> selectItem(Map<String, Object> searchMap);

	void addOption(Map<String, Object> optionMap);

	public List orderRequestList(MainPagingVO mainPagingVO) throws DataAccessException;
	public int countOrdererList(String p_id) throws Exception;

	public List<Map<String,Object>> ordererInfoList(Map<String, Object> ordererInfoList) throws DataAccessException;

	public List<Map<String,Object>> changeState(Map<String, Object> dataMap) throws DataAccessException;

}