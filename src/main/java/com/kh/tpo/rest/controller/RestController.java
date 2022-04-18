package com.kh.tpo.rest.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tpo.rest.common.pagination;
import com.kh.tpo.rest.domain.PageInfo;
import com.kh.tpo.rest.domain.Rest;
import com.kh.tpo.rest.domain.RestInfo;
import com.kh.tpo.rest.domain.Search;
import com.kh.tpo.rest.service.RestService;

@Controller
public class RestController {
	//
	@Autowired
	private RestService reService;

	// insert 삽입
	@RequestMapping(value = "test.tpo", method = RequestMethod.GET)
	public void insertRest(ArrayList<Rest> list) throws IOException {
		/*
		 * Retest reste = new Retest(); reste.MacthList();
		 */
		// System.out.println(list.toString());
		list = APIInfo.restAPI();
		int result = reService.insertRest(list);
		if (result > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}

	}

	// 전체 조회
	@RequestMapping(value = "restList.tpo", method = RequestMethod.GET)
	public ModelAndView restList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (Integer) ((page != null) ? page : 1);
		int listCount = reService.getListCount();
		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		ArrayList<Rest> rList = reService.restSearchList(pi);
		if (!rList.isEmpty()) {
			mv.addObject("rList", rList);
			mv.addObject("pi", pi);
			mv.setViewName("rest/restList");
		} else {
			mv.addObject("msg", "숙소 리스트 조회 실패");
		}
		return mv;
	}

	// 상세조회
	@RequestMapping(value = "restDetail.tpo", method = RequestMethod.GET)
	public ModelAndView restOne(ModelAndView mv, Rest rest, int reNo, Integer page) {
		reService.addReadCount(reNo);
		int currentPage = page != null ? page : 1;
		/* Rest rlist = reService.restSearchOne(rest); */
		// room 나오게 하기
		ArrayList<RestInfo> room = reService.roomSearchList(reNo);
		// System.out.println(rest.toString());
		if (room != null) {
//			mv.addObject("room", room).addObject("currentPage", currentPage).addObject("rest", rlist).setViewName("rest/restOne");
			mv.addObject("room", room).addObject("currentPage", currentPage).setViewName("rest/restOne");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패");
			mv.setViewName("rest/restOne");
		}
		return mv;
	}

	// 숙소명 조회
	@RequestMapping(value = "rNameSearch.tpo", method = RequestMethod.GET)
	public String rNameSearch(Model model, Search search,
			@RequestParam(value = "page", required = false) Integer page) {
		// System.out.println(search.toString());
		int currentPage = (Integer) ((page != null) ? page : 1);
		int listCount = reService.getSearchCount(search);
		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		ArrayList<Rest> rList = reService.SearchrName(search, pi);
		// System.out.println("넘긴 값 : " + search.toString());
		// System.out.println("페이지 값 : " + pi.toString());
		if (!rList.isEmpty()) {
			model.addAttribute("rList", rList);
			model.addAttribute("search", search);
			model.addAttribute("pi", pi);
			return "rest/restList";
		} else {
			model.addAttribute("msg", "게시글 상세조회 실패");
			return "rest/restList";
		}
	}

	// 정렬
	@RequestMapping(value = "alignList.tpo", method = RequestMethod.GET)
	public ModelAndView alignRest(ModelAndView mv, Search search,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (Integer) ((page != null) ? page : 1);
		int listCount = reService.getSearchCount(search);
		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		// System.out.println( "search : " + search.toString());
		ArrayList<RestInfo> rList = reService.alignList(search, pi);
		// System.out.println("rList : " + rList.toString());
		if (!rList.isEmpty()) {
			mv.addObject("rList", rList);
			mv.addObject("search", search);
			mv.addObject("pi", pi);
			mv.setViewName("rest/restList");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패");
			mv.setViewName("rest/restList");
		}
		return mv;
	}
	
	//ajax사용x 최저 최고 금액 조회
	@RequestMapping(value="rPriceSearch.tpo", method=RequestMethod.GET)
	public ModelAndView rPriceSearch(ModelAndView mv, Search search, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (Integer) ((page != null) ? page : 1);
		int listCount = reService.getSearchCount(search);
		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		ArrayList<RestInfo> rList = reService.searchPrice(search, pi);
		if (!rList.isEmpty()) {
			mv.addObject("rList", rList);
			mv.addObject("search", search);
			mv.addObject("pi", pi);
			mv.setViewName("rest/restList");
		} else {
			mv.addObject("msg", "금액에 맞는 숙소가 존재하지 않습니다");
			mv.setViewName("rest/restList");
		}
		return mv;
	}

	

	// 지역, 객실, 인원 검색
	@RequestMapping(value = "searchAllList.tpo", method = RequestMethod.GET)
	public ModelAndView searchAllList(ModelAndView mv, Search search,
			@RequestParam(value = "page", required = false) Integer page) {
		// System.out.println( "search : " + search.toString());
		int currentPage = (Integer) ((page != null) ? page : 1);
		int listCount = reService.getSearchCount(search);
		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		ArrayList<RestInfo> rList = reService.searchAllList(search, pi);
		// System.out.println("rList 결과값: " + rList.toString());
		// System.out.println(pi.toString());
		if (!rList.isEmpty()) {
			mv.addObject("rList", rList);
			mv.addObject("search", search);
			mv.addObject("pi", pi);
			mv.setViewName("rest/restList");
		} else {
			mv.addObject("msg", "제시한 검색어와 부합하는 숙소가 존재하지 않습니다.");
			mv.setViewName("rest/restList");
		}
		return mv;
	}

	// 최저, 최고금액 조회
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "searchPrice.tpo", method = RequestMethod.GET) public
	 * void priceSearch(HttpServletResponse response, Search search) throws
	 * Exception { ArrayList<RestInfo> rList = reService.searchPrice(search); //
	 * System.out.println("rList : " + rList.toString());
	 * response.setContentType("application/json");
	 * response.setCharacterEncoding("utf-8"); new Gson().toJson(rList,
	 * response.getWriter());
	 * 
	 * if(!rList.isEmpty()) { model.addAttribute("rList", rList);
	 * model.addAttribute("search", search); return "success"; }else {
	 * model.addAttribute("msg", "게시글 상세조회 실패"); return "fail"; }
	 * 
	 * }
	 */

	// 최고금액 설정x
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="searchRowPrice.tpo", method=RequestMethod.GET) public
	 * void priceRowSearch(HttpServletResponse response, Search search) throws
	 * Exception { // System.out.println(search.toString()); ArrayList<RestInfo>
	 * rList = reService.priceRowSearch(search); //System.out.println("rList : " +
	 * rList.toString()); response.setContentType("application/json");
	 * response.setCharacterEncoding("utf-8"); new Gson().toJson(rList,
	 * response.getWriter());
	 * 
	 * if(!rList.isEmpty()) { model.addAttribute("rList", rList);
	 * model.addAttribute("search", search); return "success"; }else {
	 * model.addAttribute("msg", "게시글 상세조회 실패"); return "fail"; }
	 * 
	 * }
	 */

	// 지역 검색
		/*
		 * @ResponseBody
		 * 
		 * @RequestMapping(value = "searchLocation.tpo", method = RequestMethod.GET)
		 * public Map<String, Object> localSearch(HttpServletResponse response, Search
		 * search,
		 * 
		 * @RequestParam(value = "page", required = false) Integer page) throws
		 * Exception { int currentPage = (Integer) ((page != null) ? page : 1); int
		 * listCount = reService.getSearchCount(search); PageInfo pi =
		 * pagination.getPageInfo(currentPage, listCount); ArrayList<RestInfo> rList =
		 * reService.searchLocal(search, pi);
		 * 
		 * for(RestInfo s : rList) {
		 * s.setCheckIn(URLEncoder.encode(s.getCheckIn(),"utf-8"));
		 * s.setCheckout(URLEncoder.encode(s.getCheckout(),"utf-8"));
		 * s.setClcik(s.getClcik()); s.setpLimit(s.getpLimit());
		 * s.setpMaxCount(s.getpMaxCount()); s.setpStatus(s.getpStatus());
		 * s.setpTotal(s.getpTotal());
		 * s.setReAddr(URLEncoder.encode(s.getReAddr(),"utf-8"));
		 * s.setReFacility(URLEncoder.encode(s.getReFacility(),"utf-8"));
		 * s.setReImage(URLEncoder.encode(s.getReImage(),"utf-8"));
		 * s.setReInfo(URLEncoder.encode(s.getReInfo(),"utf-8"));
		 * s.setReName(URLEncoder.encode(s.getReName(),"utf-8"));
		 * s.setReNo(s.getReNo());
		 * s.setRePhone(URLEncoder.encode(s.getRePhone(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * s.setReUrl(URLEncoder.encode(s.getReUrl(),"utf-8"));
		 * 
		 * 
		 * HashMap<String, Object> localMap = new HashMap<String, Object>();
		 * localMap.put("pi", pi); localMap.put("rList", rList); return localMap; }
		 */
}
