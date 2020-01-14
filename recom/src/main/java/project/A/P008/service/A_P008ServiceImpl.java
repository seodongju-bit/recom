package project.A.P008.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P008.dao.A_P008DAO;
import project.A.P008.vo.A_P008VO;
import project.B.P001.vo.B_P001VO;

@Service("A_P008Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P008ServiceImpl implements A_P008Service {
	@Autowired
	private A_P008DAO a_P008DAO;
	
	@Override
	public List<A_P008VO> searchMember(Map<String, Object> searchMap) throws DataAccessException {
		List<A_P008VO> list = a_P008DAO.searchMember(searchMap);
		return list;
	}
	
	@Override
	public List<A_P008VO> conditionMember(Map<String, Object> searchMap) throws DataAccessException {
		List<A_P008VO> list = a_P008DAO.conditionMember(searchMap);
		return list;
	}
	
	@Override
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length;
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i);
			if("I".equals(str)) {
				a_P008DAO.insertData(row);
			}else if("U".equals(str)) {
				a_P008DAO.updateData(row);
			}else if("D".equals(str)) {
				a_P008DAO.deleteData(row);
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