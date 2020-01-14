 package project.F.P002.dao;

import java.util.List;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.F.P002.vo.F_P002VO;
import project.main.paging.MainPagingVO;
import project.search.paging.SearchPagingVO;
import project.search.vo.SearchVO;

public interface F_P002DAO {
	
	//상품 정보 가져오기
	 public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;
	
	//상품 옵션
	List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException;

	
	
	//장바구니 추가
	void addBasket(Map<String, Object> searchMap) throws DataAccessException;


	 
	//메인 상품 목록
	public List<F_P002VO> mainList(MainPagingVO mainpagingVO) throws Exception;
	
	//불러온 게시물 총 갯수
	public int countList() throws Exception;
	
	public int countProd(SearchVO searchVO) throws Exception;
	
	//키워드 자동완성
	public List<String> predictive(String keyword) throws DataAccessException;
	
	//검색결과 + 페이징
	public List<F_P002VO> searchList(SearchVO searchVO) throws Exception;
	
	//검색 결과 갯수 계측
	public int countSearch(SearchVO searchVO) throws Exception;

	public List<Map<String, Object>> searchReview(Map<String, Object> searchMap);

	public List<Map<String, Object>> searchMonthReview(Map<String, Object> searchMap);

	public List<Map<String, Object>> searchTotalReview(Map<String, Object> searchMap);

	public List<Map<String, Object>> searchReviewInfo(Map<String, Object> searchMap);

	public List<Map<String, Object>> searchReviewRank(Map<String, Object> searchMap);

	public List<Map<String, Object>> searchProRank(Map<String, Object> searchMap);

	public List<Map<String, Object>> searchReviewList(Map<String, Object> searchMap);

	public List<Map<String, Object>> bestReviewPlus(Map<String, Object> searchMap);

	public List<Map<String, Object>> mainBanner();
	 
}
