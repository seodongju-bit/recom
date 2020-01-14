package project.C.P001.service;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.B.P002.vo.B_P002VO;
import project.C.P001.dao.C_P001DAO;
import project.C.P001.vo.C_P001VO;
import project.C.P001.vo.PagingVO;
import project.F.P002.vo.F_P002VO;


@Service("eventService")
public class C_P001ServiceImpl implements C_P001Service {
	@Autowired
	private C_P001DAO eventDAO;

	@Override
	public List listEvent(PagingVO vo) throws DataAccessException {
		List eventList = null;
		eventList = eventDAO.selectAllEventList(vo);
		return eventList;
	}		
	
	public List selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException {
		
		eventDAO.updateCNT(dataMap);
		
//		eventDAO.updateViewCnt(param); //게시글 조횟수 늘리기가 선행되어야 한다. 
		List dataList = null;
		dataList=eventDAO.selectBoardDetail(dataMap); 
		return dataList; 
	}
	
	
	@Override
	public void eventWrite(Map<String, Object> dataMap) throws DataAccessException {
		
		eventDAO.write(dataMap);
	}

	@Override
	public int countBoard() {
		return eventDAO.countBoard();
		
	}

	@Override
	public List<Map<String, Object>> searchSale(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return eventDAO.searchSale(searchMap);
	}

	@Override
	public void addItem(Map<String, Object> eventMap) {
		eventDAO.addItem(eventMap);
		
	}

	
			
	
}
