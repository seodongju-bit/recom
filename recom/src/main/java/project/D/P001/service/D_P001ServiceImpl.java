package project.D.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.D.P001.dao.D_P001DAO;
import project.D.P001.vo.D_P001VO;




@Service("reviewitem")
@Transactional(propagation = Propagation.REQUIRED)
public class D_P001ServiceImpl implements D_P001Service {
	@Autowired
	private D_P001DAO D_P001DAO ;
	
	



	@Override
	public List reviewItem2(String p_id) throws DataAccessException {
		List reviewlist2 = null;
		System.out.println("Service실행");
		reviewlist2 = D_P001DAO.reviewItem2(p_id);
		return reviewlist2;
		
	}

	@Override
	public List<Map<String,Object>> reviewItem3(Map<String, Object> searchMaps2) throws DataAccessException {
	List reviewlist3 = null;
	System.out.println("서비스 실행");
    reviewlist3 = D_P001DAO.myReview2(searchMaps2);
		return reviewlist3;
		
	}

 


	@Override
	public void reviewWrite(Map<String, Object> dataMap) {
		D_P001DAO.reviewwrite(dataMap);
		
	}


//	@Override
//	public void reviewwrite(Map<String, Object> dataMap) throws DataAccessException {
//	
//	D_P001DAO.reviewwrite(dataMap);
//	System.out.println("서비스실행");
//	}
	
	@Override
	public void addReview(Map<String, Object> resultMap) throws DataAccessException {
		D_P001DAO.addReview(resultMap);
	}

	
	
	
}
