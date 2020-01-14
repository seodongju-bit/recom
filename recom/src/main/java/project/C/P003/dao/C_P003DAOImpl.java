package project.C.P003.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;


import project.C.P003.vo.C_P003VO;
import project.C.P003.vo.PageVO;


@Repository("C_P003DAO")
public class C_P003DAOImpl implements C_P003DAO{
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List noticeItem() throws DataAccessException {
		List noticelist = null;                                                                                                                                                                                                                                         
		System.out.println("dao실행");
		noticelist=sqlSession.selectList("mapper.notice.noticeItem");
		System.out.println(noticelist);
		return noticelist;
		
	}
	
	@Override
	public List noticeItem2() throws DataAccessException {
		List noticelist2 = null;                                                                                                                                                                                                                                         
		System.out.println("dao실행");
		noticelist2=sqlSession.selectList("mapper.notice.noticeItem2");
		System.out.println(noticelist2);
		return noticelist2;
	}


	   

	
	
	@Override
	public int countBoard() {
		return sqlSession.selectOne("mapper.notice.countBoard");
	}
	@Override
	public List noticeDetail(Map<String, Object> dataMap) throws DataAccessException {
		List noticelist3 = null;
		noticelist3 = sqlSession.selectList("mapper.notice.noticeDetail", dataMap);
		System.out.println("dao실행"+noticelist3);
		return noticelist3;
	}

	@Override
	public List noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException {
		List noticelist4 = null;
		noticelist4 = sqlSession.selectList("mapper.notice.noticeDetail2", dataMap2);
		System.out.println("dao실행"+noticelist4);
		return noticelist4;
	}
	
	@Override
	public List questionDetail(Map<String, Object> dataMap3) throws DataAccessException {
		List noticelist5 = null;
		noticelist5 = sqlSession.selectList("mapper.notice.questionDetail", dataMap3);
		System.out.println("dao실행"+noticelist5);
		return noticelist5;
	}
	
	@Override
	public List questionDetail1(Map<String, Object> dataMap4) throws DataAccessException {
		List noticelist6 = null;
		noticelist6 = sqlSession.selectList("mapper.notice.questionDetail1", dataMap4);
		System.out.println("dao실행"+noticelist6);
		return noticelist6;
	}

	@Override
	public List Allquestions(PageVO vo1) throws DataAccessException {
		List<C_P003VO> questionList = null;
		questionList = sqlSession.selectList("mapper.notice.Allquestions", vo1);
		System.out.println("dao실행"+questionList);
		return questionList;
	}
                         
	@Override
	public List Allquestions1(PageVO vo1) throws DataAccessException {
		List<C_P003VO> questionList1 = null;
		questionList1 = sqlSession.selectList("mapper.notice.Allquestions1", vo1);
		System.out.println("dao실행"+questionList1);
		return questionList1;
	}
	
	
	@Override
	public List selectOrderInfo(String order_number) throws DataAccessException {
		List<C_P003VO> orderInfo = null;
		orderInfo = sqlSession.selectList("mapper.notice.selectOrderInfo", order_number);
		return orderInfo;
	}
	@Override
	public void writes(Map<String, Object> dataMap5) throws DataAccessException {
	    System.out.println(dataMap5);
		sqlSession.insert("mapper.notice.insertquestion", dataMap5);
	}
	
	@Override
	public void writes2(Map<String, Object> dataMap6) throws DataAccessException {
	    System.out.println(dataMap6);
		sqlSession.insert("mapper.notice.insertquestion2", dataMap6);
	}
	
	@Override
	public void writes3(Map<String, Object> dataMap7) throws DataAccessException {
	    System.out.println(dataMap7);
		sqlSession.insert("mapper.notice.insertquestion3", dataMap7);
	}

	@Override
	public List Allquestions2(PageVO vo2) throws DataAccessException {
		List<C_P003VO> questionList2 = null;
		questionList2 = sqlSession.selectList("mapper.notice.Allquestions2", vo2);
		System.out.println("dao실행"+questionList2);
		return questionList2;
	}
	
	@Override
	public List questionDetail2(Map<String, Object> dataMap8) throws DataAccessException {
		List noticelist7 = null;
		noticelist7 = sqlSession.selectList("mapper.notice.questionDetail2", dataMap8);
		System.out.println("dao실행"+noticelist7);
		return noticelist7;
	}

	@Override
	public int countBoard2() {
		return sqlSession.selectOne("mapper.notice.countBoard2");
	}
		
	@Override
	public List responseInfo(String qu_number) throws DataAccessException {
		List<C_P003VO> responseInfo= null;
		responseInfo = sqlSession.selectList("mapper.notice.responseInfo", qu_number);
		return responseInfo;
	}
	@Override
	public void  responseInfo2(Map<String, Object> dataMap10) throws DataAccessException {
	    System.out.println(dataMap10);
		sqlSession.insert("mapper.notice.responseInfo2", dataMap10);
	}

	
	@Override
	public List selectQuestion(String mem_id) throws DataAccessException {
		List<C_P003VO> question = null;
		question = sqlSession.selectList("mapper.notice.selectQuestion", mem_id);
		return question;
	}
	
	@Override
	public void dewrite(Map<String, Object> dataMap11) throws DataAccessException {
	    System.out.println(dataMap11);
		sqlSession.insert("mapper.notice.insertde", dataMap11);
	}
	
	
	
	
	}


