package project.A.P009.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P009.dao.A_P009DAO;
import project.A.P009.vo.A_P009VO;

@Service("A_P009Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P009ServiceImpl implements A_P009Service{
	@Autowired
	private A_P009DAO a_P009DAO;
	
	@Override
	public List<A_P009VO> declarationsList(Map<String, Object> searchMap) throws DataAccessException {
		List<A_P009VO> list = a_P009DAO.declarationsList(searchMap);
		return list;
	}
	
	@Override
	public List<A_P009VO> conditionDeclaration(Map<String, Object> searchMap) throws DataAccessException {
		List<A_P009VO> list = a_P009DAO.conditionDeclaration(searchMap);
		return list;
	}
	
	@Override
	public void saveDeclarations(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length;
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i);
			if("I".equals(str)) {
				a_P009DAO.insertData(row);
			}else if("U".equals(str)) {
				a_P009DAO.updateData(row);
			}else if("D".equals(str)) {
				a_P009DAO.deleteData(row);
			}
		}i++;
	}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int index) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
			}
		}return row;
	}
}
