package project.F.P002.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.F.P001.vo.F_P001VO;
import project.F.P002.vo.F_P002VO;
import project.main.paging.MainPagingVO;
import project.search.paging.SearchPagingVO;
import project.search.vo.SearchVO;


@Repository("F_P002DAO") 
public class F_P002DAOImpl implements F_P002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException { //상품검색해서 상세페이지로
		List<F_P002VO> list = sqlSession.selectList("F.P002.searchItem", searchMap);
		List<F_P002VO> list2 =sqlSession.selectList("F.P002.searchEvent", searchMap);
//		System.out.println(list2.get(0).get("NO_NUMBER").getClass());
		if(list2.size()>0) {
			list.get(0).setNo_number(list2.get(0).getNo_number());
			list.get(0).setNo_title(list2.get(0).getNo_title());
		} 
//		System.out.println(">>>>"+list2);
		return list;
	}
	
	@Override
	public List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException { //상품 옵션검색
		List<F_P002VO> list = sqlSession.selectList("F.P002.searchOption", searchMap);
		return list;
	}
	@Override
	public List<String> predictive(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("F.P002.searchKeyword",keyword);
	   System.out.println(list);
	   return list;
	}
	@Override
	public List<F_P002VO> mainList(MainPagingVO mainpagingVO) throws Exception {
		return sqlSession.selectList("F.P002.mainList", mainpagingVO);	
	}
	@Override
	public int countList() throws Exception {
		return sqlSession.selectOne("F.P002.countList");
	}
	
	@Override
	public List<F_P002VO> searchList(SearchVO searchVO) throws Exception {
		return sqlSession.selectList("F.P002.searchWord", searchVO);
	}
	
	public int countSearch(SearchVO searchVO) throws Exception {
		return sqlSession.selectOne("F.P002.countSearch", searchVO);
	}
	public int countProd(SearchVO searchVO) throws Exception {
		return sqlSession.selectOne("F.P002.countProd", searchVO);
	}
	
	@Override
	public void addBasket(Map<String, Object> searchMap) throws DataAccessException { //상품 옵션검색
		sqlSession.insert("F.P002.addBasket", searchMap);
	}

	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> searchMap) {
		return sqlSession.selectList("F.P002.searchReview", searchMap);
	}

	@Override
	public List<Map<String, Object>> searchMonthReview(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("F.P002.searchMonthReview", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchTotalReview(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("F.P002.searchTotalReview", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchReviewInfo(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("F.P002.searchReviewInfo", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchReviewRank(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("F.P002.searchReviewRank", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchProRank(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("F.P002.searchProRank", searchMap);
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		try {
			for (int i = 0; i < list.size(); i++) {
				list2 = sqlSession.selectList("F.P002.matchThumbnail", list.get(i));
				list.get(i).put("SELL_THUMBNAIL", list2.get(0).get("SELL_THUMBNAIL"));
			}
		} catch (Exception e) {
			System.out.println("nullpointer c");
		}
		
		try {
			for (int i = 0; i < list.size(); i++) {
				list2 = sqlSession.selectList("F.P002.proTopReview", list.get(i));

				list.get(i).put("REVIEW_NUMBER1", list2.get(0).get("REVIEW_NUMBER"));
				list.get(i).put("REVIEW_NUMBER2", list2.get(1).get("REVIEW_NUMBER"));
				list.get(i).put("REVIEW_NUMBER3", list2.get(2).get("REVIEW_NUMBER"));

				list.get(i).put("REVIEW_TITLE1", list2.get(0).get("REVIEW_TITLE"));
				list.get(i).put("REVIEW_TITLE2", list2.get(1).get("REVIEW_TITLE"));
				list.get(i).put("REVIEW_TITLE3", list2.get(2).get("REVIEW_TITLE"));

				list.get(i).put("REVIEW_TOTALPOINT1", list2.get(0).get("REVIEW_TOTALPOINT"));
				list.get(i).put("REVIEW_TOTALPOINT2", list2.get(1).get("REVIEW_TOTALPOINT"));
				list.get(i).put("REVIEW_TOTALPOINT3", list2.get(2).get("REVIEW_TOTALPOINT"));
			}
		} catch (Exception e) {
			System.out.println("nullpointer d");
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> searchReviewList(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("F.P002.searchReviewList", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> bestReviewPlus(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("F.P002.bestReviewPlus", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> mainBanner() {
		List<Map<String, Object>> list = sqlSession.selectList("F.P002.mainBanner");
		return list;
	}

}
