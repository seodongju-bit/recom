package project.A.P010.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public interface A_P010Controller {

	ModelAndView profile(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map<String, Object> profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	Map<String, Object> profileUpdate(Map<String, String> map, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
}
