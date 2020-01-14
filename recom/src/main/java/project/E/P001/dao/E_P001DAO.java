package project.E.P001.dao;

import java.util.List;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P004.vo.A_P004VO;
import project.E.P001.vo.E_P001VO;


public interface E_P001DAO {
	 public List<E_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;
	 public void insertNewOrder(List<E_P001VO> orderList) throws DataAccessException;
	 public List selectAllCouponList(String p_id) throws DataAccessException;

}
