package project.A.P002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.A.P001.vo.A_P001VO;

public interface A_P002Service {
	public void addMember(A_P001VO A_P001VO) throws Exception;
	public String overlappedid(String id) throws Exception;
	public String overlappednick(String nick) throws Exception;
	public String overlappedemail(Map emailMap) throws Exception;
	public void verifyMember(A_P001VO A_P001VO) throws Exception;
}