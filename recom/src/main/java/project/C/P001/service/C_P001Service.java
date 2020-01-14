package project.C.P001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import project.B.P002.vo.B_P002VO;
import project.C.P001.vo.C_P001VO;
import project.C.P001.vo.PagingVO;
import project.F.P002.vo.F_P002VO;



public interface C_P001Service {
	 public List listEvent(PagingVO vo) throws DataAccessException;
	 public List<Map<String,Object>> selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException;
	 public void eventWrite(Map<String, Object> dataMap);
	 public int countBoard();
	public List<Map<String, Object>> searchSale(Map<String, Object> searchMap);
	public void addItem(Map<String, Object> eventMap);
	

}
