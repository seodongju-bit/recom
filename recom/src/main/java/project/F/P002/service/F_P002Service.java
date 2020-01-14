package project.F.P002.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.F.P002.vo.F_P002VO;
import project.main.paging.MainPagingVO;
import project.search.vo.SearchVO;
import project.search.paging.SearchPagingVO;



public interface F_P002Service {
	 public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;
	List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException;


	void addBasket(Map<String, Object> searchMap) throws DataAccessException;
	 

	public List<F_P002VO> mainList(MainPagingVO mainpagingVO) throws Exception;
	public int countList() throws Exception;
	public List<String> predictive(String keyword) throws Exception;
	public List<F_P002VO> searchList(SearchVO searchVO) throws Exception;
	public int countSearch(SearchVO searchVO) throws Exception;
	public int countProd(SearchVO searchVO) throws Exception;
	public List<Map<String, Object>> searchReview(Map<String, Object> searchMap, int command);
	List<Map<String, Object>> paging(List<Map<String, Object>> list, int page);
	public List<Map<String, Object>> searchReviewInfo(Map<String, Object> searchMap);
	public List<Map<String, Object>> searchReviewRank(Map<String, Object> searchMap);
	public List<Map<String, Object>> searchProRank(Map<String, Object> searchMap);
	public List<Map<String, Object>> searchReviewList(Map<String, Object> searchMap);
	List<Map<String, Object>> thumbnail(List<Map<String, Object>> list);
	public List<Map<String, Object>> bestReviewPlus(Map<String, Object> searchMap);
	public List<Map<String, Object>> mainBanner();


}