package project.B.P002.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.B.P002.service.B_P002Service;
import project.B.P002.service.FileUploadService;
import project.B.P002.vo.B_P002VO;
import project.main.paging.MainPageMaker;
import project.main.paging.MainPagingVO;
import project.search.paging.SearchPageMaker;
 


@Controller("B_P002Controller")
public class B_P002ControllerImpl   implements B_P002Controller {
		
	@Autowired
	B_P002Service b_P002Service;
	@Autowired
	B_P002VO b_P002VO;
	

	   @Override
	   @RequestMapping(value = "/itemManager/addSell.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView addSell(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "addSell";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
	   }
	   
	   @Override
	   @RequestMapping(value = "/itemManager/inputSell.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView inputSell(@ModelAttribute("B_P002VO") B_P002VO b_P002VO,HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "addSell";
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");

			b_P002VO.setMem_id(mem_id);
			b_P002Service.addSell(b_P002VO);
			
			try {
				if(request.getParameter("option_yn").equals("y")) {
					String[] coption = request.getParameterValues("ocolor");
					String[] soption = request.getParameterValues("osize");
					String[] oquantity = request.getParameterValues("quantity");
					System.out.println(coption.length+":"+oquantity.length);
					Map<String, Object> optionMap = new HashMap<String, Object>();
					for(int i=0 ;i<oquantity.length; i++) {
						if(coption[i]!="") {
							optionMap.put("option_color", coption[i]);
						}else {
							optionMap.put("option_color", "-1");
						}
						if(soption[i]!="") {
							optionMap.put("option_size", soption[i]);
						}else {
							optionMap.put("option_size", "-1");
						}
						optionMap.put("option_quantity", oquantity[i]);
						//optionMap.put("sell_num", mem_id);
						b_P002Service.addOption(optionMap);
					}
				}
			}catch(Exception e) {
				System.out.println("옵션추가오류");
			}
			
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("error_yn" , "n");
			return mav;
	   }

	   @Override
	   @RequestMapping(value = "/itemManager/proNumSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView proNumSearch(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "proNumSearch";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
	   }
	
	   
	   @Override
	   @RequestMapping(value = "/itemManager/proNumSearchAction.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map<String, Object> proNumSearchAction(HttpServletRequest request, HttpServletResponse response) throws Exception  {
	      request.setCharacterEncoding("utf-8");
	      String p_id = (String)request.getParameter("p_id");
	      
	      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
	      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

	      if(p_id=="" || p_id==null) {
	    	  return resultMap;
	      }
	      searchMap.put("p_id", p_id);
	      List<B_P002VO> data = b_P002Service.selectItem(searchMap);
	      resultMap.put("Data", data);
	      
	      return resultMap;
	   }
	   
		// 다중파일업로드
	   
	   @Autowired
	   FileUploadService fileUploadService;

	   @RequestMapping(value = "/itemManager/upload.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map<String, Object> imgUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
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
	   @RequestMapping(value="/orderRequestList.do", method = {RequestMethod.GET, RequestMethod.POST})
	   @ResponseBody
	   public ModelAndView orderRequestList(HttpServletRequest request, HttpServletResponse response, MainPagingVO mainPagingVO) throws Exception {
		   String viewName = getViewName(request);
		   viewName = "orderRequestList";
		   HttpSession session = request.getSession();
		   String p_id = (String)session.getAttribute("mem_id");
		   if(p_id == null) {
			   ModelAndView mav = new ModelAndView();
			   mav.setViewName("redirect:main.do");
			   return mav;
		   }
		  mainPagingVO.setP_id(p_id);
		   
		  ModelAndView mav = new ModelAndView(viewName);
		  
		  MainPageMaker mainPageMaker = new MainPageMaker();
		  mainPageMaker.setMainPagingVO(mainPagingVO);
		  mainPageMaker.setTotalCount(b_P002Service.countOrdererList(p_id));
		  
		   
		  List orderRequestList = b_P002Service.orderRequestList(mainPagingVO);
		  mav.addObject("orderRequestList", orderRequestList);
		  mav.addObject("mainPageMaker", mainPageMaker);
		  return mav;
	   }
	   
	   @RequestMapping(value="/ordererInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	   @ResponseBody
	   public ModelAndView ordererInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   String viewName = getViewName(request);
		   viewName = "ordererInfo";
		   
		   String pro_name = request.getParameter("pro_name");
		   System.out.println("pro_name:" + pro_name);
		   String od_quantity = request.getParameter("od_quantity");
		   System.out.println("od_quantity:" + od_quantity);
		   String order_number = request.getParameter("order_number");
		   System.out.println("order_number:" + order_number);
		   
		   Map<String, Object> selectOrderInfo = new HashMap<String, Object>();
		   
		   selectOrderInfo.put("pro_name", pro_name);
		   selectOrderInfo.put("od_quantity", od_quantity);
		   selectOrderInfo.put("order_number", order_number);
		   
		   
		   List<Map<String,Object>> ordererInfoList = b_P002Service.ordererInfoList(selectOrderInfo);
		   

		   ModelAndView mav = new ModelAndView(viewName);
		   mav.addObject("ordererInfo", ordererInfoList);
		   return mav;
	   }
	   
	   @RequestMapping(value="/changeState.do", method = {RequestMethod.GET, RequestMethod.POST})
	   @ResponseBody
	   public Map<String, Object> changeState(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		   
		  String order_number = request.getParameter("order_number");
		  System.out.println("order_number: " + order_number);
		  String od_size = request.getParameter("od_size");
		  System.out.println("od_size: " + od_size);
		  String od_color = request.getParameter("od_color");
		  System.out.println("od_color: " + od_color);
		  String pro_name = request.getParameter("pro_name");
		  System.out.println("pro_name: " + pro_name);
		  String od_state = request.getParameter("od_state");
		  System.out.println("od_state:" + od_state);
		  
		  Map<String, Object> dataMap = new HashMap<String, Object>();
		  
		  dataMap.put("order_number", order_number);
		  dataMap.put("od_size", od_size);
		  dataMap.put("od_color", od_color);
		  dataMap.put("pro_name", pro_name);
		  dataMap.put("od_state", od_state);
		  
		  List<Map<String, Object>> list = b_P002Service.changeState(dataMap);		  
		  
		  return dataMap;
		}
	
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}



}

