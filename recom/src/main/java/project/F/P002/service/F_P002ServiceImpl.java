package project.F.P002.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

//import com.bookshop01.goods.vo.ImageFileVO;

import project.F.P002.dao.F_P002DAO;
import project.F.P002.vo.F_P002VO;
import project.main.paging.MainPagingVO;
import project.search.paging.SearchPagingVO;
import project.search.vo.SearchVO;


@Service("F_P002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002ServiceImpl implements F_P002Service {
	@Autowired
	private F_P002DAO f_P002DAO;
	
	@Override
	public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002VO> list =  f_P002DAO.selectItem(searchMap);
		return list;
	}
	
	@Override
	public List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002VO> list =  f_P002DAO.searchOption(searchMap);
		return list;
	}
	

	@Override
	public void addBasket(Map<String, Object> searchMap) throws DataAccessException {
		f_P002DAO.addBasket(searchMap);
	}
	
	@Override
	public List<F_P002VO> mainList(MainPagingVO mainpagingVO) throws Exception {
		return f_P002DAO.mainList(mainpagingVO);
	}
	
	@Override
	public int countList() throws Exception {
		return f_P002DAO.countList();
	}
	
	/*public Map F_P002Detail(String sell_number) throws Exception {
		Map F_P002Map=new HashMap();
		F_P002VO F_P002VO = F_P002DAO.selectF_P002Detail(sell_number);
		F_P002Map.put("F_P002VO", F_P002VO);
		List<ImageFileVO> imageList =goodsDAO.selectGoodsDetailImage(sell_number);
		goodsMap.put("imageList", imageList);
		return goodsMap;
	}*/
	@Override
	public List<String> predictive(String keyword) throws Exception {
		List<String> list=f_P002DAO.predictive(keyword);
		return list;
	}
	@Override
	public List<F_P002VO> searchList(SearchVO searchVO) throws Exception{
		return f_P002DAO.searchList(searchVO);
	}
	
	@Override
	public int countSearch(SearchVO searchVO) throws Exception {
		return f_P002DAO.countSearch(searchVO);
	}
	
	@Override
	public int countProd(SearchVO searchVO) throws Exception {
		return f_P002DAO.countProd(searchVO);
	}

	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> searchMap, int command) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		switch(command){
        case 1 : 
        	result = f_P002DAO.searchReview(searchMap);
            break;
        case 2 : 
        	result = f_P002DAO.searchMonthReview(searchMap);
            break; 
        case 3 : 
        	result = f_P002DAO.searchTotalReview(searchMap); 
            break;
		}
		return result;
	}
	
	@Override
	public List<Map<String, Object>> paging(List<Map<String, Object>> list, int page ) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		int size = list.size()-1;
		int one = ((page-1)*10);
		int start = (page/5)*5+1;
		int end = (int)Math.ceil( size/10.0 );
		int num = 10;
		if(start + 5 > end) {
			end = end - start + 1;
		}else {
			end = 5;
		}
		pageInfo.put("start", start);
		pageInfo.put("end", end);
		pageInfo.put("page", page);
		if((size-one)<10) {
			num = size-one+1;
		}
		for(int i=one; i < one+num ;i++){
			result.add(list.get(i));
		}
		result.add(pageInfo);
		return result;
	}

	@Override
	public List<Map<String, Object>> searchReviewInfo(Map<String, Object> searchMap) {
		return f_P002DAO.searchReviewInfo(searchMap);
	}

	@Override
	public List<Map<String, Object>> searchReviewRank(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = f_P002DAO.searchReviewRank(searchMap);
		list = thumbnail(list);
		
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> thumbnail(List<Map<String, Object>> list){
		if(list.size()!=0) {
			for(int i=0; i<list.size(); i++) {
				String thumb = (String)list.get(i).get("REVIEW_CONTENT");
				if(thumb==null) { 
					thumb = "<img src='resources/image/nothing.jpg' >";
					list.get(i).put("REVIEW_THUMNAIL", thumb);
					continue;}
				int startImg = thumb.indexOf("<img");
				
				if(startImg!=-1) {
					thumb = thumb.substring(startImg);
					int endImg = thumb.indexOf(">");
					thumb = thumb.substring(0, endImg+1);
				}else {
					thumb = "<img src='resources/image/nothing.jpg' >";
				}
				list.get(i).put("REVIEW_THUMNAIL", thumb);
			}
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> searchProRank(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = f_P002DAO.searchProRank(searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchReviewList(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = f_P002DAO.searchReviewList(searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> bestReviewPlus(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = f_P002DAO.bestReviewPlus(searchMap);
		list = thumbnail(list);
		return list;
	}

	@Override
	public List<Map<String, Object>> mainBanner() {
		List<Map<String, Object>> list = f_P002DAO.mainBanner();
		return list;
	}
}
