package project.A.P007.sercive;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P007.dao.A_P007DAO;
import project.A.P007.vo.A_P007VO;


@Service("makecouponService")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P007ServiceImpl implements A_P007Service {
	@Autowired
	private A_P007DAO makecouponDAO;

	@Override
	public void make(Map<String, Object> dataMap) throws DataAccessException {
		makecouponDAO.make(dataMap);
		
	}

	@Override
	public List<A_P007VO> listcoupon() {
		List<A_P007VO> list =  makecouponDAO.listcoupon(); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // 현재 Index의 Row Map
			 if("U".equals(str)) { // 수정
				makecouponDAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				makecouponDAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int index) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
			}
		}		
		return row;
	}	

}
