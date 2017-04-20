package com.server.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.server.dto.SCurentPageDTO;
import com.server.dto.SProductLevelDTO;
import com.server.rpc.SProductMsService;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月5日  新建  
*/
@Controller
@RequestMapping("/product")
public class ProductController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SProductMsService spProductMsService;
	
	@Autowired
	private UserMsService userMsService;
 	
	@RequestMapping("/view/{prodId}")
	public ModelAndView productDetail(@PathVariable("prodId") String prodId, HttpSession httpSession, ModelAndView modelAndView) {
		logger.info("*******调用产品详情显示控制，prodId={}********", prodId);
		String userId = (String) httpSession.getAttribute("userId");
		if(userId == null) {
			modelAndView.addObject("shopCarCount", 0);
			modelAndView.addObject("isFavor", -99);
			logger.info("*******调用产品详情显示控制1，isFavor={}********", -99);	
		} else {
			int isFavor = userMsService.isFavorByUIdProdId(userId, prodId);
			modelAndView.addObject("isFavor", isFavor);  //0代表收藏 -99没有收藏
			logger.info("*******调用产品详情显示控制2，isFavor={}********", isFavor);	
			Integer count = userMsService.getMyShopCartCount(userId);
			modelAndView.addObject("shopCarCount", count);
		}
		SProductLevelDTO sproductDTO = spProductMsService.getProductDetail(prodId);
		modelAndView.setViewName("/admin/views");
		modelAndView.addObject("productDetail", sproductDTO);
		return modelAndView;
	}
	
	@RequestMapping("/getHotList")
	@ResponseBody
	public List<SProductLevelDTO> getProductHotList(SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取热门商品列表************");
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getProductHot(sCurentPageDTO);
		return list;
	}
	
	@RequestMapping("/getNewList")
	@ResponseBody
	public List<SProductLevelDTO> getProductNewList(SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取新品商品列表************");
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getProductNew(sCurentPageDTO);
		return list;
	}
	
	@RequestMapping("/getBandList/{bandId}")
	@ResponseBody
	public List<SProductLevelDTO> getBandList(@PathVariable("bandId") String bandId, SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取品牌商品列表************");
		logger.info("*******bandId = {}********", bandId);
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getBandList(bandId, sCurentPageDTO);
		return list;
	}
	
	@RequestMapping("/getsortList/{sortId}")
	@ResponseBody
	public List<SProductLevelDTO> getSortList(@PathVariable("sortId") String sortId, SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取品牌商品列表************");
		logger.info("*******sortId = {}********", sortId);
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getSortList(sortId, sCurentPageDTO);
		return list;
	}
	
	@RequestMapping("/getmoreList/{more}")
	@ResponseBody
	public List<SProductLevelDTO> getmoreList(@PathVariable("more") Integer more, SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取品牌商品列表************");
		logger.info("*******more = {}********", more);
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getMoreList(more, sCurentPageDTO);
		return list;
	}
	
	
	
}
