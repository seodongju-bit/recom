package project.B.P001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.B.P001.vo.B_P001VO;




public interface B_P001Service {
	
	 public List<B_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;

	 void addProduct(B_P001VO b_P001VO) throws DataAccessException;

	 public List<B_P001VO> conditionSearch(Map<String, Object> searchMap) throws DataAccessException;

}