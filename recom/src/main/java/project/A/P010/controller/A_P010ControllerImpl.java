package project.A.P010.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.A.P010.service.A_P010Service;
import project.F.P002.service.F_P002Service;
import project.A.P010.service.FileUploadService3;

@Controller("A_P010Controller")
public class A_P010ControllerImpl implements A_P010Controller{
	private static final Logger logger = LoggerFactory.getLogger(A_P010ControllerImpl.class);
	
	@Autowired
	A_P010Service a_P010Service;
	@Autowired
	F_P002Service f_P002Service;
	
	
	@Override
	@RequestMapping(value="/profile.do", method = RequestMethod.GET)
	public ModelAndView profile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("mem_id", mem_id);
		List<Map<String, Object>> resultList = a_P010Service.searchProfile(searchMap);
		
		ModelAndView mav = new ModelAndView("profile");
//		if(resultList.get(0).get("profile")==null) {
//			
//			
//		}
		mav.addObject("profile", resultList.get(0));
		return mav;
	}
	 
	@RequestMapping(value="/reviewProfile.do", method = RequestMethod.GET)
	public ModelAndView reviewProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName ="reviewProfile";
		String mem_id = request.getParameter("mem_id");
		HttpSession session = request.getSession();
		if(mem_id.equals("me")) {
			mem_id = (String)session.getAttribute("mem_id");
			viewName = "reviewProfile2";
		}
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("mem_id", mem_id);
		List<Map<String, Object>> profile = a_P010Service.searchProfile(searchMap);
		List<Map<String, Object>> reviewList = a_P010Service.searchReview(searchMap);
		profile.get(0).put("reviewCount", reviewList.size());
		reviewList = f_P002Service.thumbnail(reviewList);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("profile", profile.get(0));
		mav.addObject("reviewList", reviewList);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/profileUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> profileUpdate(@RequestParam Map<String, String> map ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		map.put("mem_id", mem_id);
		a_P010Service.saveProfile(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		return resultMap;
	}
	
	
	@Autowired
	FileUploadService3 fileUploadService;
	   @Override
	   @RequestMapping(value = "/profileUpload.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map<String, Object> profileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   Map<String, Object> resultMap = new HashMap<String, Object>();
		   try {
			   String url = fileUploadService.restore(file);
			   System.out.println(url);
			   resultMap.put("path", url);
		   }catch(Exception e) {
			   System.out.println("이미지 업로드 오류");
		   }   
		   return resultMap;
	   }
	
}
