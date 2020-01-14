package project.C.P003.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import project.C.P003.dao.C_P003DAO;
import project.C.P003.vo.C_P003VO;
import project.C.P003.vo.PageVO;

@Service("noticeitem")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P003ServiceImpl implements C_P003Service {

	@Autowired
	private C_P003DAO C_P003DAO;

	
	
	@Override
	public List searchnotice() throws DataAccessException {
		List noticelist = null;
		System.out.println("service실행");
		noticelist=C_P003DAO.noticeItem();
		return noticelist;
		
	}   
	

	@Override
	public List searchnotice2() throws DataAccessException {
		List noticelist2 = null;
		System.out.println("service실행");
		noticelist2=C_P003DAO.noticeItem2();
		return noticelist2;
	}




	@Override
	public int countBoard() {
		return C_P003DAO.countBoard();
		
	}

	@Override           
	public List<Map<String, Object>> noticeDetail(Map<String, Object> dataMap) throws DataAccessException {
		// C_P003DAO.updateCNT(dataMaps);

		List noticeList3 = null;
		noticeList3=C_P003DAO.noticeDetail(dataMap); 
		System.out.println("service"+dataMap);
		return noticeList3; 
	}

	@Override           
	public List<Map<String, Object>> noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException {
		// C_P003DAO.updateCNT(dataMaps);

		List noticeList4 = null;
		noticeList4=C_P003DAO.noticeDetail2(dataMap2); 
		System.out.println("service"+dataMap2);
		return noticeList4; 
	}

	@Override           
	public List<Map<String, Object>> questionDetail(Map<String, Object> dataMap3) throws DataAccessException {
		// C_P003DAO.updateCNT(dataMaps);

		List noticeList5 = null;
		noticeList5=C_P003DAO.questionDetail(dataMap3); 
		System.out.println("service"+dataMap3);
		return noticeList5; 
	}
	@Override           
	public List<Map<String, Object>> questionDetail1(Map<String, Object> dataMap4) throws DataAccessException {
		// C_P003DAO.updateCNT(dataMaps);

		List noticeList6 = null;
		noticeList6=C_P003DAO.questionDetail1(dataMap4); 
		System.out.println("service"+dataMap4);
		return noticeList6; 
	}

	@Override
	public List listquestion(PageVO vo1) throws DataAccessException {
		List questionList = null;
		questionList = C_P003DAO.Allquestions(vo1);
		return questionList;  
	}     
           
   
	@Override
	public List listquestion1(PageVO vo1) throws DataAccessException {
		List questionList1 = null;
		questionList1 = C_P003DAO.Allquestions1(vo1);
		return questionList1;  
	}
	
	@Override
	public List selectOrderInfo(String order_number) throws DataAccessException {
		List orderInfo = null;
		orderInfo = C_P003DAO.selectOrderInfo(order_number);
		return orderInfo;
	}
	@Override
	public void questionwrite(Map<String, Object> dataMap5) throws DataAccessException {
		
		C_P003DAO.writes(dataMap5);
	}
	
	
	@Override
	public void questionwrite3(Map<String, Object> dataMap6) throws DataAccessException {
		
		C_P003DAO.writes2(dataMap6);
	}


	@Override
	public void questionwrite5(Map<String, Object> dataMap7) throws DataAccessException {
		
		C_P003DAO.writes3(dataMap7);
	}


	@Override
	public List listquestion2(PageVO vo2) throws DataAccessException {
		List questionList2 = null;
		questionList2 = C_P003DAO.Allquestions2(vo2);
		return questionList2;  
	}
	
	@Override           
	public List<Map<String, Object>> questionDetail2(Map<String, Object> dataMap8) throws DataAccessException {
		

		List noticeList7 = null;
		noticeList7=C_P003DAO.questionDetail2(dataMap8); 
		System.out.println("service"+dataMap8);
		return noticeList7; 
	}


	@Override
	public int countBoard2() {
		return C_P003DAO.countBoard2();
	}


	
	@Override
	public List responseInfo(String qu_number) throws DataAccessException {
		List responseInfo = null;
		responseInfo = C_P003DAO.responseInfo(qu_number);
		return responseInfo;
	}
	@Override
	public void responseInfo2(Map<String, Object> dataMap10) throws DataAccessException {
		
		C_P003DAO.responseInfo2(dataMap10);
	}
	
	@Override
	public List selectQuestion(String mem_id) throws DataAccessException {
		List question = null;
		question = C_P003DAO.selectQuestion(mem_id);
		return question;
	}
	
	@Override
	public void dequestion(Map<String, Object> dataMap11) throws DataAccessException {
		
		C_P003DAO.dewrite(dataMap11);
	}
	

}
