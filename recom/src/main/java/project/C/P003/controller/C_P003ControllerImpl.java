package project.C.P003.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import project.C.P003.service.C_P003Service;
import project.C.P003.vo.C_P003VO;
import project.C.P003.vo.PageVO;


@Controller("C_P003Controller")
public class C_P003ControllerImpl implements C_P003Controller {
	@Autowired
	private C_P003Service C_P003Service;
	@Autowired
	C_P003VO C_P003VO;
	
	
	@Override
	@RequestMapping(value="/notice.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice(PageVO vo, 
			@RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
			
	    HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "notice";      
		
		int total=C_P003Service.countBoard();
		System.out.println(total);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}

		
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List noticelist = C_P003Service.searchnotice();
		
		System.out.println(noticelist);
	
		
		List noticelist2 = C_P003Service.searchnotice2(); 
		System.out.println(noticelist2);
		
		ModelAndView mavw = new ModelAndView(viewName);
		mavw.addObject("List",noticelist);
		mavw.addObject("List2",noticelist2);

		return mavw;
		
		
		
	}
	
	

	
	

	@Override
	@RequestMapping(value="/noticeDetail.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView noticeDetail(@RequestParam("de_number") String de_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "noticeDetail";
		Map<String, Object> dataMap = new HashMap();
		Map<String, Object> resultMap = new HashMap();
		dataMap.put("de_number", de_number);
		List<Map<String,Object>> noticeList3 = C_P003Service.noticeDetail(dataMap);
		resultMap = noticeList3.get(0);
		System.out.println("controller실행"+noticeList3);
		ModelAndView mavw2 = new ModelAndView(viewName);
		mavw2.addObject("resultMap", resultMap);                  
		return mavw2;
	}
            
	
	
	@Override
	@RequestMapping(value="/noticeDetail2.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView noticeDetail2(@RequestParam("qu_number") String qu_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "noticeDetail2";
		Map<String, Object> dataMap2 = new HashMap();
		Map<String, Object> resultMap2 = new HashMap();
		dataMap2.put("qu_number", qu_number);
		List<Map<String,Object>> noticeList4 = C_P003Service.noticeDetail2(dataMap2);
		resultMap2 = noticeList4.get(0);
		System.out.println("controller실행"+noticeList4);
		ModelAndView mavw3 = new ModelAndView(viewName);
		mavw3.addObject("resultMap2", resultMap2);                  
		return mavw3;             
	}
	
	
	
	@Override
	@RequestMapping(value="/questionDetail.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionDetail(@RequestParam("de_number") String de_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "questionDetail";
		Map<String, Object> dataMap3 = new HashMap();
		Map<String, Object> resultMap3 = new HashMap();
		dataMap3.put("de_number", de_number);
		List<Map<String,Object>> noticeList5 = C_P003Service.questionDetail(dataMap3);
		resultMap3 = noticeList5.get(0);
		System.out.println("controller실행"+noticeList5);
		ModelAndView mavw5 = new ModelAndView(viewName);
		mavw5.addObject("resultMap3", resultMap3);                  
		return mavw5;
	}
	
	
	@Override
	@RequestMapping(value="/questionDetail1.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionDetail1(@RequestParam("qu_number") String qu_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "questionDetail1";
		Map<String, Object> dataMap4 = new HashMap();
		Map<String, Object> resultMap4 = new HashMap();
		dataMap4.put("qu_number", qu_number);
		List<Map<String,Object>> noticeList6 = C_P003Service.questionDetail1(dataMap4);
		resultMap4 = noticeList6.get(0);
		System.out.println("controller실행"+noticeList6);
		ModelAndView mavw5 = new ModelAndView(viewName);
		mavw5.addObject("resultMap4", resultMap4);                  
		return mavw5;             
	}

	@Override
	@RequestMapping(value="/questions.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questions(PageVO vo1 
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "questions";
		int totals = C_P003Service.countBoard();
		System.out.println("컨트롤러"+totals);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}

		
			vo1 = new PageVO(totals, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
		
		List questionList = C_P003Service.listquestion(vo1);
		ModelAndView mavw4 = new ModelAndView(viewName);
		mavw4.addObject("page", vo1);    
		mavw4.addObject("questionList", questionList);
		return mavw4;
	}


	
	@Override
	@RequestMapping(value="/questions1.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questions1(PageVO vo1 
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "questions1";
		int totals1 = C_P003Service.countBoard();
		System.out.println("컨트롤러"+totals1);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";           
		}

		
			vo1 = new PageVO(totals1, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
		
		List questionList1 = C_P003Service.listquestion1(vo1);
		ModelAndView mavw4 = new ModelAndView(viewName);
		mavw4.addObject("page", vo1);    
		mavw4.addObject("questionList1", questionList1);
		return mavw4;
	}


	@Override
	@RequestMapping(value="/questionwrite.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionwrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "questionwrite";
		
		HttpSession session = request.getSession();
		String order_number = request.getParameter("order_number");
		System.out.println("2222222222222222222222"+order_number);
		
		List<C_P003VO> orderInfo = C_P003Service.selectOrderInfo(order_number);
		ModelAndView mavw6 = new ModelAndView(viewName);
		mavw6.addObject("orderInfo", orderInfo);
		return mavw6;
	}
	
	@Override
	@RequestMapping(value="/questionwrite2.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionwrite2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/notice.do";
		Map<String, Object> dataMap5 = new HashMap();
		HttpSession session=request.getSession();
		session=request.getSession(); 
		String mem_id = (String) session.getAttribute("mem_id");
		

		String order_number= request.getParameter("order_number");
		String qu_contents = request.getParameter("qu_contents");
		String sell_number = request.getParameter("sell_number");
		String sell_title = request.getParameter("sell_title");
		String sell_thumbnail = request.getParameter("sell_thumbnail");
				
	System.out.println(order_number);
		System.out.println(qu_contents);
		System.out.println(sell_number);
		System.out.println(sell_title);
		System.out.println(sell_thumbnail);
		
		
		dataMap5.put("mem_id", mem_id);
		dataMap5.put("order_number", order_number);
		dataMap5.put("qu_contents", qu_contents);
		dataMap5.put("sell_number", sell_number);
		dataMap5.put("sell_title", sell_title);
		dataMap5.put("sell_thumbnail", sell_thumbnail);
	
		
		System.out.println(dataMap5);
		
		C_P003Service.questionwrite(dataMap5);
		
		ModelAndView mavw6 = new ModelAndView(viewName);
		return mavw6;
	}


	
	@Override
	@RequestMapping(value="/questionwrite3.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionwrite3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "questionwrite3";
		ModelAndView mavw7 = new ModelAndView(viewName);
		return mavw7;
	}
	
	@Override
	@RequestMapping(value="/questionwrite4.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionwrite4(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/notice.do";
		Map<String, Object> dataMap6 = new HashMap();
		

		String mem_id = request.getParameter("mem_id");
		String de_division = request.getParameter("de_division");
		String de_contents = request.getParameter("de_contents");
	    

		System.out.println(mem_id);
		System.out.println(de_division);
		System.out.println(de_contents);
	

		dataMap6.put("mem_id", mem_id);
		dataMap6.put("de_division", de_division);
		dataMap6.put("de_contents", de_contents);
	
		
		System.out.println(dataMap6);
		
		C_P003Service.questionwrite3(dataMap6);
		
		ModelAndView mavw7 = new ModelAndView(viewName);
		return mavw7;
	}
    


	@Override
	@RequestMapping(value="/questionwrite5.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionwrite5(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "questionwrite5";
		ModelAndView mavw8 = new ModelAndView(viewName);
		return mavw8;
	}
	
	@Override
	@RequestMapping(value="/questionwrite6.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionwrite6(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/notice.do";
		Map<String, Object> dataMap7 = new HashMap();
		
		String qu_number = request.getParameter("qu_number"); 
		String mem_id = request.getParameter("mem_id");
		String qu_answer = request.getParameter("qu_answer");
	    
	    
	  
		System.out.println(qu_number);
		System.out.println(mem_id);
		System.out.println(qu_answer);
	
		dataMap7.put("qu_number", qu_number);
		dataMap7.put("mem_id", mem_id);
		dataMap7.put("qu_answer", qu_answer); 
	
		
		System.out.println(dataMap7);
		
		C_P003Service.questionwrite5(dataMap7);
		
		ModelAndView mavw8 = new ModelAndView(viewName);
		return mavw8;
	}

	
	
	@Override
	@RequestMapping(value="/questions2.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questions2(PageVO vo2 
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "questions2";
		int totals2 = C_P003Service.countBoard();
		System.out.println("컨트롤러"+totals2);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}

		
			vo2 = new PageVO(totals2, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
		
		List questionList2 = C_P003Service.listquestion2(vo2);
		ModelAndView mavw9 = new ModelAndView(viewName);
		mavw9.addObject("page", vo2);    
		mavw9.addObject("questionList2", questionList2);
		return mavw9;
	}


	@Override
	@RequestMapping(value="/questionDetail2.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionDetail2(@RequestParam("oq_number") String oq_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "questionDetail2";
		Map<String, Object> dataMap8 = new HashMap();
		Map<String, Object> resultMap8 = new HashMap();
		dataMap8.put("oq_number", oq_number);
		List<Map<String,Object>> noticeList7 = C_P003Service.questionDetail2(dataMap8);
		resultMap8 = noticeList7.get(0);
		System.out.println("controller실행"+noticeList7);
		ModelAndView mavw9 = new ModelAndView(viewName);
		mavw9.addObject("resultMap8", resultMap8);                  
		return mavw9;             
	}


	@Override
	@RequestMapping(value="/questionresponse.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionresponse(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "questionresponse";
		
		HttpSession session = request.getSession();
		String qu_number = request.getParameter("qu_number");
		
		List<C_P003VO> responseInfo= C_P003Service.responseInfo(qu_number);
		ModelAndView mavw10 = new ModelAndView(viewName);
		mavw10.addObject("responseInfo", responseInfo);
		return mavw10;
	}
	
	@Override
	@RequestMapping(value="/questionresponse2.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionresponse2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/notice.do";
		Map<String, Object> dataMap10 = new HashMap();
		HttpSession session=request.getSession();
		session=request.getSession(); 
		String mem_id = (String) session.getAttribute("mem_id");
		

		String qu_number= request.getParameter("qu_number");
		String qu_contents = request.getParameter("qu_contents");
		String qu_answer= request.getParameter("qu_answer");
		String sell_title = request.getParameter("sell_title");
		String sell_thumbnail = request.getParameter("sell_thumbnail");
				
	System.out.println(qu_number);
		System.out.println(qu_contents);
		System.out.println(qu_answer);
		System.out.println(sell_title);
		System.out.println(sell_thumbnail);
		
		
		dataMap10.put("mem_id", mem_id);
		dataMap10.put("qu_number", qu_number);
		dataMap10.put("qu_contents", qu_contents);
		dataMap10.put("qu_answer", qu_answer);
		dataMap10.put("sell_title", sell_title);
		dataMap10.put("sell_thumbnail", sell_thumbnail);
	
		
		System.out.println(dataMap10);
		
		C_P003Service.responseInfo2(dataMap10);
		
		ModelAndView mavw10 = new ModelAndView(viewName);
		return mavw10;
	}

	
	
	@Override
	@RequestMapping(value="/question.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView question(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "question";
		
		HttpSession session10 = request.getSession();
		String mem_id = request.getParameter("mem_id");
		System.out.println("2222222222222222222222"+mem_id);
		
		List<C_P003VO> question = C_P003Service.selectQuestion(mem_id);
		ModelAndView mavw11 = new ModelAndView(viewName);
		mavw11.addObject("question", question);
		return mavw11;
	}
	
	@Override
	@RequestMapping(value="/question2.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView question2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/notice.do";
		Map<String, Object> dataMap11 = new HashMap();
		HttpSession session=request.getSession();
		session=request.getSession(); 
		String mem_id = (String) session.getAttribute("mem_id");
		

		String de_contents= request.getParameter("de_contents");
		String de_division= request.getParameter("de_division");
		
		
		System.out.println(mem_id);
	    System.out.println(de_contents);
		System.out.println(de_division);
		
		
		
		dataMap11.put("mem_id", mem_id);
		dataMap11.put("de_contents", de_contents);
		dataMap11.put("de_division", de_division);

	
		
		System.out.println(dataMap11);
		
		C_P003Service.dequestion(dataMap11);
		
		ModelAndView mavw11 = new ModelAndView(viewName);
		return mavw11;
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
