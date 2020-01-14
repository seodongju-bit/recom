package project.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;




/**
 * Handles requests for the application home page.
 */
/*
@Controller
public class HomeController {
  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(Locale locale, Model model) {
    logger.info("Welcome home! The client locale is {}.", locale);

    Date date = new Date();
    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, 
    DateFormat.LONG, locale);
    String formattedDate = dateFormat.format(date);
    model.addAttribute("serverTime", formattedDate );
    return "home";
  }
}
*/


@Controller
public class homeController {
	
	/*private static final Logger logger = LoggerFactory.getLogger(homeController.class);
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/main2.do", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		return "main2";
	}
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		return "test";
	}*/
	
	    

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/searchCommon.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> searchCommon(@RequestParam(value="p_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		List<Map<String, Object>> list = sqlSession.selectList("common.searchCommon" ,searchMap);
		return list;                
	}
	
	@RequestMapping(value = "/bigDivision.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> searchBigDivision(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		List<Map<String, Object>> list = sqlSession.selectList("common.bigDivision");
		return list;
	}
	
	@RequestMapping(value = "/smallDivision.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> searchSmallDivision(@RequestParam(value="p_code", required=false) String p_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_code", p_code);
		List<Map<String, Object>> list = sqlSession.selectList("common.smallDivision" ,searchMap);
		return list;
	}
	
}
