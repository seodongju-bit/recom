package project.F.P002.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.F.P002.service.F_P002Service;
import project.F.P002.vo.F_P002VO;




@Controller("F_P002Controller")
public class F_P002ControllerImpl   implements F_P002Controller {
	@Autowired
	F_P002Service f_P002Service;
	@Autowired
	F_P002VO f_P002VO;
	
	@Override
	@RequestMapping(value="/sellItems.do" ,method ={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchSell(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);

		viewName = "sellItems";
		String p_id= request.getParameter("sell_no");
		String recom = request.getParameter("recom");
		if(p_id==null || p_id=="") {
			ModelAndView mav = new ModelAndView("redirect:category.do");
			return mav;
		}
		//sell_no 검사: db에 해당 판매글 없으면 잘못된페이지 표시
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);
		List list = f_P002Service.selectItem(searchMap);
		if(!list.isEmpty()) {
			f_P002VO = (F_P002VO)list.get(0);
		}else {
			ModelAndView mav = new ModelAndView("redirect:category.do");
			return mav;
		}
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("searchItem", f_P002VO);
		if(recom!=null) { //추천리뷰어 가 있을때
			List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
			searchMap = new HashMap<String, Object>();
			searchMap.put("p_id", recom);
			result = f_P002Service.searchReviewInfo(searchMap);
			System.out.println(result);
			if(result.size()!=0) {
				mav.addObject("reiewer", result.get(0));
			}
		}
		return mav;
	}
	
	///로드 페이지
	@RequestMapping(value="/itemsInfoLoad.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView itemsInfoLoad(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "itemsInfoLoad";
		Map<String, Object> searchMap = new HashMap<String, Object>();

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("content", request.getParameter("contents"));
		mav.addObject("brand", request.getParameter("brand"));
		return mav;
	}
	
	@RequestMapping(value="/sellItemsReview.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellItemsReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "sellItemsReview";
		request.setAttribute("sell_number", request.getParameter("sell_number"));
		ModelAndView mav = new ModelAndView(viewName);
		Map<String, Object> searchMap = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();//전체조회
		List<Map<String, Object>> monthBestResult = new ArrayList<Map<String, Object>>();//월간 best리뷰
		List<Map<String, Object>> totalBestresult = new ArrayList<Map<String, Object>>();//best리뷰
		
		int page = Integer.parseInt(request.getParameter("page"));
		searchMap.put("sell_number", request.getParameter("sell_number"));
		result = f_P002Service.searchReview(searchMap, 1);
		monthBestResult = f_P002Service.searchReview(searchMap, 2);
		totalBestresult = f_P002Service.searchReview(searchMap, 3);
		
		result = f_P002Service.paging(result, page);
		mav.addObject("pageInfo", result.get(result.size()-1));
		result.remove(result.size()-1);
		mav.addObject("reviewList" , result);
		mav.addObject("reviewMonthList" , monthBestResult);
		mav.addObject("reviewTotalList" , totalBestresult);
		return mav;
	}
	
	@RequestMapping(value="/proOpinion.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView proOpinion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "proOpinion";
		//Map<String, Object> searchMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@RequestMapping(value="/exchangeInfo.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView exchangeInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "exchangeInfo";
		//Map<String, Object> searchMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/searchOption.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> searchOption(@RequestParam(value="p_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		searchMap.put("p_id", p_id);	 
		
		List list = null;
		try {
			list = f_P002Service.searchOption(searchMap);
			System.out.println("======>"+list);
			for(int i=0; i < list.size();i++) {
				f_P002VO = (F_P002VO)list.get(i);
				resultMap = BeanUtils.describe(f_P002VO);
				result.add(resultMap);
			}
		}catch(Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "error_text");
			e.printStackTrace();
		}

		return result;
	}

	
	@Override
	@RequestMapping(value = "/addBasket.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> addBasket(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");
		List<Map<String, Object>> list = createModel(request);
		
		Map<String, Object> Map = new HashMap<String, Object>();
		for(int i=0;i<list.size();i++) {
			list.get(i).put("p_id", p_id);
			System.out.println(list.get(i));
			f_P002Service.addBasket(list.get(i));
		}
		return Map;
	}
	
	//readReview
	@RequestMapping(value="/readReview.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView readReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "readReview";
		String review_number = request.getParameter("review");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", review_number);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		result = f_P002Service.searchReviewInfo(searchMap);
		//Map<String, Object> searchMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reviewInfo", result.get(0));
		return mav;
	}
	
	@RequestMapping(value="/reviewRankingMenu.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewRankingMenu(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "reviewRankingMenu";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@RequestMapping(value="/bestReviewPlusMenu.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bestReviewPlusMenu(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "bestReviewPlusMenu";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@RequestMapping(value="/reviewRanking.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewRanking(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "reviewRanking";
		ModelAndView mav = new ModelAndView(viewName);
		String ctgrNum = request.getParameter("ctgrNum");
		request.setAttribute("ctgrNum", ctgrNum);
		if(ctgrNum==null || ctgrNum=="") {
			ctgrNum = "H________";
		}else if(ctgrNum.length()==4) {
			ctgrNum+="_____";
		}
		//전체,대분류별,소뷴류별/ 가장 인기있는 리뷰  /가장 리뷰가 많이 달린 제품&거기서 인기있는 리뷰3 / 가장 최근 등록된 리뷰 중 추천 3개 이상 받은거 
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", ctgrNum);
		List<Map<String, Object>> result1 = f_P002Service.searchReviewRank(searchMap);
		List<Map<String, Object>> result2 = f_P002Service.searchProRank(searchMap);
		List<Map<String, Object>> result3 = f_P002Service.searchReviewList(searchMap);
		
		String p = request.getParameter("page");
		int page = 1;
		if(p!=null) {
			page = Integer.parseInt(p);
		}
		result3 = f_P002Service.paging(result3, page);
		mav.addObject("pageInfo", result3.get(result3.size()-1));
		result3.remove(result3.size()-1);
		
		result3 = f_P002Service.thumbnail(result3);
		//System.out.println("bestReview:"+result2);
		
		mav.addObject("bestReview",result1);
		mav.addObject("bestProduct",result2);
		mav.addObject("reviewList" , result3);
		return mav;
	}
	
	@RequestMapping(value="/bestReviewPlus.do" ,method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bestReviewPlus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "bestReviewPlus";
		ModelAndView mav = new ModelAndView(viewName);
		String ctgrNum = request.getParameter("ctgrNum");
		request.setAttribute("ctgrNum", ctgrNum);
		if(ctgrNum==null || ctgrNum=="") {
			ctgrNum = "H________";
		}else if(ctgrNum.length()==4) {
			ctgrNum+="_____";
		}
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", ctgrNum);
		List<Map<String, Object>> result = f_P002Service.bestReviewPlus(searchMap);

		mav.addObject("bestReview",result);
		return mav;
	}
	
	public List<Map<String, Object>> createModel(HttpServletRequest request){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap= new HashMap<String, Object>();
		String size="";
		String color="";
		int i=1;
		while(true) {
			if(request.getParameter("quantity"+i)==null || request.getParameter("quantity"+i)=="") { break; }
			if(request.getParameter("size"+i)==null) {size="-1";}
			else {size=request.getParameter("size"+i);}
			if(request.getParameter("color"+i)==null) {color="-1";}
			else {color=request.getParameter("color"+i);}
			resultMap = new HashMap<String, Object>();
			resultMap.put("sell_number", request.getParameter("sell_number"));
			resultMap.put("quantity", request.getParameter("quantity"+i));
			resultMap.put("size",size);
			resultMap.put("color",color);
			result.add(resultMap);
			i++;
		}
		return result;
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

