package project.E.P001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.A.P004.vo.A_P004VO;
import project.E.P001.vo.E_P001VO;

public interface E_P001Service {
	 public List<E_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;
	 public void addNewOrder(List<E_P001VO> orderList) throws Exception;
	 public List listCoupon(String p_id) throws DataAccessException;


}